#ifndef __OVERLAY3_H_
#define __OVERLAY3_H_

int chooseidandfilename(char* headertext, char maxlen);
char checkiffileexists(char* filetocheck, char id);
void loadscreenmap();
void savescreenmap();
void saveproject();
void loadproject();
void loadcharset(char stdoralt);
void savecharset(char stdoralt);
void changebackgroundcolor();
void versioninfo();
void plot_try();
void selectscreenmode();

#pragma compile("overlay3.c")

#endif // __OVERLAY3_H_