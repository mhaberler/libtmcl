#ifndef __TMCL_TMCL_H_
#define __TMCL_TMCL_H_

/** @file tmcl.h
 *
 * Main libtmcl include
 */
/** @mainpage Trinamic Motion Control Language library
 *
 * @section NOTE
 \verbatim
  This documentation is created with the doxygen source code documentation generator.
  It may be regenerated by calling "make doxygen-doc" in the main source tree if
  'doxgen' (http://www.stack.nl/~dimitri/doxygen/) is installed on the system.
 \endverbatim
 *
 * @section intro_sec Introduction
 *
 * The Trinamic Motion Control Language is a set of commands for the programming of
 * Trinamic motor controller. For the direct control of a motor-controller board
 * these commands have to be translated into a command number and bundled with
 * the command arguments, the motor address and a checksum. The command set and
 * the details of the programming process are documented in the "TMCL Reference
 * Manual" from Trinamic, which can be downloaded from http://www.trinamic.com/.
 *
 * The aim of this library is to hide the low-level conversion and addressing issues
 * from the user for easier programming. A typical program using libtmcl can be as
 * simple as the following example (error checking omitted!).
 *
 * \code
 *
 * #include <tmcl/tmcl.h>
 *
 * int main(void) {
 *
 *      TMCLInterface *SerialIface; // Stores the interface of the motor-controller board
 *      TMCLMotor *Motor;     // Stores information about the motor to be controlled
 *
 *      // Init interface structure
 *      tmcl_init_interface(&SerialIface, TMCL_RSXXX, NULL, NULL, NULL, NULL);
 *
 *      // Open the interface
 *      tmcl_open_interface(SerialIface, "/dev/ttyS0");
 *
 *      // Init motor structure
 *      tmcl_init_motor(&Motor, SerialIface, TMCM301, 1, 0, TMCL_RSXXX);
 *
 *      // Rotate motor left
 *      tmcl_rol(TestMotor, 100);
 *
 *      // Cleanup
 *      tmcl_deinit_motor(&TestMotor);
 *      tmcl_close_interface(TestIface);
 *      tmcl_deinit_interface(&TestIface);
 *
 * }
 *
 * \endcode
 *
 * @section install_sec Installation
 *
 * There are no special prerequisites for 'libtmcl' installation. Normally it should
 * be enough to call:
 *
 *  - ./configure
 *  - make
 *
 * and than with 'root' privileges:
 *
 *  - make install
 *
 * For details refer to the delivered 'INSTALL' file.
 *
 * @section step1 "Let the games begin!"
 *
 * @subsection firststeps First steps
 *
 * The first things you need to know are:
 *
 *  - The model of your trinamic controller (see \link #TMCLModelEnum TMCLModel\endlink for supported models)
 *  - The module address and bank of you connected motor(s) (e.g. for the first motor of module "1": address=1, bank=0)
 *  - The \link #tmcl_busses interface type\endlink. Currently only RS232/RS485 serial interfaces are supported.
 *    Custom communication functions (open, close, read, write) may be given to #tmcl_init_interface()
 *    as pointers. See example01.c in the examples directory and have a look at rsXXX.c how to do this.
 *
 * With these information first initialize and open you interface struct, e.g. for a serial RS232 connection at /dev/ttyS0:
 *
 * \code
 * ...
 * tmcl_init_interface(&SerialIface, TMCL_RSXXX, NULL, NULL, NULL, NULL);
 * tmcl_open_interface(SerialIface, "/dev/ttyS0");
 * ...
 * \endcode
 *
 * Remember to check the return codes for errors! 'libtmcl' functions should return values >=0 for success and <0 for failure.
 *
 * After that init your motor. In this case the motor is the first motor at a TMCM-301 module with address "1":
 *
 * \code
 * ...
 * tmcl_init_motor(&Motor, SerialIface, TMCM301, 1, 0, TMCL_RSXXX);
 * ...
 * \endcode
 *
 * Again: Remember to check for errors!
 *
 * Some commonly used functions are defined in convenience.h, which is included from tmcl.h by default, e.g.
 *
 *  - Activate limit/reference switches: #tmcl_activate_limit_switch(TMCLMotor*, int limit_switch);
 *  - Doing a refsearch: #tmcl_refsearch_start(TMCLMotor*) (Remember: Reference switches have to be active for that!)
 *  - Move to position X: #tmcl_move_to_pos_abs(TMCLMotor*, int position)
 *  - etc.
 *
 *  @section advanced "Advanced" usage
 *
 *  @subsection sendcommand Send commands
 *
 *  There are more commands available than what are defined in convenience.h (see TMCL Reference for details).
 *  These functions can be accessed directly by the command number defined in the
 *  TMCL reference or, for greater readability, by a command define from \ref TMCLComm "tmcldefs.h"
 *
 *  For example: If you want to submit the "Move to Position (relative)"  command "by hand" you can can use the #tmcl_send_command(...)
 *  function as follows (Again: No error checking is done here, but you should do it in real code!):
 *
 *  \code
 *  ...
 *  TMCLCommand command;
 *
 *  command.command = TMCL_MVP;     // TMCL_MVP is defined in tmcldefs.h as command number "4"
 *  command.type    = TMCL_MVP_REL; // Relative movement. Type is not necessary for all commands (see TMCL reference)
 *  command.value   = 100;          // Move 100 steps relative to current position
 *
 *  tmcl_send_command(Motor, command, NULL);   // Submit the command. We do not expect a reply, so the last argument is NULL.
 *  ...
 *  \endcode
 *
 *
 *  @subsection axispar Axis parameter
 *
 *  Axis parameters control the way the motor is moving, e.g. speed, numer of limit switches, etc.
 *  The parameters available can be seen in tmcldefs.h or the TMCL reference.
 *
 *  For reading and writing of axis parameters the functions #tmcl_get_axis_parameter(...) and #tmcl_set_axis_parameter(...)
 *  exists.
 *
 *  Examples:
 *
 *  \code
 *  ...
 *  int speed;
 *
 *  // Get the current speed of the motor
 *  speed = tmcl_get_axis_parameter(motor, TMCL_AP_CURR_SPEED);
 *
 *  // Set reference search speed. This is set as a fraction of the full positioning speed,
 *  // e.g. 2 means: half the positioning speed, 4: quarter of the full positioning speed, etc.
 *  // See TMCL reference for details
 *  tmcl_set_axis_parameter(motor, TMCL_AP_RFS_SPEED, 2);
 *
 *  ...
 *  \endcode
 *
 */

/* Allow the use in C++ code.  */
#ifdef __cplusplus
extern "C" {
#endif
	
#include <tmcl/tmcldefs.h>
#include <tmcl/motor.h>
#include <tmcl/convenience.h>
#include <tmcl/interface.h>

#ifdef __cplusplus
}
#endif  /* C++ */

#endif /* __TMCL_TMCLDEFS_H_*/
