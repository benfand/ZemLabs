#include <8051.h>
void main()
{
	unsigned int i;
	unsigned char *str="Hello!";
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0x80;
	P2 = 0x1;
	P2 = 0x0;
	

	while(1){;
		for(i=0;i<6;i++)
		{
			P0 = str[i];
			P2 = 0x3;
			P2 = 0x2;
		}
	
		P0 = 0xC0;
		P2 = 0x1;
		P2 = 0x0;
	
		for(i=0;i<8;i++)
		{
			P0 = str2[i];
			P2 = 0x3;
			P2 = 0x2;
		}
	}
}