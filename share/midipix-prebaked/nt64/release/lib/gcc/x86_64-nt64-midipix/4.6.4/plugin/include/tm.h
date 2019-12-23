#ifndef GCC_TM_H
#define GCC_TM_H
#ifdef IN_GCC
# include "options.h"
# include "insn-constants.h"
# include "config/vxworks-dummy.h"
# include "config/i386/biarch64.h"
# include "config/i386/i386.h"
# include "config/i386/unix.h"
# include "config/i386/bsd.h"
# include "config/i386/gas.h"
# include "config/dbxcoff.h"
# include "config/i386/midipix.h"
# include "config/glibc-stdint.h"
# include "config/i386/ssemath.h"
#endif
#if defined IN_GCC && !defined GENERATOR_FILE && !defined USED_FOR_TARGET
# include "insn-flags.h"
#endif
# include "defaults.h"
#endif /* GCC_TM_H */
