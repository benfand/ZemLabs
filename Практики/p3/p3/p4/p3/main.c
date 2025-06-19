#include <8051.h>
void main()
{
	unsigned int i;
	unsigned char *str="Hello!";
	unsigned int c;
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0x80;
	P2 = 0x1;
	P2 = 0x0;
	
	c = 0; // c = cur pos
	while(1){
		if(c==15){
			P0 = 0x2; //Goto first pos
			P2 = 0x1;
			P2 = 0x0;
			
			c=0;
		}
		
		for(i=0;i<6;i++) //Print phrase
		{
			P0 = str[i];
			P2 = 0x3;
			P2 = 0x2;
		}

		P0 = 0x2; //Goto first pos
			P2 = 0x1;
			P2 = 0x0;
		
		c=c+1;
		for(i=0;i<c;i++){
			P0 = 0x06; //Go one right
			P2 = 0x1;
			P2 = 0x0;
		}
				

	}
}