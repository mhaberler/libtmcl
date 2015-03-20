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


#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>

#include "motor.h"
#include "interface.h"
#include "tmcldefs.h"
#include "debug.h"

int tmcl_init_motor(TMCLMotor **mot, TMCLInterface *iface, TMCLModel model,
                    uint8_t address, uint8_t bank, TMCLBusType bus) {

    DEBUG("tmcl_init_motor() address: %d, bank: %d\n", address, bank);

    *mot = (TMCLMotor*)malloc(sizeof(TMCLMotor));

    if(mot == NULL)
        return -1;

    (*mot)->device.model 	= model;
    (*mot)->device.address 	= address;
    (*mot)->device.bank 	= bank;
    (*mot)->device.bus		= bus;
    (*mot)->iface 			= iface;
    
    (*mot)->device.num_refswitches = 0;

    tmcl_init(&((*mot)->device));

//    if(tmcl_get_all_axis_parameter(*mot) < 0)
//        return -1;

    return 0;

}

void tmcl_deinit_motor(TMCLMotor **mot) {

    (*mot)->device.address = 0;
    (*mot)->device.bank 	= 0;
    (*mot)->device.bus 	= TMCL_NONE;
    (*mot)->iface 		= NULL;

    tmcl_deinit(&((*mot)->device));

    free(*mot);
}

int tmcl_send_command(TMCLMotor *mot, TMCLCommand tcom, TMCLReply *reply) {

    uint8_t datagram[TMCL_MAX_DGRAM_SIZE];
    int length = 0;
    int ret = 0;
    TMCLReply tmp_reply;
    char reply_buf[TMCL_MAX_DGRAM_SIZE];
    int reply_length = 0;

    struct timespec timewait; /* How long to wait for reading after write() */
    /* Inititalize the timewait structure */
    timewait.tv_sec  = mot->iface->timewait_sec;
    timewait.tv_nsec = mot->iface->timewait_msec * 1e6;


    length = tmcl_datagram(datagram, mot->device, tcom.command, tcom.type, tcom.value);

    DEBUG("writing datagram 0x%02X,%02X,%02X,%02X,%02X,%02X,%02X,%02X,%02X of length %d\n",\
          datagram[0], datagram[1], datagram[2], datagram[3], datagram[4], datagram[5],\
          datagram[6], datagram[7], datagram[8], length);

    if( mot->iface->_write(mot->iface, datagram, length, mot->iface->tmcl_write_void) ==  -1) { /* An error ocurred */
        DEBUG("Error in write\n");
        return -1;
    }

    /* Give the board some time to fill the input buffer */

    if(nanosleep(&timewait, NULL) == -1) {
        perror("nanosleep");
    }
    
    /* Every command sends a reply. You shouldn't send another command before the
     * reply is received */
    reply_length = mot->iface->_read(mot->iface, reply_buf, mot->iface->tmcl_read_void);
    if(reply_length == -2) {
        DEBUG("Reading failed.\n");
        /* TODO: explain this hack */
        DEBUG("HACK: Trying to poll again.\n");
        reply_length = mot->iface->_read(mot->iface, reply_buf, mot->iface->tmcl_read_void);
        if(  reply_length < 0 ) { /* This is a hack */
            DEBUG("Reading failed again.\n");
            return -1;
        }
    }

    /* Convert answer to a TMCL reply */
    ret = tmcl_dgram2reply(&tmp_reply, (uint8_t*)reply_buf, reply_length);

    if(ret != 0)
        return -2;

    if(tmp_reply.status != TMCL_STATUS_SUCCESS) {
        ret = -3;
        DEBUG("TMCL reply != STATUS_SUCCESS\n");
    }


    if(reply != NULL) {
        memcpy(reply, &tmp_reply, sizeof(TMCLReply));
        DEBUG("REPLY:\n");
        DEBUG("module address: %d\n", reply->module_address);
        DEBUG("status: %d\n", reply->status);
        DEBUG("command: %d\n", reply->command);
        DEBUG("value: %d\n", reply->value);
        DEBUG("tmcl_dram2reply() END\n");
    }
    DEBUG("send_command returning %d\n", ret);

    return ret;
}

