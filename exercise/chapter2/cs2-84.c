
int float_le(float x, float y){
	unsigned ux = f2u(x);
	unsigned uy = f2u(y);

	/* Get the sign bits */
	unsigned sx = ux >> 31;
	unsigned sy = uy >> 31;

	/* Give an exprssion using only ux, uy, sx, and sy */
	return (ux << 1 == 0 && uy << 1 == 0) ||                                   // +0 = -0
		(sx == sy ? (sx == 0 ? ux <= uy : ux >= uy) : sx > sy);            // 判断大小
}


