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

		
my_asm_func PROC	;�ж���������
	ldr r1,=SUMMATION


	push {r5}
	svc 0		;0���жϿ�ʼ����ת��SUMMATION�ӳ���
	B theend
	ENDP
	
SVC_Handler  PROC
	BX r1
	ENDP 	


Reset_Handler PROC	;������
	NOP
x	DCD 0X20000111;ѧ�żٶ���ַ
	ldr r5,x
	mov r0,#204
	str r0,[r5]; д��ѧ�ź��λ
	IMPORT gpio_a
	ldr r1,=gpio_a
	bx r1  			;��תC
theend
	
	IMPORT Light
	b Light
	B .
	ENDP
		
		
SUMMATION PROC		;�жϳ���ʵ��������
	add r13,r13,#0x24	;�ָ��жϱ����ֳ�ǰspֵ
	pop {r5}
	ldr r0,[r5];��������
	ldr r2,=0;ͳ�ƺ͵Ľ��
loop
	cmp r0,#0;�Ƚ��Ƿ��Ѿ�������
	bls ends;����0������
	ldr r3,=10
	udiv r1,r0,r3
	mls r3,r1,r3,r0;�ó����������ĸ�λ����
	add r2,r3;����
	mov r0,r1;���¸�ֵr0����ѭ��
	b loop;
ends
	ldr r3,=10
	udiv r1,r2,r3
	mls r5,r1,r3,r2;����͵ĸ�λ��ֵ��R5
	mov r0,r5
	ENDP
		
	
		
	AREA STACK,DATA
	SPACE 0x100
__initial_sp

	END