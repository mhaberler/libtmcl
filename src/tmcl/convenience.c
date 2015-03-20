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
#include <inttypes.h>
#include <stdlib.h>

#include "motor.h"
#include "tmcldefs.h"
#include "debug.h"

int tmcl_move_to_pos_abs(TMCLMotor *motor, int position) {

    TMCLCommand comm;

    DEBUG("Moving motor to pos %d\n", position);

    comm.command = TMCL_MVP;
    comm.type = TMCL_MVP_ABS;
    comm.value = position;

    return tmcl_send_command(motor, comm, NULL);
}

int tmcl_ror(TMCLMotor *motor, int velocity) {

    TMCLCommand comm;

    DEBUG("Rotating motor right\n");

    comm.command = TMCL_ROR;
    comm.value = velocity;

    return tmcl_send_command(motor, comm, NULL);
}

int tmcl_rol(TMCLMotor *motor, int velocity) {

    TMCLCommand comm;

    DEBUG("Rotating motor left\n");

    comm.command = TMCL_ROL;
    comm.value = velocity;

    return tmcl_send_command(motor, comm, NULL);
}

int tmcl_move_to_pos_rel(TMCLMotor *motor, int position) {

    TMCLCommand comm;

    DEBUG("Moving motor relatively %d\n", position);

    comm.command = TMCL_MVP;
    comm.type = TMCL_MVP_REL;
    comm.value = position;

    return tmcl_send_command(motor, comm, NULL);
}

int tmcl_move_to_coord(TMCLMotor *motor, int coordinate) {

    TMCLCommand comm;

    DEBUG("Moving motor to coordinate %d\n", coordinate);

    comm.command = TMCL_MVP;
    comm.type = TMCL_MVP_COORD;
    comm.value = coordinate;

    return tmcl_send_command(motor, comm, NULL);
}

int tmcl_stop(TMCLMotor *motor) {

    TMCLCommand comm;

    DEBUG("Stopping motor\n");

    comm.command = TMCL_MST;

    return tmcl_send_command(motor, comm, NULL);
}

/* Start reference search */
int tmcl_refsearch_start(TMCLMotor *motor) {

    TMCLCommand comm;

    if (motor->device.num_refswitches < 1)
        return -1;

    DEBUG("Starting refsearch\n");

    comm.command = TMCL_RFS;
    comm.type = TMCL_RFS_START;

    return tmcl_send_command(motor, comm, NULL);

}

/* Stop reference search */
int tmcl_refsearch_stop(TMCLMotor *motor) {

    TMCLCommand comm;

    DEBUG("Stopping refsearch\n");

    comm.command = TMCL_RFS;
    comm.type = TMCL_RFS_STOP;

    return tmcl_send_command(motor, comm, NULL);

}

/* Check if reference search is active
 * 
 * Returns : 0 when not active
 * 			 1 when active
 * 			-1 on error
 */
int tmcl_refsearch_status(TMCLMotor *motor) {

    TMCLCommand comm;
    TMCLReply reply;
    int retval = 0;

    DEBUG("Checking refsearch status\n");

    comm.command = TMCL_RFS;
    comm.type = TMCL_RFS_STATUS;

    retval = tmcl_send_command(motor, comm, &reply);

    if (retval < 0)
        return retval;

    if (reply.value == 0) /* No reference search running */
        return 0;
    else
        /* Reference search running */
        return 1;

}

/* Get current position of motor.
 * 
 * Returns: Current position of motor
 * 			0xFFFFFF on failure
 */
int32_t tmcl_get_position(TMCLMotor *motor) {

    DEBUG("Getting current position from motor\n");

    if (tmcl_update_axis_parameter(motor, TMCL_AP_CURR_POS) < 0) {
        DEBUG("getting position failed");
        /* Returning -1 is not very sensible, becaue -1 is a valid position.
         * Because valid positions only range from -2^23...+2^23 we return
         * 0xFFFFFF on error */
        return 0xFFFFFF;
    }

    return motor->device.parameter[TMCL_AP_CURR_POS];
}

