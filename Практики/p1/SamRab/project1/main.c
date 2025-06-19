#include <8051.h>

void main()
{
int i;
char xdata *ptr; 
char test, nabor;
nabor = 0x55;
P1 = 0x00;
ptr = (char xdata *) 0x100;
for(i=0; i<2048;i++)
{
*ptr=nabor;
test=*ptr;
if(test!=nabor)
{
P1 = 0x01;
}
P1 = 0x00;
ptr++;
}
}