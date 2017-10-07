
viod *calloc(size_t nmemb, size_t size){

	size_t buf_size = nmemb * size;
	if(!size||buf_size / size == nmemb){  //验证是否溢出
	
		void *p = malloc(buf_size);
		return (*p, 0, buf_size);
	}
	
	return NULL;
}
