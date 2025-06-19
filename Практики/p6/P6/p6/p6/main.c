#include <8051.h> 

void tput(unsigned char c1) 
{ 
SBUF=c1;  
while(!TI); 
TI=0;  
}
void main() 
{  
int i; 

unsigned char *src = (unsigned char *)0x30;
src[0] = 'D';
src[1] = 'a';
src[2] = 'n';
src[3] = 'i';
src[4] = 'i';
src[5] = 'l';

TMOD= 0x20;
TH1= 0x0FD;
PCON=0x80; 
TR1=0x1;
for(i=0; i<6; i++) 
{ 
ACC=src[i];  
SCON = 0x40; 
tput (src[i]); 
} 
while(1){} 
}