.686
.model flat,stdcall
.stack 100h
.data
X dd 54697
Y dd 12799
Z dd 21845

L dd ?
M dd ?
R dd ?
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	mov EBX, Y ;���������� � ������� EBX ����� Y
	DEC X ;��������� ����� X �� 1

	mov AX, 0 ;�������� ����� 0 � AX
	while_start: 
		
		cmp AX, 3 ;���������� ����� AX � 3
		jnl end_while ;���� AX>3 ������� �� �����

			add EBX, X ;���������� � �������� EBX ����� X

		add AX,1 ;���������� 1 � AX
		jmp while_start ;������� � ������ �����
	end_while:
		mov L,EBX ;���������� ������ EBX � L

	mov EBX, X ;������ � EBX X
	or EBX,Z ;EBX or Z
	mov M, EBX ;M = EBX

	;�������� ��� ������ �����������
	if_start:
		cmp M, 4328
		jbe yes
		ja no
	yes: ;���� M<=10E8
			call pp2 ;������� ��2

		jmp if_end
	no: ;���� M>10E8
			call pp1 ;������� ��1

		jmp if_end
	if_end:

	jpe adr2 ;���� ������ ���-�� ������ � R, �� ������� � adr2, ����� ���������� adr1
	jpo adr1

	adr1:
		
		jmp exit
	adr2:

exit:

	;������������ 1:
	pp1 proc
		MOV EBX, M ;EBX=M
		SUB EBX, 8479 ;M-211F
		MOV R, EBX ;R=EBX
		ret
	pp1 endp

	;������������ 2:
	pp2 proc
		MOV EBX, M ;EBX=M
		ADD EBX, 464 ;M+1D0
		MOV R, EBX ;R=EBX
		ret
	pp2 endp

Invoke ExitProcess,1
End Start