#ifndef __OVERLAY1_H_
#define __OVERLAY1_H_

void writemode();
void colorwrite();
void palette_draw();
void palette_returnscreencode();
void palette();
void resizewidth();
void resizeheight();

#pragma compile("overlay1.c")

#endif // __OVERLAY1_H_