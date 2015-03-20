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


#include <termios.h>
#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/select.h>
#include <time.h>
#include <sys/time.h>
#include <fcntl.h>
#include <unistd.h>
#include <inttypes.h>
#include <assert.h>
#include <string.h>

#include "interface.h"
#include "tmcldefs.h"
#include "rsXXX.h"
#include "debug.h"


int tmcl_init_rsXXX(TMCLInterface *iface) {

    struct termios options;
    struct termios checkopts;

    DEBUG("tmcl_init_rsXXX\n");

    if(tcgetattr(iface->handle.fd, &options) == -1) {
        perror("tcgetattr");
        return -1;
    }

    /* Set the speed */
    if(cfsetispeed(&options, B9600) == -1) {
        perror("cfsetispeed");
        return -1;
    }
    if(cfsetospeed(&options, B9600) == -1) {
        perror("cfsetospeed");
    }

    /* Enable the receiver and set local mode... */
    options.c_cflag |= (CLOCAL | CREAD);

    options.c_cflag &= ~CRTSCTS;

    /* No parity (8N1) */
    options.c_cflag &= ~PARENB;
    options.c_cflag &= ~CSTOPB;
    options.c_cflag &= ~CSIZE;
    options.c_cflag |= CS8;

    /* Disable echo and canonical mode and ...*/
    options.c_lflag &= ~ECHO;
    options.c_lflag &= ~ECHOE;
    options.c_lflag &= ~ICANON;
    options.c_lflag &= ~ISIG;

    /* Disable some other disturbing options */
    options.c_oflag &= ~OPOST; /* Set output to raw mode. All other c_oflags are ignored now */
    options.c_iflag &= ~INLCR; /* Do not map NL to CR. */
    options.c_iflag &= ~ICRNL; /* Do not map CR to NL. This fixes the annoying bug where binary 0x0D was converted to 0x0A. */
    options.c_iflag &= ~IXON;  /* Disable software flow control */


    /*
     * Now set the attributes
     * Note: Success of tcsetattr doesn't mean necessarily that everything 
     * was set correctly. To be correct we have to do 'tcgetattr' and compare 
     * the options
     */
    if( tcsetattr(iface->handle.fd, TCSAFLUSH, &options) == -1 ) {
        perror("tcsetattr");
        return -1;
    }

    /* Check if everything was set correctly */
    if(tcgetattr(iface->handle.fd, &checkopts) == -1) {
        perror("tcgetattr");
        return -1;
    }

    if(options.c_iflag != checkopts.c_iflag) {
        DEBUG("Setting of c_iflag failed: %X != %X", options.c_iflag, checkopts.c_iflag);
        return -1;
    }
    if(options.c_oflag != checkopts.c_oflag) {
        DEBUG("Setting of c_oflag failed: %X != %X", options.c_oflag, checkopts.c_oflag);
        return -1;
    }
    if(options.c_cflag != checkopts.c_cflag) {
        DEBUG("Setting of c_cflag failed: %X != %X", options.c_cflag, checkopts.c_cflag);
        return -1;
    }
    if(options.c_lflag != checkopts.c_lflag) {
        DEBUG("Setting of c_lflag failed: %X != %X", options.c_lflag, checkopts.c_lflag);
        return -1;
    }

    /* Now flush the port */
    if( tcflush(iface->handle.fd, TCIOFLUSH) == -1 ) {
        perror("tcflush");
        return -1;
    }

    return 0;
}


int tmcl_open_rsXXX(TMCLInterface *iface, const char *filename, void *pointer) {

    DEBUG("tmcl_open_rsXXX: %s\n", filename);

    if((iface->handle.fd = open(filename, O_RDWR | O_NOCTTY | O_NONBLOCK )) == -1) {
        perror("open");
        return -1;
    }

    DEBUG("Filedescriptor: %d\n", iface->handle.fd);
    /* Now init the interface */
    return tmcl_init_rsXXX(iface);

}

