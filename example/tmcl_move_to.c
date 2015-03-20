/*
 * tmcl_move_to.c
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


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <tmcl/tmcl.h>

#define DEVICE "/dev/ttyS2"
#define ADDRESS 1
#define BANK 0

int main(int argc, char *argv[]) {

    TMCLInterface *PGAAIface;
    TMCLMotor *PGAAMotor;
    int position;
    int current_pos;

    if(argc != 2) {
        printf("Usage: %s <position>\n", argv[0]);
    }

    position = atoi(argv[1]);

    printf("Moving to position %d\n", position);

    if (tmcl_init_interface(&PGAAIface, TMCL_RSXXX, NULL, NULL, NULL, NULL) < 0) {
        printf("Error initializing interface\n");
        exit(EXIT_FAILURE);
    }
    
    if (tmcl_open_interface(PGAAIface, DEVICE) < 0) {
        printf("Error opening iterface\n");
        exit(EXIT_FAILURE);
    }

    if (tmcl_init_motor(&PGAAMotor, PGAAIface, TMCM301, ADDRESS, BANK, TMCL_RSXXX) < 0) {
        printf("Error intializing motor\n");
        exit(EXIT_FAILURE);
    }


    if(tmcl_move_to_pos_abs(PGAAMotor, position) < 0) {
        printf("Error setting position\n");
        exit(EXIT_FAILURE);
    }

    do {
        sleep(1);
        current_pos = tmcl_get_position(PGAAMotor);
        if(current_pos == 0xFFFFFF) {
            printf("Reading of current position failed\n");
            exit(EXIT_FAILURE);
        }
        printf("Current position: %d\n", current_pos);
    } while(current_pos != position);

    printf("Reached position %d\n", position);

    tmcl_deinit_motor(&PGAAMotor);
    tmcl_close_interface(PGAAIface);
    tmcl_deinit_interface(&PGAAIface);

}
