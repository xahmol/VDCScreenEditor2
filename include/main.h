#ifndef __MAIN_H_
#define __MAIN_H_

// Function prototypes
char dosCommand(const char lfn, const char drive, const char sec_addr, const char *cmd);
unsigned cmd(const char device, const char *cmd);
signed textInput(unsigned char xpos, unsigned char ypos, char *str, unsigned char size);
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
char readDir(char device, char filter);
void drawDirFrame(char device);
void printElementPriv(const char ypos);
void printDir(char device);
void refreshDir(char device, char filter);
void updateMenu(void);
char filepicker(char filter);
char import_dialogue(char mode, const char *message);

#endif // __MAIN_H_