#include <8051.h>
void main()
{
	unsigned int i;
	unsigned int c;
	unsigned char massiv[1]={
		0xC4, 
		0xC0
	};
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0x80;
	P2 = 0x1;
	P2 = 0x0;
	
	c=0;
	while(1){
		if(c==16){
			P0=0x1;
			P2=0x1;
			P2=0x0;

			c=0;
		}
		
		for(i=0;i<1;i++)
		{
			P0 = massiv[i];
			P2 = 0x3;
			P2 = 0x2;
		}

		P0=0x1;
		P2=0x1;
		P2=0x0;

		c+=1;
		for(i=0;i<c;i++)
		{
			P0 = 0x6;
			P2 = 0x3;
			P2 = 0x2;	
		}
	}
}