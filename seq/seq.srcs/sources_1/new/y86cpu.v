`timescale  1 ps / 1 ps
`include "defines.v"

module y86cpu(
    input   wire                clk,
    input   wire                rst,
    input   wire[`INSTBUS]      rom_data_i,
    input   wire[`WORD]         mem_data_i,
    output  wire                mem_read_o,
    output  wire                mem_write_o,
    output  wire[`WORD]         mem_addr_o,
    output  wire[`WORD]         mem_data_o,
    output  wire[`WORD]         rom_addr_o,
	output  wire[`INSTBUS] inst,
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
	output [63:0]r15
);

	wire [3:0]icode;
	wire [3:0]ifun;
	wire [`WORD]pc;
	wire [3:0]rA;
	wire [3:0]rB;
	wire [`WORD]valP;
	wire [`WORD]valC;
	wire [`WORD]valA;
	wire [`WORD]valB;
	wire [`WORD]valM;
	wire [`WORD]valE;
	wire [3:0]srcA;
	wire [3:0]srcB;
	wire [3:0]dstM;
	wire [3:0]dstE;
	wire [3:0]Cnd;
	
	
	Fetch f(clk, rst, pc, rom_data_i, icode, ifun, rA, rB, valP, valC);
	Decode d(clk, rst, icode, ifun, rA, rB, srcA, srcB);
	regfile r(clk, rst, srcA, srcB, dstM, dstE, valM, valE, valA, valB,rax,rcx,rdx,rbx,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14,r15);
	Execute e(clk, rst, icode, ifun, valA, valB, valC, valE, Cnd);
	Write w(clk, rst, Cnd, icode, rA, rB, dstM, dstE);
	Memory m(clk, rst, icode, valE, valA, valP, mem_read_o, mem_write_o, mem_addr_o, mem_data_o);
	inst_rom i(clk,valM, pc, mem_read_o, mem_write_o, mem_addr_o, mem_data_o, valM, inst);
	Update p(clk, rst, icode, Cnd, valP, valM, valC, pc);
	assign rom_addr_o = pc;
	
endmodule