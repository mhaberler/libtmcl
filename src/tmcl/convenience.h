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


/** @file convenience.h
 *
 * Convenience function for regularly used actions
 */

#ifndef CONVENIENCE_H_
#define CONVENIENCE_H_

#include <inttypes.h>
#include "motor.h"


/** Move motor to absolute position */
int tmcl_move_to_pos_abs(TMCLMotor *motor, int position);

/** Move motor relative to current position */
int tmcl_move_to_pos_rel(TMCLMotor *motor, int position);

/** Move to previously stored coordinate See TMCL reference for details */
int tmcl_move_to_coord(TMCLMotor *motor, int coordinate);

/** Stop motor */
int tmcl_stop(TMCLMotor *motor);

/** Start reference search */
int tmcl_refsearch_start(TMCLMotor *motor);

/** Stop reference search */
int tmcl_refsearch_stop(TMCLMotor *motor);

/** Get status of reference search
 *
 * \return
 *      -  1 when reference search is running
 *      -  0 when no reference search is running
 *      - -1 on error
 */
int tmcl_refsearch_status(TMCLMotor *motor);

/** Get current position of motor */
int32_t tmcl_get_position(TMCLMotor *motor);

/** Rotate motor right */
int tmcl_ror(TMCLMotor *motor, int velocity);

/** Rotate motor left */
int tmcl_rol(TMCLMotor *motor, int velocity);

/** Set maximum current
 *
 * \param[in] current in percent of full current
 */
int tmcl_set_max_current(TMCLMotor *motor, unsigned int percent);

/** Get maximum current
 *
 * \return
 *      - current in percent of available full current
 *      - -1 on error
 */
int tmcl_get_max_current(TMCLMotor *motor);

/** Set maximum standby current
 *
 * \param[in] maximum standby current in percent
 *
 */
int tmcl_set_max_standby_current(TMCLMotor *motor, unsigned int percent);

/** Get maximum standby current
 *
 * \return
 *      - current in percent of available full current
 *      - -1 on error
*/
int tmcl_get_max_standby_current(TMCLMotor *motor);

/** Set microsteps for movement
 *
 * \note not for TMCM100 model
 *
 * \param[in] microsteps 0 (full step mode), 1 (half step mode), 2, 4, 8, 16, 32, 64 microsteps
 */
int tmcl_set_microsteps(TMCLMotor *motor, int microsteps);

/** Get used microsteps
 *
 * \note not for TMCM100 model
 *
 * \return
 *          - microsteps: 0 (full step mode), 1 (half step mode), 2, 4, 8, 16, 32, 64 microsteps
 *          - -1 on failure
 */
int tmcl_get_microsteps(TMCLMotor *motor);

/** Activate limit switch
 *
 * \param[in] limit_switch ID of limit switch to activate
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 */
int tmcl_activate_limit_switch(TMCLMotor *motor, int limit_switch);

/** Deactivate limit switch
 *
 * \param[in] limit_switch ID of limit switch to deactivate
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 */
int tmcl_deactivate_limit_switch(TMCLMotor *motor, int limit_switch);

/** Check if limit switch is active
 *
 * \param[in] limit_switch Switch to check
 *
 * \return
 *          -  1 when \c limit_switch is active
 *          -  0 when not active
 *          - -1 on error
 */
int tmcl_get_limit_switch(TMCLMotor *motor, int limit_switch);

/** Set number of reference switches
 *
 * \param[in] number Number of reference switches (1-3)
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 */
int tmcl_set_no_ref_switch(TMCLMotor *motor, int number);

/** Get current speed of motor
 *
 * \return
 *      - >=0: current speed of motor
 *      - -1 on failure
 *
 */
int tmcl_get_current_speed(TMCLMotor *motor);

/** Set reference search speed
 *
 * \param[in] fraction Set reference search speed to 1/fraction of positioning speed
 */
int tmcl_set_refsearch_speed(TMCLMotor *motor, int fraction);

/** Get reference search speed
 *
 * \return
 *      - >=0: reference search speed in fraction of positioning speed
 *      - -1: failure
 */
int tmcl_get_refsearch_speed(TMCLMotor *motor);

/** Set positioning speed
 *
 * \param[in] speed Positioning speed 0-2047
 *
 * \return
 *      -  0 on success
 *      - -1 on failure
 */
int tmcl_set_pos_speed(TMCLMotor *motor, int speed);

/** Get positioning speed */
int tmcl_get_pos_speed(TMCLMotor *motor);

/** Get status of limit switch
 *
 * \param[in] limit_switch Limit switch to check  0: left switch, 1: right switch
 *
 * \return
 *      -  0: when limit switch is open
 *      -  1: when limit switch is closed
 *      - -1: on failure
 */
int tmcl_get_limit_status(TMCLMotor *motor, int limit_switch);

#endif /* CONVENIENCE_H_ */
