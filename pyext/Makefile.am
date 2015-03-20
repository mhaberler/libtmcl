AM_CFLAGS= $(SWIG_PYTHON_CPPFLAGS) -I$(top_srcdir)/src
BUILT_SOURCES = $(srcdir)/swig_wrap.c
SWIG_SOURCES = tmcl.i 

pkgpython_PYTHON = tmcl.py __init__.py
pkgpyexec_LTLIBRARIES = _tmcl.la
_tmcl_la_SOURCES = $(srcdir)/swig_wrap.c $(SWIG_SOURCES)
_tmcl_la_CPPLAGS = $(SWIG_PYTHON_CPPFLAGS) -I$(top_srcdir)/src
_tmcl_la_LDFLAGS = -module
_tmcl_la_LIBADD = $(top_builddir)/src/tmcl/libtmcl.la


$(srcdir)/swig_wrap.c: $(SWIG_SOURCES)
	$(SWIG) $(SWIG_PYTHON_OPT) -I$(top_srcdir)/src -o $@ $<

clean-local:
	-rm $(top_srcdir)/pyext/tmcl.py $(top_srcdir)/pyext/*.c