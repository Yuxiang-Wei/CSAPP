#!/usr/bin/python

def readfile(filename):
	txt = []
	file =  open(filename)
	data = file.readlines()
	for eachline in data:
		data1 = eachline.split('|')[0]
		if ':' in data1:
			data1 = data1.split(':')[1].lstrip().rstrip()
			txt.append(data1)
	file.close()
	return txt

def write(txt):
	file = open("inst_rom.data","w")
	i = 0
	for eachline in txt:
		for eachchar in eachline:
			file.write(eachchar)
			i = i +1
			if(i % 2 == 0):
				file.write(' ')
				i = 0
		file.write('\n')
	file.close()


def main():
	txt = []
	txt = readfile("asum.yo")
	write(txt)

# execute main only if called as a script
if __name__ == "__main__":
    main()
