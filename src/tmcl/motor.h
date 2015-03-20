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

/** @file motor.h
 *
 * Motor communication and configuration
 */

#ifndef __TMCL_MOTOR_H_
#define __TMCL_MOTOR_H_

#include <tmcl/tmcldefs.h>
#include <tmcl/interface.h>

/** Motor handler
 *
 * Stores information about the motor and the interface of the controller board
 */
typedef struct TMCLMotorStruct {
    TMCLDevice 		device;
    TMCLInterface 	*iface;
}
TMCLMotor;

/** Initialize motor handling structure
 *
 * \return
 *          -  0: on success
 *          - -1: on failure
 */
int  tmcl_init_motor(TMCLMotor **mot, TMCLInterface *iface, TMCLModel model,
                    uint8_t address, uint8_t bank, TMCLBusType bus);
/** Deinitialize motor handling structure
 */
void tmcl_deinit_motor(TMCLMotor **mot);

/** Send command to motor
 *
 * \see TMCLCommand
 *
 * \return
 *          -  0: on success
 *          - -1: on failure
 */
int  tmcl_send_command(TMCLMotor *mot, TMCLCommand tcom, TMCLReply *reply);

/** Read axis parameter 'axis_parameter' from the motor and saves it in the 'TMCLMotor' struct
 *
 * \param[in] mot Motor struct
 * \param[in] tmcl_parameter Parameter to read
 *
 * \return
 *          -  0: on success
 *          - -1: on failure
 *
 */
int  tmcl_update_axis_parameter(TMCLMotor *mot, int axis_parameter);

/** Set axis parameter in motor controller board
 *
 * \param[in] mot Motor struct
 * \param[in] axis_parameter Parameter to set @see AxisParam
 * \param[in] value New value for parameter
 *
 * \return
 *          -  0: on success
 *          - -1: on failure
 *
 */
int  tmcl_set_axis_parameter(TMCLMotor *mot, int axis_parameter, int value);

/** Get axis parameter from motor struct
 *
 * This does not read the parameter from the board, but just from the TMCLMotor struct.
 * To update the value in the TMCLMotor struct call tmcl_update_axis_parameter() before.
 *
 * \param[in] mot Motor struct
 * \param[in] axis_parameter Parameter to get @see AxisParam
 *
 * \return
 *          -  0: on success
 *          - -1: on failure
 *
 */
int  tmcl_get_axis_parameter(TMCLMotor *mot, int axis_parameter);


/** Read all available axis parameters from the controller board and store them in the TMCLMotor struct
 *
 * \return
 *          -  0: on success
 *          - -1: on failure

 * \todo: Currently broken and thus not commented
 */
//int  tmcl_get_all_axis_parameter(TMCLMotor *mot);


/** Copy axis parameter from RAM to non-volatile EEPROM on board
 *
 * \return
 * 			-  0: on success
 * 			- -1: on failure
 */
int tmcl_store_axis_parameter(TMCLMotor *mot, int axis_parameter);

#endif /* __TMCL_MOTOR_H_*/
