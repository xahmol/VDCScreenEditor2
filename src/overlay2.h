#ifndef __OVERLAY2_H_
#define __OVERLAY2_H_

void plotvisible(unsigned char row, unsigned char col, unsigned char setorrestore);
void lineandbox(unsigned char draworselect);
void movemode();
void selectmode();

#pragma compile("overlay2.c")

#endif // __OVERLAY2_H_