#include "stm32f103.h"
extern void my_asm_func();

int gpio_a()
{
	RCC->APB2ENR=1<<2;
	if(GPIOA->IDR==0)
	{
		GPIOA->ODR=0x4000;			//配置0
		GPIOA->CRH=0x43333333;	//输出
	}
	else{
		my_asm_func();		//转回s汇编进行中断
	}
	
	return 0;
}
void Light(int a)
{
	switch (a)
	{
		case 0:
			GPIOA->ODR=0x4000;
			break;
		case 1:
			GPIOA->ODR=0xff00-0x600;
			break;
		case 2:
			GPIOA->ODR=0xff00-0x5b00;
			break;
		case 3:
			GPIOA->ODR=0xff00-0x4f00;
			break;
		case 4:
			GPIOA->ODR=0xff00-0x6600;
			break;
		case 5:
			GPIOA->ODR=0xff00-0x6d00;
			break;
		case 6:
			GPIOA->ODR=0xff00-0x7d00;
			break;
		case 7:
			GPIOA->ODR=0xff00-0x700;
			break;
		case 8:
			GPIOA->ODR=0xff00-0xff00;
			break;
		case 9:
			GPIOA->ODR=0xff00-0xef00;
			break;
	}
	GPIOA->CRH=0x43333333;	//输出
	return;
}