	AREA RESET,CODE
	PRESERVE8
	EXPORT __Vectors
	EXPORT Reset_Handler
	EXPORT my_asm_func
__Vectors
	DCD __initial_sp
	DCD Reset_Handler
	SPACE 9*4
	DCD  SVC_Handler

		
my_asm_func PROC	;中断引导程序
	ldr r1,=SUMMATION


	push {r5}
	svc 0		;0号中断开始，跳转至SUMMATION子程序
	B theend
	ENDP
	
SVC_Handler  PROC
	BX r1
	ENDP 	


Reset_Handler PROC	;主程序
	NOP
x	DCD 0X20000111;学号假定地址
	ldr r5,x
	mov r0,#204
	str r0,[r5]; 写入学号后八位
	IMPORT gpio_a
	ldr r1,=gpio_a
	bx r1  			;跳转C
theend
	
	IMPORT Light
	b Light
	B .
	ENDP
		
		
SUMMATION PROC		;中断程序，实现求和输出
	add r13,r13,#0x24	;恢复中断保存现场前sp值
	pop {r5}
	ldr r0,[r5];读入数据
	ldr r2,=0;统计和的结果
loop
	cmp r0,#0;比较是否已经除尽了
	bls ends;除到0就跳出
	ldr r3,=10
	udiv r1,r0,r3
	mls r3,r1,r3,r0;得出本次消除的个位数字
	add r2,r3;作和
	mov r0,r1;重新赋值r0继续循环
	b loop;
ends
	ldr r3,=10
	udiv r1,r2,r3
	mls r5,r1,r3,r2;求出和的个位赋值给R5
	mov r0,r5
	ENDP
		
	
		
	AREA STACK,DATA
	SPACE 0x100
__initial_sp

	END