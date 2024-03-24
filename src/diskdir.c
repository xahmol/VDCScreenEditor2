#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>

#define X(a, b, c) linebuffer[len - 3] == a &&linebuffer[len - 2] == b &&linebuffer[len - 1] == c

#define CBM_T_REG 0x10 /* Bit set for regular files */
#define CBM_T_SEQ 0x10
#define CBM_T_PRG 0x11
#define CBM_T_USR 0x12
#define CBM_T_REL 0x13
#define CBM_T_VRP 0x14 /* Vorpal fast-loadable format */
#define CBM_T_DEL 0x00
#define CBM_T_CBM 0x01	  /* 1581 sub-partition */
#define CBM_T_DIR 0x02	  /* IDE64 and CMD sub-directory */
#define CBM_T_LNK 0x03	  /* IDE64 soft-link */
#define CBM_T_OTHER 0x04  /* File-type not recognized */
#define CBM_T_HEADER 0x05 /* Disk header / title */
#define CBM_T_FREE 100
#define DISK_ID_LEN 5
#define CBM_A_RO 1 /* Read only   */
#define CBM_A_WO 2 /* Write only  */
#define CBM_A_RW 3 /* Read, Write */

static const char progressBar[4] = {0xA5, 0xA1, 0xA7, ' '};
static const char progressRev[4] = {0, 0, 1, 1};
char disk_id_buf[5];

struct DirEntry
{
	char name[17]; /* File name in PetSCII, limited to 16 chars */
	unsigned size; /* Size, in 254-/256-byte blocks */
	char type;
	char access;
};
struct DirElement
{
	struct DirEntry dirent;
	struct DirElement *next;
	struct DirElement *prev;
};
struct DirElement direlement_size;
struct DirElement *previous;
struct DirElement *current;
struct DirElement *next;

struct Directory
{
	/// 16 characters name
	/// 1 comma
	/// 5 characters ID
	/// NUL
	char name[16 + 1 + 5 + 1];
	struct DirElement *firstelement;
	struct DirElement *selected;
	struct DirElement *firstprinted;
	/// current cursor position
	unsigned int pos;
	/// number of free blocks
	unsigned int free;
};
struct Directory cwd;

const char *value2hex = "0123456789abcdef";
const char *reg_types[] = {"SEQ", "PRG", "URS", "REL", "VRP"};
const char *oth_types[] = {"DEL", "CBM", "DIR", "LNK", "OTH", "HDR"};
char bad_type[4];
char linebuffer[81];
char linebuffer2[81];
char DIRH = 19;

void freeDir()
{
	if (!cwd.name[0])
		return;

	current = cwd.firstelement;
	while (current)
	{
		next = current->next;
		free(current);
		current = next;
	}

	cwd.name[0] = 0;
}

void dir_close(char lfn)
// Closse a directory opened for reading
{
	krnio_clrchn();
	krnio_close(lfn);
}

char dir_open(char lfn, unsigned char device)
// Open a directory for reading
{
	// Set name for directory
	krnio_setbnk(0, 0);
	krnio_setnam("$");

	// Open the directory
	if (krnio_open(lfn, device, 0))
	{
		// Switch input to file
		if (krnio_chkin(lfn))
		{
			// Skip BASIC load address
			krnio_chrin();
			krnio_chrin();

			if (krnio_status())
			{
				dir_close(lfn);
			}
		}
		else
		{
			dir_close(lfn);
		}
	}

	// No success
	return krnio_status();
}