int tmcl_close_rsXXX(TMCLInterface *iface, void *pointer) {

    if( close(iface->handle.fd) == -1) {
        perror("close");
        return -1;
    }

    return 0;
}


int tmcl_write_rsXXX(TMCLInterface *iface, const void *buf, int length, void *pointer) {

    ssize_t num_bytes;

    DEBUG("tmcl_write_rsXXX to fd %d\n", iface->handle.fd);

    num_bytes = write(iface->handle.fd, buf, length);

    if(num_bytes != TMCL_DGRAM_SIZE_RSXXX) { /* Test if all bytes have been written */
        perror("write");
        return -1;
    }

    return 0;
}

int tmcl_poll_rsXXX(TMCLInterface *iface, char *buffer, void *pointer) {

    fd_set	  input;
    struct timeval  timeout;  /* How long select() should wait for input */
    //    struct timespec timewait; /* How long to wait for reading after select() triggers */
    ssize_t	  length = 0;
    ssize_t	  tmplength = 0;
    uint8_t	  tmpbuf[TMCL_DGRAM_SIZE_RSXXX+1]; /* Reserving one byte more than necessary. See below */
    int		   n, ret;

    DEBUG("tmcl_poll_rsXXX()\n");
    ret = 0;

    /* Initialize the timeout structure */
    timeout.tv_sec  = iface->timeout_sec;
    timeout.tv_usec = iface->timeout_msec * 1e3;

    /* Inititalize the timewait structure */
    //    timewait.tv_sec  = iface->timewait_sec;
    //    timewait.tv_nsec = iface->timewait_msec * 1e6;

    FD_ZERO(&input);
    FD_SET(iface->handle.fd, &input);

    /* Using select instead of pure read to be able to set a timeout for reading */
    n = select(((iface->handle.fd)+1), &input, NULL, NULL, &timeout);

    switch(n) {
    case -1:
        perror("RSXXX - select()");
        ret = -1;
        break;
    case  0:
        fprintf(stderr, "TIMEOUT in read_rsXXX()\n");
        ret = -1;
        break;
    default:
        /* We have input */
        assert(FD_ISSET(iface->handle.fd, &input)); /* select() didn't fail so this should really be true */

        bzero(buffer, TMCL_DGRAM_SIZE_RSXXX+1);
        while(length < TMCL_DGRAM_SIZE_RSXXX) {

            bzero(tmpbuf, TMCL_DGRAM_SIZE_RSXXX+1);

            //            /* Give the board some time to fill the input buffer */
            //            if(nanosleep(&timewait, NULL) == -1) {
            //                perror("nanosleep");
            //            }

            /* Try to read one byte more than necessary. If we get it there was some unprocessed date.
             * This shouldn't be. */
            tmplength = read(iface->handle.fd, tmpbuf, TMCL_DGRAM_SIZE_RSXXX+1);
            if(tmplength == -1) {
                perror("RSXXX - read()");
                return -1;
            }

            length += tmplength;

            if(length > TMCL_DGRAM_SIZE_RSXXX) {
                DEBUG("Too many bytes read: %d bytes > TMCL_DGRAM_SIZE_RSXXX", length);
                return -2;
            }
            DEBUG("tmcl_poll_rsXXX read 0x%X %X %X %X %X %X %X %X %X\n", tmpbuf[0], tmpbuf[1], tmpbuf[2], tmpbuf[3], tmpbuf[4], tmpbuf[5], tmpbuf[6], tmpbuf[7], tmpbuf[8]);
            memcpy((buffer + (length-tmplength)), tmpbuf, tmplength);

        } /* End while() */
        assert(length == TMCL_DGRAM_SIZE_RSXXX);
        ret = length;
    } /* End switch() */

    DEBUG("tmcl_poll_rsXXX returns %d\n", ret);
    return ret;
}