static int tmcl_percent_to_currentval(TMCLMotor *motor, unsigned int current_perc) {

	int current_par;

	if( (current_perc < 0) || (current_perc > 100)) {
        return -1;
	}

	switch (motor->device.model) {
	case TMCM300:
	case TMCM303:
	case TMCM310:
	case TMCM110:
	case TMCM610:
	case TMCM611:
	case TMCM612:
		/* On these model current parameter is given in range from 0..1500 */
		current_par = 1500 * current_perc / 100;
		break;
	default:
		current_par = 255 * current_perc / 100; /* convert % to value between 0 and 255 */
	}

	return current_par;

}

/* convert current value to percent */
static int tmcl_currentval_to_percent(TMCLMotor *motor, unsigned int value) {

    int current_perc;

    switch (motor->device.model) {
    	case TMCM300:
    	case TMCM303:
    	case TMCM310:
    	case TMCM110:
    	case TMCM610:
    	case TMCM611:
    	case TMCM612:
    		/* On these model current parameter is given in range from 0..1500 */
    		current_perc = value / 1500 * 100;
    		break;
    	default:
    		current_perc = value / 255 * 100;
    	}

    return current_perc;
}

int tmcl_set_max_current(TMCLMotor *motor, unsigned int current) {

    int current_par;
    int ret;

    DEBUG("Setting maximum current, current = %d\n", current);

    current_par = tmcl_percent_to_currentval(motor, current);

    if (current_par < 0)
        return current_par;
    else {
		ret = tmcl_set_axis_parameter(motor, TMCL_AP_ABS_CURRENT, current_par);
		return ret;
    }
}

int tmcl_get_max_current(TMCLMotor *motor) {

    int value;

    value = tmcl_get_axis_parameter(motor, TMCL_AP_ABS_CURRENT);
    return tmcl_currentval_to_percent(motor, value);

}

int tmcl_set_max_standby_current(TMCLMotor *motor, unsigned int current_percent) {

    int current_par;
    int ret;
    DEBUG("Setting maximum standby current\n");

    current_par = tmcl_percent_to_currentval(motor, current_percent);
	if (current_par < 0)
		return current_par;
	else {
		ret = tmcl_set_axis_parameter(motor, TMCL_AP_STBY_CURRENT, current_par);
		return ret;
	}
}

int tmcl_get_max_standby_current(TMCLMotor *motor) {

    int value;

    value = tmcl_get_axis_parameter(motor, TMCL_AP_STBY_CURRENT);
    return tmcl_currentval_to_percent(motor, value);

}

int tmcl_set_microsteps(TMCLMotor *motor, int microsteps) {

    int microstep_par;

    DEBUG("Setting %d microsteps\n", microsteps);

    if (motor->device.model == TMCM100) /* Unsupported on this device */
        return -1;

    switch (microsteps) {
    case 0: /* Full steps */
        microstep_par = 0;
        break;
    case 2: /* Half steps */
        microstep_par = 1;
        break;
    case 4:
        microstep_par = 2;
        break;
    case 8:
        microstep_par = 3;
        break;
    case 16:
        microstep_par = 4;
        break;
    case 32:
        microstep_par = 5;
        break;
    case 64:
        microstep_par = 6;
        break;
    default: /* Unsupported micro-steps */
        return -1;
    }

    return tmcl_set_axis_parameter(motor, TMCL_AP_MICROSTEPS, microstep_par);
}

/* Returns number of microsteps on success, else -1 */
int tmcl_get_microsteps(TMCLMotor *motor) {

    int value;

    if (motor->device.model == TMCM100) /* Unsupported on this device */
        return -1;

    value = tmcl_get_axis_parameter(motor, TMCL_AP_MICROSTEPS);

    switch (value) {
    case 0: /* Full steps */
        return 0;
        break;
    case 1: /* Half steps */
        return 1;
        break;
    case 2:
        return 4;
        break;
    case 3:
        return 8;
        break;
    case 4:
        return 16;
        break;
    case 5:
        return 32;
        break;
    case 6:
        return 64;
        break;
    default: /* Error */
        return -1;
    }
}

