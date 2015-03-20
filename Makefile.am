# "foreign" means not GNU, and is common for avoiding boring messages 
# about files organized differently from what gnu expects
AUTOMAKE_OPTIONS = foreign
ACLOCAL_AMFLAGS = -I m4

include doxygen.am
SUBDIRS = src example pyext doc

EXTRA_DIST = build-aux bootstrap.sh  $(DX_CONFIG)

datarootdir = @datarootdir@
