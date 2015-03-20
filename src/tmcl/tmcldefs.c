/* Copyright (c) 2015, Ralf Schulze <ralf.schulze@gmx.net>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions 
 * are met:

 * 1. Redistributions of source code must retain the above copyright notice, 
 *    this list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file tmcldefs.c
 * 
 * Internal functions
*/

#include <assert.h>

#include "tmcldefs.h"
#include "motor.h"

#include "debug.h"

/**
 * @todo Document this.
 */
void tmcl_init(TMCLDevice *device) {

    int i;
    DEBUG("tmcl_init()\n");
    for(i = 1; i <= TMCL_MAX_PAR_NO; i++) {
        device->parameter[i] = 0;
    }

}

/**
 * @todo Document this.
 */
void tmcl_deinit(TMCLDevice *device) {

    /* ... */
}


/**
 * 
 * @param commands Buffer containing the datagram
 * @param length length of datagram
 * @return Checksum
 * @see #TMCL_DGRAM_SIZE_CAN, #TMCL_DGRAM_SIZE_RSXXX, #TMCL_DGRAM_SIZE_IIC
 */
uint8_t tmcl_checksum(uint8_t *commands, int length) {

    uint8_t checksum = 0;
    int i;

    for(i=0; i < length; i++) {
        checksum += ((*commands++) & 0xFF);
    }

    return checksum;
}

/**
 * @param datagram  Buffer to store the datagram
 * @param device        The device for which the datagram is intended
 * @param command   The @ref TMCLComm "command" 
 * @param type           Type
 * @param value         Value
 * @return Length of datagram
 * @see @ref TMCLComm "TMCL Commands"
 */
int tmcl_datagram(uint8_t *datagram,
                  TMCLDevice device, uint8_t command, uint8_t type, uint32_t value) {

    int pos = 0; /* Current position in datagram */
    int dgram_length = 0; /* Length of Datagram; */

    int i;

    switch(device.bus) {
    case TMCL_RSXXX:
        dgram_length = TMCL_DGRAM_SIZE_RSXXX;
        break;
    case TMCL_CAN:
        dgram_length = TMCL_DGRAM_SIZE_CAN;
        break;
    case TMCL_IIC:
        dgram_length = TMCL_DGRAM_SIZE_IIC;
        break;
    case TMCL_NONE:
    default:
    	return -1; /* Invalid bus */
    }
    
    /* Clear datagram */
    for(i=0; i < dgram_length; i++) {
        datagram[i] = 0;
    }

    if(device.bus == TMCL_RSXXX) { /* address is only needed for RS232/RS485 */
        datagram[pos++] = device.address;
    }

    datagram[pos++] = command;
    datagram[pos++] = type;
    datagram[pos++] = device.bank;
    datagram[pos++] = (value >> 24) & 0xFF;
    datagram[pos++] = (value >> 16) & 0xFF;
    datagram[pos++] = (value >>  8) & 0xFF;
    datagram[pos++] = value & 0xFF;

    if(device.bus != TMCL_CAN) {	/* CAN bus needs no checksum */
        datagram[pos] = tmcl_checksum(datagram, pos);
        pos++;
    }

    assert(dgram_length == pos); /* Just to be sure.. */

    return dgram_length;
}

/**
 * @param reply The @ref tmcl_reply "reply" of the module
 * @return 
 *               - 1 on good checksum
 *               - 0 on bad checksum 
 */
int tmcl_valid_checksum(TMCLReply reply) {

    uint8_t datagram[8];

    if(reply.reply_address == 0) { /* Reply address is 0 for CAN Bus which has no checksum */
        return 2;
    }

    datagram[0] = reply.reply_address;
    datagram[1] = reply.module_address;
    datagram[2] = reply.status;
    datagram[3] = reply.command;
    datagram[4] = (reply.value >> 24) & 0xFF;
    datagram[5] = (reply.value >> 16) & 0xFF;
    datagram[6] = (reply.value >>  8) & 0xFF;
    datagram[7] = reply.value & 0xFF;

    if(reply.checksum == tmcl_checksum(datagram, 8)) {
        return 1;
    } else {
        return 0;
    }

}

/**
 * 
 * @param reply @ref tmcl_reply structure to store the data
 * @param datagram The datagram received from the module
 * @param length Lengh of the datagram
 * @return 
 *               -  0 on success
 *               - -1 undefined length
 */
int tmcl_dgram2reply(TMCLReply *reply, uint8_t *datagram, int length) {

    int pos = 0; /* Current position in datagram */
    DEBUG("tmcl_dgram2reply(), length=%d\n", length);
    DEBUG("dgram2reply datagram 0x%02X,%02X,%02X,%02X,%02X,%02X,%02X,%02X,%02X of length %d\n",\
              datagram[0], datagram[1], datagram[2], datagram[3], datagram[4], datagram[5],\
              datagram[6], datagram[7], datagram[8], length);
    switch(length) {
    case TMCL_DGRAM_SIZE_RSXXX:
        reply->reply_address = datagram[pos++];
        reply->checksum		 = datagram[TMCL_DGRAM_SIZE_RSXXX-1] ;
        break;
    case TMCL_DGRAM_SIZE_CAN:
        reply->reply_address 	= 0;
        reply->checksum 		= 0;
        break;
    default: /* Undefined length */
        return -1;
    }

    reply->module_address	= datagram[pos++];
    reply->status			= datagram[pos++];
    reply->command			= datagram[pos++];
    reply->value	 = (( datagram[pos++] & 0xFF ) << 24);
    reply->value     |= (( datagram[pos++] & 0xFF ) << 16);
    reply->value     |= (( datagram[pos++] & 0xFF ) << 8);
    reply->value     |= (( datagram[pos++] & 0xFF ) );

    DEBUG("module address: %d\n", reply->module_address);
    DEBUG("status: %d\n", reply->status);
    DEBUG("command: %d\n", reply->command);
    DEBUG("value: %d\n", reply->value);
    DEBUG("tmcl_dgram2reply() END\n");

    /* TODO: Insert proper assert() */
    return 0;
}
