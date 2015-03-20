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


/** @file interface.h
 *
 * Functions, structures, etc. to access the interface of the controller board
 */
#ifndef __TMCL_INTERFACE_H_
#define __TMCL_INTERFACE_H_

#include <tmcl/tmcldefs.h>

struct TMCLInterfaceStruct;

/** Function pointers for open/close and read/write interface communication functions */
typedef int (*tmcl_open_funcPtr)(struct TMCLInterfaceStruct *iface, const char *ifacename, void *);
typedef int (*tmcl_close_funcPtr)(struct TMCLInterfaceStruct *iface, void *);
typedef int (*tmcl_write_funcPtr)(struct TMCLInterfaceStruct *iface, const void *buffer, int length, void *);
typedef int (*tmcl_read_funcPtr)(struct TMCLInterfaceStruct *iface, char *buffer, void *);

/** Struct to store information about the controller interface */
typedef struct TMCLInterfaceStruct {
    union {
    	int 			fd;
    	 /* Here may go handles for CAN, etc in the future */
    } handle; /**< handle to access the interface */

    char *ifacename;
    TMCLBusType	bus;
#ifndef SWIG /* These are internal C functions and should not be visible in python */
    tmcl_open_funcPtr	_open;
    void *tmcl_open_void;	/**< Void pointer store a custom open function */
    tmcl_close_funcPtr	_close;
    void *tmcl_close_void;	/**< Void pointer store a custom data close function */
    tmcl_write_funcPtr	_write;
    void *tmcl_write_void;	/**< Void pointer store a custom data write function */
    tmcl_read_funcPtr	_read;
    void *tmcl_read_void;	/**< Void pointer store a custom data read function */
#endif
    /** Timeouts */
    unsigned int timeout_sec;	/**< Timeout for reading from device (seconds) (Default 2)*/
    unsigned int timeout_msec;	/**< Timeout for reading from device (milliseconds) (Default 0)*/
    /** Due to the processing time of the board it may be necessary to wait some microseconds
     * until the reply is ready. */ 
    unsigned int timewait_sec;	/**< Time to wait for reply of board (seconds) (Default 0)*/
    unsigned int timewait_msec;	/**< Time to wait for reply of board (milliseconds) (Default 10) */
} TMCLInterface;


/** Initialize TMCLInterface struct
 *
 * Custom open/close/read/write functions may be given here. Use \c NULL to use the builtin functions.
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 *
 */
int  tmcl_init_interface(TMCLInterface **iface, TMCLBusType bus, tmcl_open_funcPtr open, tmcl_close_funcPtr close, tmcl_read_funcPtr read, tmcl_write_funcPtr write);

/** Set custom open function for interface
*/
void tmcl_set_open_data(TMCLInterface *iface, void *func_pointer);

/** Set custom close function for interface
*/
void tmcl_set_close_data(TMCLInterface *iface, void *func_pointer);

/** Set custom read function for interface
*/
void tmcl_set_read_data(TMCLInterface *iface, void *func_pointer);

/** Set custom write function for interface
*/
void tmcl_set_write_data(TMCLInterface *iface, void *func_pointer);

/** Deinitialize interface */
void tmcl_deinit_interface(TMCLInterface **iface);

/** Open interface *
 *
 * \param[in] iface TMCLInterface struct
 * \param[in] filename filename of interface device (for RSXXX)
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 */
int tmcl_open_interface(TMCLInterface *iface, const char *filename);

/** Close interface *
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 */
int tmcl_close_interface(TMCLInterface *iface);

/** Adjust timout for interface communication */
void tmcl_interface_set_timeout(TMCLInterface *iface, unsigned int sec, unsigned int msec);

/** Adjust how long to wait for reply from motor controller */
void tmcl_interface_set_timewait(TMCLInterface *iface, unsigned int sec, unsigned int msec);

#endif /* INTERFACE_H_ */
