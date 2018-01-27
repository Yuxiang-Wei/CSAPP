## 计算机系统课的一些文件


- exercise CSAPP中一些课后习题的答案
- seq  参考[Archstacker/Y86-CPU](https://github.com/Archstacker/Y86-CPU)用verilog实现的Y86-64的顺序模式的CPU
- y86-code 内含y86的汇编代码及其机器码(yo文件)
- yo2data.py 实现yo文件转为verilog工程所需的指令文件(.data)的python脚本

#### seq

vivado工程文件夹，使用目录下seq.xpr可直接打开工程。工程可直接进行行为级仿真。仿真前需将inst_rom.v文件中的initial $readmemh ( "D:/Xilinx/Projects/seq/inst_rom.data",	inst_mem )中的文件路径改为inst_rom.data文件是实际路径，文件位于seq文件夹下。

CPU采用小端模式

#### y86-code

内部的yo文件可用于生成我们仿真所需的二进制文件

#### yo2data.bat

用于执行yo2data.py文件将yo文件转换为inst_rom.data文件，使用前需将yo文件取出，与yo2data.bat放在一起，并命名为input.yo 。存在bug，当Y86-64代码本身不对齐事，需要手动补0。

// TODO


