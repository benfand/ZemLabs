.686
.model flat,stdcall
.stack 100h
.data 
X dw 103
XX dw ?
Y dw 12
YY dw ?
M dw ?
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	
	NEG X ;����� ����� X
	NEG Y ;����� ����� Y

	MOV AX, Y ;������ � AX �������� Y
	IMUL AX, -4 ;��������� �� ������ Y*(-4)

	MOV BX, X ;������ � BX �������� XX
	ADD BX, AX ;�������� XX � YY(�.�. ���. ��������� �������������)

	MOV M, BX ;������ �������� BX � M

exit:
Invoke ExitProcess,1
End Start