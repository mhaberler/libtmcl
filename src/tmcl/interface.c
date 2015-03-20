/*
 * interface.c
 *
 * Functions common to parallel port interfaces
 *
 */
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



/* Include autoconf 'config.h' */
#if HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */

#include <stdlib.h>
#include <string.h>
#include "debug.h"
#include "interface.h"
#include "rsXXX.h" 

#define DEFAULT_TIMEOUT_S 		2 	/**< Default timeout for reading from interface (in seconds) */
#define DEFAULT_TIMEWAIT_MS		50  /**< Default time to wait for reply from board (milliseconds) */

int tmcl_init_interface(TMCLInterface **iface, TMCLBusType bus, tmcl_open_funcPtr open_func, tmcl_close_funcPtr close, tmcl_read_funcPtr read, tmcl_write_funcPtr write) {

	*iface = (TMCLInterface*)malloc(sizeof(TMCLInterface));
	
	if(*iface == NULL)
		return -1;
	
    (*iface)->bus = bus;
    (*iface)->timeout_sec   = DEFAULT_TIMEOUT_S;
    (*iface)->timeout_msec  = 0;
    (*iface)->timewait_sec  = 0;
    (*iface)->timewait_msec = DEFAULT_TIMEWAIT_MS;
    
    (*iface)->tmcl_open_void = NULL;
    (*iface)->tmcl_close_void = NULL;
    (*iface)->tmcl_read_void = NULL;
    (*iface)->tmcl_write_void = NULL;
    
    /* First set default open, close, ... functions */
    switch(bus) {
    case TMCL_RSXXX:
        (*iface)->_open = tmcl_open_rsXXX;
        (*iface)->_close = tmcl_close_rsXXX;
        (*iface)->_write = tmcl_write_rsXXX;
        (*iface)->_read = tmcl_poll_rsXXX;
        break;
    case TMCL_CAN:
    case TMCL_IIC:
        /* Currently unsupported */
        return -1;
        (*iface)->_open = NULL;
        (*iface)->_close = NULL;
        (*iface)->_write = NULL;
        (*iface)->_read = NULL;
    default: /* Unupported bus */
        return -1;
    }

    /* Now override with custom ones if desired */
    if (open_func != NULL)
        (*iface)->_open = open_func;
    if(close != NULL)
        (*iface)->_close = close;
    if(write != NULL)
    	(*iface)->_write = write;
    if(read != NULL)
    	(*iface)->_read = read;
    
    return 0;

}

void tmcl_set_open_data(TMCLInterface *iface, void *pointer) {
    iface->tmcl_open_void = pointer;
}

void tmcl_set_close_data(TMCLInterface *iface, void *pointer) {
    iface->tmcl_close_void = pointer;
}

void tmcl_set_read_data(TMCLInterface *iface, void *pointer) {
    iface->tmcl_read_void = pointer;
}

void tmcl_set_write_data(TMCLInterface *iface, void *pointer) {
    iface->tmcl_write_void = pointer;
}

void tmcl_deinit_interface(TMCLInterface **iface) {
	
	free(*iface);
	
}

int tmcl_open_interface(TMCLInterface *iface, const char *filename) {

    int ret = 0;

    ret = iface->_open(iface, filename, iface->tmcl_open_void);
    iface->ifacename = malloc(strlen(filename));
    
    if(iface->ifacename != NULL)
    	strncpy(iface->ifacename, filename, strlen(filename));
    else 
    	return -1;
    
    DEBUG("open_interface() returns %d for %s\n", ret, iface->ifacename);

    return ret;
}

int tmcl_close_interface(TMCLInterface *iface) {

    int ret;

    ret = iface->_close(iface, iface->tmcl_close_void);
    free(iface->ifacename);
    
    DEBUG("close_interface() returns %d\n", ret);

    return ret;
}

/* Set timeout for reading from interface */
void tmcl_interface_set_timeout(TMCLInterface *iface, unsigned int sec, unsigned int msec) {

	iface->timeout_sec  = sec;
	iface->timeout_msec = msec;
	
}

/* Set timeout for waiting for reply of interface to be present */
void tmcl_interface_set_timewait(TMCLInterface *iface, unsigned int sec, unsigned int msec) {

	iface->timewait_sec  = sec;
	iface->timewait_msec = msec;
		
}
