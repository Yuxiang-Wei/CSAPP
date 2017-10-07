#include <stdio.h>

int float_f2i(float_bits f) {

	unsigned sig = f >> 31;
	unsigned exp = f >> 23 & 0xFF;
	unsigned frac = f & 0x7FFFFF;
	unsigned bias = 0x7F;

	int num;
	unsigned E = exp - bias;
	unsigned M = frac | 0x800000; //补上默认的1

	if (exp >= 0 && E < 0) {
		num = 0;
	} 
	else if (E >= 31) {
		num = 0x80000000;
	} 
	else {
  
		if (E > 23) {
		num = M << (E - 23);
		} else {
		num = M >> (23 - E);
		}
    
	}
  
	if(sig == 1)
		num = -num;
	
	return num;
  
}
