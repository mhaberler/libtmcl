AM_CFLAGS=-g -O2 -Wall -Wstrict-prototypes -pedantic -I$(top_srcdir)/src

bin_PROGRAMS = example01 tmcl_init_motor tmcl_move_to 
example01_SOURCES = example01.c 
example01_LDADD = ../src/tmcl/libtmcl.la

tmcl_init_motor_SOURCES = tmcl_init_motor.c
tmcl_init_motor_LDADD = ../src/tmcl/libtmcl.la

tmcl_move_to_SOURCES = tmcl_move_to.c
tmcl_move_to_LDADD = ../src/tmcl/libtmcl.la

EXTRA_DIST = pytmcl_move_to.py