char dir_readentry(const char lfn, struct DirEntry *l_dirent)
// Read the next directory entry
{
	char b, len;
	char i = 0;

	// check that device is ready
	b = krnio_chrin();
	if (!b)
	{
		// No entry found
		return 1;
	}
	if (krnio_status())
	{
		return 7;
	}

	// Skip second basic link byte
	krnio_chrin();

	// read file size
	l_dirent->size = krnio_chrin();
	l_dirent->size |= (krnio_chrin()) << 8;

	// read line into linebuffer
	memset(linebuffer, 0, sizeof(linebuffer));
	while (1)
	{
		// read byte
		b = krnio_chrin();
		// EOL?
		if (b == 0)
		{
			break;
		}
		// append to linebuffer
		if (i < sizeof(linebuffer))
		{
			linebuffer[i++] = b;
		}
		// return if reading had error
		if (krnio_status())
		{
			krnio_clrchn();
			return 2;
		}
	}
	printf("%u %s\n", l_dirent->size, linebuffer);

	// handle "B" BLOCKS FREE
	if (linebuffer[0] == 'b')
	{
		l_dirent->type = CBM_T_FREE;
		return 0;
	}

	// check that we have a minimum amount of characters to work with
	if (i < 5)
	{
		return 3;
	}

	// strip whitespace from right part of line
	for (len = i; len > 0; --len)
	{
		b = linebuffer[len];
		if (b == 0 ||
			b == ' ' ||
			b == 0xA0)
		{
			linebuffer[len] = 0;
			continue;
		}
		++len;
		break;
	}

	// parse file name

	// skip until first "
	for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
	{
		// do nothing
	}

	// copy filename, until " or max size
	b = 0;
	for (++i; i < sizeof(linebuffer) && linebuffer[i] != '"' && b < 16; ++i)
	{
		l_dirent->name[b++] = linebuffer[i];
	}

	// check file type
	if (X('p', 'r', 'g'))
	{
		l_dirent->type = CBM_T_PRG;
	}
	else if (X('s', 'e', 'q'))
	{
		l_dirent->type = CBM_T_SEQ;
	}
	else if (X('u', 's', 'r'))
	{
		l_dirent->type = CBM_T_USR;
	}
	else if (X('d', 'e', 'l'))
	{
		l_dirent->type = CBM_T_DEL;
	}
	else if (X('r', 'e', 'l'))
	{
		l_dirent->type = CBM_T_REL;
	}
	else if (X('c', 'b', 'm'))
	{
		l_dirent->type = CBM_T_CBM;
	}
	else if (X('d', 'i', 'r'))
	{
		l_dirent->type = CBM_T_DIR;
	}
	else if (X('v', 'r', 'p'))
	{
		l_dirent->type = CBM_T_VRP;
	}
	else if (X('l', 'n', 'k'))
	{
		l_dirent->type = CBM_T_LNK;
	}
	else
	{
		// parse header
		l_dirent->type = CBM_T_HEADER;

		// skip one character which should be "
		if (linebuffer[i] == '"')
		{
			++i;
		}
		// skip one character which should be space
		if (linebuffer[i] == ' ')
		{
			++i;
		}

		// copy disk ID
		for (b = 0; b < DISK_ID_LEN; ++b)
		{
			if (linebuffer[i])
			{
				disk_id_buf[b] = linebuffer[i];
			}
			i++;
		}
		disk_id_buf[b]=0;

		// strip disk name
		for (b = 15; b > 0; --b)
		{
			if (l_dirent->name[b] == 0 ||
				l_dirent->name[b] == ' ' ||
				l_dirent->name[b] == 0xA0)
			{
				l_dirent->name[b] = 0;
				continue;
			}
			break;
		}

		return 0;
	}

	// parse read-only
	l_dirent->access = (linebuffer[i - 4] == 0x3C) ? CBM_A_RO : CBM_A_RW;

	return 0;
}

