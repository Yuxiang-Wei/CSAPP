
// A.因为sizeof的返回值是size_t,而size_t是真么定义的:typedef unsigned int size_t，也就是说它是一个unsigned int型,int与unsigned int相减得到的是一个unsigned int类型的数,即非负数(>=0),所以if内永远为真.

// B.改正如下:

void copy_int(int val, void *buf, int maxbytes){
	if(maxbytes >= (int) sizeof(val))  //转成int即可比较大小
		memcpy(buf, (void *) &val, sizeof(val));
}
