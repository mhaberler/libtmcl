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


/** @file rsXXX.h
 *
 * Communication function for RS232 and RS485 interfaces
 *
 * Normally there should not be any need to call these directly.
 */
#ifndef __TMCL_RSXXX_H_
#define __TMCL_RSXXX_H_

#if HAVE_CONFIG_H
#include <config.h>
#endif /* HAVE_CONFIG_H */

#include <tmcl/tmcldefs.h>
#include <tmcl/interface.h>

/** Opens the RSXXX port
 *
 * \arg \c filename: Device node of RSXXX port
 * \arg \c pointer: NOT USED!
 *
 * Returns:
 *       - File descriptor of RSXXX port on success
 *       - -1 on failure
 *
 */
int tmcl_open_rsXXX(TMCLInterface *iface, const char* filename, void *pointer);

/** Closes the RSXXX port
 *
 *  \arg \c pointer: NOT USED!
 *
 * Returns:
 *       -  0 on success
 *       - -1 on failure
 */
int tmcl_close_rsXXX(TMCLInterface *iface, void *pointer);

/** Writes to RSXXX port
 *
 * \arg \c buf: buffer of data to be written
 * \arg \c length: length of data buffer
 * \arg \c pointer: NOT USED!
 *
 *
 * Returns:
 *       -  0 on success
 *       - -1 on failure
 */
int tmcl_write_rsXXX(TMCLInterface *iface, const void *buf, int length, void *pointer);

/** Waits for data from the RSXXX port.
 *
 * \arg \c buffer: Buffer to store received data
 * \arg \c pointer: NOT USED!
 * RETURNS
 *       - >0: length of data read (in bytes)
 *       - -1 on failure
 *       - -2 on wrong length of read data
 */
int tmcl_poll_rsXXX(TMCLInterface *iface, char *buffer, void *pointer);
	
#endif /* __TMCL_RS232_H_ */
