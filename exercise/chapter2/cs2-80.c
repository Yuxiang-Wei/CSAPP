
// 先除4,再乘3,可以保证不会溢出,之后再加上后之前缺失的精度

#include<stdio.h>

int threeforths(int x) {
	int r = x & 0x3;

	int xd4 = x >> 2;
	int xd4m3 = (xd4 << 1) + xd4;

	int bias = (x >> 31) & 0x3;  // 求出偏置,x为正数时为0,x为负数时是0x3
	int rm3 = (r << 1) + r;
	int rm3d4 = (rm3 + bias) >> 2; //x的最后两位*3/4所得结果

 	return xd4m3 + rm3d4;
}

int main(){
	int i;
	for(i=0;i<100;i++){
        printf("%d  %d\n",3*i/4 , threeforths(i) );
	}
	for(i=0;i>-100;i--){
        printf("%d  %d\n",3*i/4 , threeforths(i) );
	}
}
