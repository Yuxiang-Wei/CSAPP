#include<stdio.h>

unsigned replace_byte(unsigned x, int i, unsigned char b){

        /* 1. 首先将 0x12345678 变为 0x12005678 */
        int shift_left = i << 3;
        unsigned m = x & ~(0xFF << shift_left);

        /* 2. 将 0xAB 左移 2 两个字节得到数值 0x00AB0000 */
        unsigned n = (unsigned)b << shift_left;

        /* 3. 将 0x12005678+0x00AB0000 作为结果返回 */
        return m | n;
}	

int main(){

	printf("%x\n",replace_byte(0x12345678,0,0xAB));
	printf("%x\n",replace_byte(0x12345678,1,0xAB));
	printf("%x\n",replace_byte(0x12345678,2,0xAB));
	
	return 0;
}