/* Set limit switch number "limit_switch" to active (value = 1) or inactive (value = 0) */
static int tmcl_set_limit_switch(TMCLMotor *motor, int limit_switch, int value) {

    int parameter;

    if ((value > 1) || (value < 0))
        return -1;

    switch (limit_switch) {
    case 0:
        parameter = TMCL_AP_DISABLE_LIMIT_L; /* Left switch is reference switch */
        break;
    case 1:
        parameter = TMCL_AP_DISABLE_LIMIT_R;
        break;
    default:
        return -1;
    }

    value = 1 - value; /* Inverting set/disable logic */

    return tmcl_set_axis_parameter(motor, parameter, value);
}

/* Check if limit switch is activated.
 *
 * return 1 if switch is active and 0 when inactive
 */
int tmcl_get_limit_switch(TMCLMotor *motor, int limit_switch) {

    int value;
    int parameter;

    switch (limit_switch) {
    case 0:
        parameter = TMCL_AP_DISABLE_LIMIT_L; /* Left switch is reference switch */
        break;
    case 1:
        parameter = TMCL_AP_DISABLE_LIMIT_R;
        break;
    default:
        return -1;
    }
    value = tmcl_get_axis_parameter(motor, parameter);
    /* Value is 1 if switch is disabled and 0 if not, so we invert the logic here */

    if (value >= 0) { /* value < 0 is error */
        value = 1 - value;
    }

    return value;

}

int tmcl_activate_limit_switch(TMCLMotor *motor, int limit_switch) {

    return tmcl_set_limit_switch(motor, limit_switch, 1);
}

int tmcl_deactivate_limit_switch(TMCLMotor *motor, int limit_switch) {

    return tmcl_set_limit_switch(motor, limit_switch, 0);
}

int tmcl_set_no_ref_switch(TMCLMotor *motor, int number) {

    int retval;

//    switch (number) {
//    case 0: /* Deactivate limit switches that are not present */
//        retval = tmcl_deactivate_limit_switch(motor, 1);
//        if (retval < 0)
//            return retval;
//        /* No 'break' on purpose! */
//    case 1:
//        retval = tmcl_deactivate_limit_switch(motor, 0);
//        if (retval < 0)
//            return retval;
//        /* No 'break' on purpose! */
//    case 2:
//    case 3:
//        motor->device.num_refswitches = number;
//        break;
//    default:
//        return -1;
//
//    }

    retval = tmcl_set_axis_parameter(motor, TMCL_AP_RFS_MODE,
            motor->device.num_refswitches);

    if (retval >= 0)
		motor->device.num_refswitches = number;

    return retval;
}

int tmcl_set_refsearch_speed(TMCLMotor *motor, int fraction) {

    /*
     For the reference search this value specifies the search
     speed as a fraction of the maximum velocity:
     0 – full speed
     1 – half of the maximum speed
     2 – a quarter of the maximum speed
     3 – 1/8 of the maximum speed (etc.)

     Valid values for 'fraction': 0..8
     */

    int retval;

    if (fraction < 0 || fraction > 8)
        return -1;

    retval = tmcl_set_axis_parameter(motor, TMCL_AP_RFS_SPEED, (int) fraction);

    return retval;

}

int tmcl_get_refsearch_speed(TMCLMotor *motor) {

    return tmcl_get_axis_parameter(motor, TMCL_AP_RFS_SPEED);
}

int tmcl_get_current_speed(TMCLMotor *motor) {

    return tmcl_get_axis_parameter(motor, TMCL_AP_CURR_SPEED);
}

/* Set positioning speed */
int tmcl_set_pos_speed(TMCLMotor *motor, int speed) {

    int retval;

    retval = tmcl_set_axis_parameter(motor, TMCL_AP_MAX_POS_SPEED, speed);

    return retval;

}

int tmcl_get_pos_speed(TMCLMotor *motor) {

    return tmcl_get_axis_parameter(motor, TMCL_AP_MAX_POS_SPEED);
}

/* Get status of limit switch 0: left, 1: right */
int tmcl_get_limit_status(TMCLMotor *motor, int limit_switch) {

    int parameter;

    switch (limit_switch) {
    case 0:
        parameter = TMCL_AP_LIMIT_L; /* Get left limit switch status */
        break;
    case 1:
        parameter = TMCL_AP_LIMIT_R; /* Get right limit switch status */
        break;
    default:
        return -1;
    }

    return tmcl_get_axis_parameter(motor, parameter);
}