// char dir_readentry(const char device, struct DirEntry *l_dirent)
//// Read the next directory entry
//{
//	char b, len;
//	char i = 0;
//
//	b = krnio_chrin();
//	if (!b)
//	{
//		// No entry found
//		return 0;
//	}
//
//	// Skip second basic link byte
//	krnio_chrin();
//
//	// Read line number (size in blocks)
//	b = krnio_chrin();
//	l_dirent->size = b;
//	b = krnio_chrin();
//	l_dirent->size += 256 * b;
//
//	// Read file name, reading till end of basic line
//	memset(linebuffer, 0, sizeof(linebuffer));
//	while ((b = krnio_chrin()) > 0)
//	{
//		linebuffer[i++] = b;
//	}
//	linebuffer[i++] = 0;
//	printf("%u %s\n", l_dirent->size, linebuffer);
//
//	// handle "B" BLOCKS FREE
//	if (linebuffer[0] == 'b')
//	{
//		l_dirent->type = CBM_T_FREE;
//		return 1;
//	}
//
//	// check that we have a minimum amount of characters to work with
//	if (i < 5)
//	{
//		return 0;
//	}
//
//	// strip whitespace from right part of line
//	for (len = i; len > 0; --len)
//	{
//		b = linebuffer[len];
//		if (b == 0 ||
//			b == ' ' ||
//			b == 0xA0)
//		{
//			linebuffer[len] = 0;
//			continue;
//		}
//		++len;
//		break;
//	}
//
//	// parse file name
//
//	// skip until first "
//	for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
//	{
//		; // do nothing
//	}
//
//	// copy filename, until " or max size
//	b = 0;
//	for (++i; i < sizeof(linebuffer) && linebuffer[i] != '"' && b < 16; ++i)
//	{
//		l_dirent->name[b++] = linebuffer[i];
//	}
//
//	// check file type
//	if (X('p', 'r', 'g'))
//	{
//		l_dirent->type = CBM_T_PRG;
//	}
//	else if (X('s', 'e', 'q'))
//	{
//		l_dirent->type = CBM_T_SEQ;
//	}
//	else if (X('u', 's', 'r'))
//	{
//		l_dirent->type = CBM_T_USR;
//	}
//	else if (X('d', 'e', 'l'))
//	{
//		l_dirent->type = CBM_T_DEL;
//	}
//	else if (X('r', 'e', 'l'))
//	{
//		l_dirent->type = CBM_T_REL;
//	}
//	else if (X('c', 'b', 'm'))
//	{
//		l_dirent->type = CBM_T_CBM;
//	}
//	else if (X('d', 'i', 'r'))
//	{
//		l_dirent->type = CBM_T_DIR;
//	}
//	else if (X('v', 'r', 'p'))
//	{
//		l_dirent->type = CBM_T_VRP;
//	}
//	else if (X('l', 'n', 'k'))
//	{
//		l_dirent->type = CBM_T_LNK;
//	}
//	else
//	{
//		// parse header
//		l_dirent->type = CBM_T_HEADER;
//
//		// skip one character which should be "
//		if (linebuffer[i] == '"')
//		{
//			++i;
//		}
//		// skip one character which should be space
//		if (linebuffer[i] == ' ')
//		{
//			++i;
//		}
//
//		// copy disk ID
//		for (b = 0; b < DISK_ID_LEN; ++b)
//		{
//			disk_id_buf[b] = linebuffer[b];
//		}
//
//		// strip disk name
//		for (b = 15; b > 0; --b)
//		{
//			if (l_dirent->name[b] == 0 ||
//				l_dirent->name[b] == ' ' ||
//				l_dirent->name[b] == 0xA0)
//			{
//				l_dirent->name[b] = 0;
//				continue;
//			}
//			break;
//		}
//
//		return 1;
//	}
//
//	// parse read-only
//	l_dirent->access = (linebuffer[i - 4] == 0x3C) ? CBM_A_RO : CBM_A_RW;
//
//	return 1;
//}

int main(void)
{
	struct DirEntry *diritem;
	char error;

	if (!dir_open(15, 9))
	{
		// Loop while we have more lines
		//		int ch;
		//		while ((ch = krnio_chrin()) > 0)
		//		{
		//			unsigned line;
		//			char buff[40];
		//
		//			// Skip second basic link byte
		//			krnio_chrin();
		//
		//			// Read line number (size in blocks)
		//			ch = krnio_chrin();
		//			line = ch;
		//			ch = krnio_chrin();
		//			line += 256 * ch;
		//
		//			// Read file name, reading till end of basic line
		//			int n = 0;
		//			while ((ch = krnio_chrin()) > 0)
		//				buff[n++] = ch;
		//			buff[n] = 0;
		//
		//			// Print size and name
		//
		//			printf("%u %s\n", line, buff);
		//		}

		printf("dir opened.\n");
//		do
//		{
			diritem = calloc(1, sizeof(direlement_size));
			error = dir_readentry(15, diritem);
			//printf("%u\n", error);
//			if (error)
//			{
//				break;
//			}
			printf("%u %s %2x %s (%4x)\n", diritem->size, diritem->name, diritem->type, disk_id_buf, diritem);
//		} while (1);

		// Reset channels
		dir_close(15);
	}

	return 0;
}
