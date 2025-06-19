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
	
	NEG X ;Смена знака X
	NEG Y ;Смена знака Y

	MOV AX, Y ;Запись в AX значения Y
	IMUL AX, -4 ;Умножение со знаком Y*(-4)

	MOV BX, X ;Запись в BX значения XX
	ADD BX, AX ;Сложение XX с YY(т.к. рез. умножения положительный)

	MOV M, BX ;Запись значения BX в M

exit:
Invoke ExitProcess,1
End Start