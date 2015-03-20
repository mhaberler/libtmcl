AM_CFLAGS=-g -O2 -Wall -Wstrict-prototypes -pedantic -I$(top_srcdir)/src

# Library to be installed to filesystem
lib_LTLIBRARIES         = libtmcl.la
libtmcl_la_SOURCES    =  motor.c rsXXX.c tmcldefs.c \
							motor.h rsXXX.h tmcldefs.h tmcl.h \
							convenience.c convenience.h interface.h interface.c

# Headers that will be installed to filesystem
pgkincludedir = @includedir@/tmcl
pgkinclude_HEADERS = motor.h rsXXX.h tmcl.h tmcldefs.h convenience.h interface.h

# Headeers that won't be installed to filesystem
noinst_HEADERS          = debug.h

libtmcl_la_LDFLAGS = -version-info $(GENERIC_LIBRARY_VERSION) -release $(GENERIC_RELEASE)

datarootdir = @datarootdir@
