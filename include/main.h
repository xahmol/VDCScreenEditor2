#ifndef __MAIN_H_
#define __MAIN_H_

char dosCommand(const char lfn, const char drive, const char sec_addr, const char *cmd);
unsigned cmd(const char device, const char *cmd);
signed int textInput(char xpos, char ypos, char *str, char width, char lines);
void printcentered(const char *text, char xpos, char ypos, char width);
char VDC_Attribute(char textcolor, char blink, char underline, char reverse, char alternate);
void initoverlay();
void loadoverlay(char overlay_select);
char *screenmap_screenaddr(unsigned row, unsigned col, unsigned width);
char *screenmap_attraddr(unsigned row, unsigned col, unsigned width, unsigned height);
void screenmapplot(char row, char col, char screencode, char attribute);
void placesignature();
void screenmapfill(char screencode, char attribute);
void cursormove(char left, char right, char up, char down);
void undo_new(char row, char col, char width, char height);
void undo_performundo();
void undo_escapeundo();
void undo_performredo();
void helpscreen_load(char screennumber);
void loadsyscharset();
void restorealtcharset();
void plotcursor();
void hidecursor();
void resetcursor();
void plotmove(char direction);
void change_plotcolor(char newval);
char getmaxy();
char getmaxx();
void printstatusbar();
void initstatusbar();
void hidestatusbar();
void togglestatusbar();
void showchareditfield(char stdoralt);
void updatecanvas();
unsigned charaddress(char screencode, char stdoralt, char vdcormem);
void showchareditgrid(unsigned screencode, char stdoralt);

#endif // __MAIN_H_