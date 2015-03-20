#!/usr/bin/env python

# pytmcl_move_top
# 
# Python example for tmcl motor access
#
# Ralf Schulze <ralf.schulze@ikp.uni-koeln.de>
# 

import sys
import tmcl

interface_bus = tmcl.TMCL_RSXXX
interface_filename = "/dev/ttyS0"

model = tmcl.TMCM301
bus = tmcl.TMCL_RSXXX
address = 1 
bank = 0

position = int(sys.argv[1])

iface = tmcl.TMCLInterface(interface_bus)
iface.open(interface_filename)
motor = tmcl.TMCLMotor(iface, model, address, bank, bus)
tmcl.tmcl_move_to_pos_abs(motor, position)
iface.close()
