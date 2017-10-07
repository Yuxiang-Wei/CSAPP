#include<stdio.h>

int lower_one_mask(int n){

	int w = sizeof(int) << 3 ; // 即字节数*8 = 位数
	return (unsigned) ~(-0) >> (w-n); // -0 = 0x00000000
}

int main(){

	printf("%x\n",lower_one_mask(6));
	printf("%x\n",lower_one_mask(17));
	printf("%x\n",lower_one_mask(32));
	return 0;
}
