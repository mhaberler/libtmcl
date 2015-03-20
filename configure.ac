AC_PREREQ(2.61)

# Release Versioning
m4_define(generic_major_version, 0)
m4_define(generic_minor_version, 2)
m4_define(generic_micro_version, 12)
m4_define(generic_release, generic_major_version.generic_minor_version);

# Shared Library Versioning
m4_define(lt_current, 2)        # increment if interfaces have been added, removed or changed
m4_define(lt_revision, 6)       # increment if source code has changed, set to zero if current is incremented
m4_define(lt_age, 2)            # increment if interfaces have been added, set to zero if interfaces have been removed or changed

AC_INIT([libtmcl], [generic_release()], [ralf.schulze@ikp.uni-koeln.de], [tmcl])
AC_CONFIG_AUX_DIR(build-aux)	# Where to put autoconfs auxiliary files 
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([src/tmcl/config.h.in])
AM_CONFIG_HEADER(src/tmcl/config.h)
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

GENERIC_VERSION=generic_major_version().generic_minor_version().generic_micro_version()
VERSION=$GENERIC_VERSION
GENERIC_LIBRARY_VERSION=lt_current():lt_revision():lt_age()
GENERIC_RELEASE=generic_release()       

AC_SUBST(GENERIC_RELEASE)
AC_SUBST(GENERIC_VERSION)
AC_SUBST(GENERIC_LIBRARY_VERSION)
AC_SUBST(PACKAGE)

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL
AC_LANG([C])
AC_PROG_LIBTOOL

# SWIG for python extension
SWIG_PYTHON
AM_PATH_PYTHON(2.3)
AC_PROG_SWIG(1.3.21)

## Check for some compiler features
#
# Check for ISO Standard C support (currently C99)
AC_PROG_CC_STDC
#if test x"${ac_cv_prog_cc_stdc}" != x"no"; then
#       AC_DEFINE([...], [1], [...])
#fi

# Check for __attribute__((visibility("hidden"))) support
AC_TRY_COMPILE([], [void __attribute__ ((visibility("hidden"))) foo(void) { return 1; };],
                attribute_visibility=yes,
                attribute_visibility=no)

if test x"$attribute_visibility" == x"yes"; then
        AC_DEFINE([HAVE_ATTRIBUTE_VISIBILITY], 1, [Define if compiler supports visibility attribute])
        AC_SUBST([FVISIBILITY], ["-fvisibility=hidden"])
fi
      
# Check for 'const' and set to empty if not supported 
AC_C_CONST

# Checks for header files.
dnl AC_HEADER_STDC
dnl AC_CHECK_HEADERS([stdlib.h string.h strings.h sys/time.h])

# Doxygen documentation
DX_DOXYGEN_FEATURE(ON)
DX_HTML_FEATURE(ON)
DX_PDF_FEATURE(ON)
DX_PS_FEATURE(OFF)
DX_INIT_DOXYGEN($PACKAGE_NAME, doc/libtmcl.doxygen, doc/api)
###
## Add the option to enable libefence for memory debugging
###
AC_ARG_WITH([efence],
            [AS_HELP_STRING([--with-efence],
              [enable libefence (for memory debugging) @<:@default=no@:>@])])
AS_IF([test "x$with_efence" == xyes],
        [AC_CHECK_LIB([efence], [main], [],
           [if test "x$with_efence" == xyes; then
              AC_MSG_FAILURE(
                   [--with-efence was given, but test for libefence failed])
               fi
              ])])

###
## Enable debugging output
###
AC_ARG_WITH([debug-output],
            [AS_HELP_STRING([--with-debug-output],
              [enable debugging output @<:@default=no@:>@])])
AS_IF([test "x$with_debug_output" == xyes],
	    AC_DEFINE([DEBUG_OUTPUT], [1],[Enable debugging output])
)		

AC_CONFIG_FILES([Makefile \
		 src/Makefile \
		 src/tmcl/Makefile \
		 example/Makefile \
		 pyext/Makefile \
		 doc/Makefile])
AC_OUTPUT