int tmcl_update_axis_parameter(TMCLMotor *mot, int tmcl_parameter) {

    TMCLReply reply;
    TMCLCommand command;

    command.command = TMCL_GAP;
    command.type = tmcl_parameter;

    if((tmcl_parameter > TMCL_MAX_PAR_NO) || (tmcl_parameter < 0 )) {
        DEBUG("Invalid TMCL Parameter: %d\n", tmcl_parameter);
        return -1;
    }

    DEBUG("Getting axis parameter %d\n", tmcl_parameter);

    if(tmcl_send_command(mot, command, &reply) < 0) {
        DEBUG(("send_command failed.\n"));
        return -1;
    }

    DEBUG("Axis parameter %d has value %d\n", tmcl_parameter, reply.value);

    /* These assert should not fail. Because then tmcl_send_command should have returned -1 */
    assert(reply.status == TMCL_STATUS_SUCCESS);
    assert(reply.command == TMCL_GAP);

    mot->device.parameter[tmcl_parameter] = reply.value;

    return 0;

}

int tmcl_get_axis_parameter(TMCLMotor *mot, int axis_parameter) {
	

    if(tmcl_update_axis_parameter(mot, axis_parameter) < 0) {
        DEBUG("getting axis parameter failed %d failed\n", axis_parameter);
        return -1;
    }

    return mot->device.parameter[axis_parameter];
}

int tmcl_set_axis_parameter(TMCLMotor *mot, int axis_parameter, int value) {

    TMCLReply reply;
    TMCLCommand command;

    command.command = TMCL_SAP;
    command.type = axis_parameter;
    command.value = value;

    if((axis_parameter > TMCL_MAX_PAR_NO) || (axis_parameter < 0 )) {
        DEBUG("Invalid axis Parameter: %d\n", axis_parameter);
        return -1;
    }

    if(tmcl_send_command(mot, command, &reply) < 0) {
        DEBUG("send_command failed.\n");
        return -1;
    }

    DEBUG("(set_axix_par) Axis parameter %d has value %d\n", axis_parameter, reply.value);

    assert(reply.status == TMCL_STATUS_SUCCESS);
    assert(reply.command == TMCL_SAP);
    mot->device.parameter[axis_parameter] = reply.value;

    return 0;

}

int tmcl_store_axis_parameter(TMCLMotor *mot, int axis_parameter) {

    TMCLReply reply;
    TMCLCommand command;

    command.command = TMCL_STAP;
    command.type = axis_parameter;
    command.value = 0;

    if((axis_parameter > TMCL_MAX_PAR_NO) || (axis_parameter < 0 )) {
        DEBUG("Invalid axis Parameter: %d\n", axis_parameter);
        return -1;
    }

    if(tmcl_send_command(mot, command, &reply) < 0) {
        DEBUG("send_command failed.\n");
        return -1;
    }

    assert(reply.status == TMCL_STATUS_SUCCESS);
    assert(reply.command == TMCL_STAP);
    mot->device.parameter[axis_parameter] = reply.value;

    return 0;

}

// TODO Fix this function
//int tmcl_get_all_axis_parameter(TMCLMotor *mot) {
//
//    int i;
//
//    for(i=0; i<=14; i++) {
//        if(tmcl_update_axis_parameter(mot, i) < 0)
//            return -1;
//    }
//
//    if(mot->device.model == TMCM100) {
//        for(i=14; i<=35; i++) {
//            if(tmcl_update_axis_parameter(mot, i) < 0)
//                return -1;
//        }
//    }
//
//    if( (mot->device.model == TMCM3xx)
//            || (mot->device.model == TMCM110)
//            || (mot->device.model == TMCM61x) ) {
//
//        if(tmcl_update_axis_parameter(mot, 130) < 0)
//            return -1;
//
//        for(i=135; i<=154; i++) {
//            if(tmcl_update_axis_parameter(mot, i) < 0)
//                return -1;
//        }
//
//        for(i=193; i<=198; i++) {
//            if(tmcl_update_axis_parameter(mot, i) < 0)
//                return -1;
//        }
//
//        if(tmcl_update_axis_parameter(mot, 200) < 0)
//            return -1;
//
//        for(i=203; i<=206; i++) {
//            if(tmcl_update_axis_parameter(mot, i) < 0)
//                return -1;
//        }
//
//        for(i=208; i<=211; i++) {
//            if(tmcl_update_axis_parameter(mot, i) < 0)
//                return -1;
//        }
//
//    }
//
//    return 0;
//
//}
