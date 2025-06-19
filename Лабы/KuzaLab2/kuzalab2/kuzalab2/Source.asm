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
	mov EBX, Y ;Записываем в регистр EBX число Y
	DEC X ;Уменьшить число X на 1

	mov AX, 0 ;Помещаем число 0 в AX
	while_start: 
		
		cmp AX, 3 ;Сравниваем число AX и 3
		jnl end_while ;Если AX>3 выходим из цикла

			add EBX, X ;Прибавляем к регистру EBX число X

		add AX,1 ;Прибавляем 1 к AX
		jmp while_start ;Возврат в начало цикла
	end_while:
		mov L,EBX ;Записываем данные EBX в L

	mov EBX, X ;Запись в EBX X
	or EBX,Z ;EBX or Z
	mov M, EBX ;M = EBX

	;Проверка для вызова подпрограмм
	if_start:
		cmp M, 4328
		jbe yes
		ja no
	yes: ;если M<=10E8
			call pp2 ;Вызвать пп2

		jmp if_end
	no: ;если M>10E8
			call pp1 ;Вызвать пп1

		jmp if_end
	if_end:

	jpe adr2 ;Если четное кол-во единиц в R, то переход в adr2, иначе выполнится adr1
	jpo adr1

	adr1:
		
		jmp exit
	adr2:

exit:

	;Подпрограмма 1:
	pp1 proc
		MOV EBX, M ;EBX=M
		SUB EBX, 8479 ;M-211F
		MOV R, EBX ;R=EBX
		ret
	pp1 endp

	;Подпрограмма 2:
	pp2 proc
		MOV EBX, M ;EBX=M
		ADD EBX, 464 ;M+1D0
		MOV R, EBX ;R=EBX
		ret
	pp2 endp

Invoke ExitProcess,1
End Start