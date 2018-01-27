`timescale  1 ps / 1 ps
`include "defines.v"

module y86cpu_a(
				input wire clk,
				input wire rst,
				output  [63:0]rax,
				output  [63:0]rcx,
				output	 [63:0]rdx,
				output [63:0]rbx,
				output [63:0]rsp,
				output [63:0]rbp,
				output [63:0]rsi,
				output [63:0]rdi,
				output [63:0]r8,
				output [63:0]r9,
				output [63:0]r10,
				output [63:0]r11,
				output [63:0]r12,
				output [63:0]r13,
				output [63:0]r14,
				output [63:0]r15);
	wire [`WORD] inst_addr;
    wire [`INSTBUS] inst;
	wire [`INSTBUS] inst1;
    wire [`WORD] mem_cpu_data;
    wire [`WORD] cpu_mem_data;
    wire cpu_mem_read;
    wire cpu_mem_write;
    wire [`WORD] cpu_mem_addr;
	
		y86cpu y86(clk, rst, inst, mem_cpu_data, cpu_mem_read, cpu_mem_write, cpu_mem_addr, cpu_mem_data, inst_addr,inst,rax,rcx,rdx,rbx,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14,r15);
//		inst_trans ins(clk, rst, inst1,inst);
endmodule