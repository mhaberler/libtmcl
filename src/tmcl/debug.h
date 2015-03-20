/* debug.h
 * 
 * Macro for enabling some debug output
 */

#ifndef DEBUG_H_
#define DEBUG_H_

/* Include autoconf 'config.h' */
#if HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */

/* Debugging output macro */
#ifdef DEBUG_OUTPUT
#  include <stdio.h>

# if __STDC_VERSION__ >= 199901L /* Need C99 support for varargs */
#   define DEBUG(...)  { (void) fprintf(stderr, "DEBUG:(%s:%d):\t", __FILE__, __LINE__); \
	fprintf (stderr, __VA_ARGS__); }
# else /* __C99 */
#   error "Need C99 support for debug output"
# endif

#else /* DEBUG_OUTPUT */
#  define DEBUG(...)  ((void) 0)
#endif /* DEBUG_OUTPUT */

#endif /* DEBUG_H_ */
