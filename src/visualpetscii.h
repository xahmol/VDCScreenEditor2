#ifndef __VISUALPETSCII_H_
#define __VISUALPETSCII_H_

/* Address mapping for visual PETSCII map */
#define PETSCIIMAP 0x0C00 // PETSCII map in RS232 buffer

extern char visualpetscii[256];

#pragma compile("visualpetscii.c")

#endif // __VISUALPETSCII_H_