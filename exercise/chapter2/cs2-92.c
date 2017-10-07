#include<stdio.h>
#include<string.h>

typedef unsigned float_bits;

unsigned int f2u(float f) {
	unsigned int i;
	memcpy(&i, &f, 4);
	return i;
}

float u2f(unsigned u) {
	float i;
	memcpy(&i, &u, 4);
	return i;
}

float_bits float_negate(float_bits f) {
  unsigned sig = f >> 31;
  unsigned exp = f >> 23 & 0xFF;
  unsigned frac = f & 0x7FFFFF;

  int is_NaN = (exp == 0xFF) && (frac != 0);
  if (is_NaN) {
    return f;
  }

  return ~sig << 31 | (exp << 23) | frac;
}

int main(){
	float x;
	while(scanf("%f",&x)){
		unsigned ux = f2u(x);
		unsigned fnux = float_negate(ux);
		printf("%x\n",ux);
		printf("%x\n",fnux);
		printf("%f\n",u2f(fnux));
	}
	
	getchar();
	
	return 0;
}


