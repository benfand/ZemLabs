#include <htc.h>
unsigned int tmpCnt;
void imp(unsigned int cnt)
{
	do{ }while(TF2==0);
	TF2 = 0;
	P10 = 1;
	while (cnt != 0)cnt--;
	P10 = 0;
}

void main()
{
	tmpCnt = 2400;
	P0=0;
	P2=0;
	P1 = 0xFE;
	RCAP2H = 0x401;
	RCAP2L = 0x401;
	T2CON &= 0xFC;
	ET2 = 1;
	EA = 1;
	T2CON |= 0x4;

	while(1)
	{
		if(P0==1)
		{
			tmpCnt = 1680;
		}
		else if(P2==1)
		{
			tmpCnt = 2400;
		}
		imp(tmpCnt);
	}
}