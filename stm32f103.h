

struct  _RCC
{
	int CR;
	int CFGR;
	int CIR;
	int APB2RSTR;
	int APB1RSTR;
	int AHBENR;
	int APB2ENR;
	int APB1ENR;
	int BDCR;
	int CSR;
};
#define RCC ((volatile struct _RCC *)0x40021000)


struct  _GPIO
{
	int CRL;
	int CRH;
	int IDR;
	int ODR;
};
#define GPIOA ((volatile struct _GPIO *)0x40010800)


#define GPIOB ((volatile struct _GPIO *)0x40010C00)
	