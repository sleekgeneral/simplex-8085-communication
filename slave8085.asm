LXI H,0F000H;
LXI B,0FFFFH
;START=FF00,END=55AA
DOWN: 	CALL DELAY
	IN 40H;
	CPI 0FFH;
	JNZ DOWN;
STAGE1:	CALL DELAY
	IN 40H
	CPI 0FFH;
	JZ STAGE1;
	CPI 00H
	JZ STAGE2;
	JMP DOWN;
STAGE2: CALL DELAY
	IN 40H
	MOV M,A;
	INX H
	CPI 0AAH;
	JNZ STAGE2;
	DCX H;
	DCX H;
	MOV A,M;
	CPI 055H;
	INX H
	INX H
	JNZ STAGE2;
	HLT;
DELAY:	DCX B
	MOV E,A
	MOV A,C
	ORA B
	MOV A,E
	RZ
	JMP DELAY