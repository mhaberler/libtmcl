/*
 * example01.c
 *
 * Example how to define some custom communication functions
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


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <tmcl/tmcl.h>

int test_open(TMCLInterface *iface, const char *ifacename, void *dummy) {
	
	printf("Opening test interface %s\n", ifacename);
	
	return 1;
}

int test_close(TMCLInterface *iface, void *dummy) {
	
	printf("Closing test interface %s\n", iface->ifacename);
	
	return 1;
}

/* Space for *buffer will be allocated by library */
int test_write(TMCLInterface *iface, const void *buffer, int length, void *dummy) {
	
	printf("writing to test interface %s\n", iface->ifacename);
	
	return 1;
}

int test_read(TMCLInterface *iface, char *buffer, void *dummy) {
	
	printf("Reading from test interface %s\n", iface->ifacename);
	
	return 1;
}



int main(void) {
		
	TMCLInterface *TestIface;
	TMCLMotor *TestMotor;
	tmcl_init_interface(&TestIface, TMCL_RSXXX, &test_open, &test_close, &test_read, &test_write);
	tmcl_open_interface(TestIface, "TEST");
	
    if(tmcl_init_motor(&TestMotor, TestIface, TMCM301, 1, 0, TMCL_RSXXX) < 0) {
    	printf("Error intializing motor\n");
    	exit(EXIT_FAILURE);
    }
    
    
    tmcl_refsearch_start(TestMotor);
	
	tmcl_deinit_motor(&TestMotor);
	tmcl_close_interface(TestIface);
	tmcl_deinit_interface(&TestIface);
	
}
