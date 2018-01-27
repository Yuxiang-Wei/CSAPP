`timescale  1 ps / 1 ps
`include "defines.v"
// ³äµ±¼Ä´æÆ÷×é 
module	regfile(
				input wire clk,
				input wire rst,
				input wire [3:0]srcA,
				input wire [3:0]srcB,
				input wire [3:0]dstM,
				input wire [3:0]dstE,
				input wire [`WORD]valM,
				input wire [`WORD]valE,
				output reg [`WORD]valA,
				output reg [`WORD]valB,
				output [63:0]rax,
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
				
	reg [`WORD] regs [0:15];  //¼Ä´æÆ÷×é
	
	initial regs[0] = 64'H0000000000000000;
	initial regs[1] = 64'H0000000000000000;
	initial regs[2] = 64'H0000000000000000;
	initial regs[3] = 64'H0000000000000000;
	initial regs[4] = 64'H0000000000000000;
	initial regs[5] = 64'H0000000000000000;
	initial regs[6] = 64'H0000000000000000;
	initial regs[7] = 64'H0000000000000000;
	initial regs[8] = 64'H0000000000000000;
	initial regs[9] = 64'H0000000000000000;
	initial regs[10] = 64'H0000000000000000;
	initial regs[11] = 64'H0000000000000000;
	initial regs[12] = 64'H0000000000000000;
	initial regs[13] = 64'H0000000000000000;
	initial regs[14] = 64'H0000000000000000;
	initial regs[15] = 64'H0000000000000000;	
	
	always @(posedge clk)	begin
		if(dstE != `RNONE)	begin
			regs[dstE] = valE;
		end
		if(dstM != `RNONE)	begin
			regs[dstM] = valM;
		end
	end
	
	always @(*)	begin
		if(srcA != `RNONE)	begin
			valA = regs[srcA];
		end
	end
	
	always @(*)	begin
		if(srcB != `RNONE)	begin
			valB = regs[srcB];
		end
	end
	
	assign rax = regs[0];
	assign rcx = regs[1];
	assign rdx = regs[2];
	assign rbx = regs[3];
	assign rsp = regs[4];
	assign rbp = regs[5];
	assign rsi = regs[6];
	assign rdi = regs[7];
	assign r8 = regs[8];
	assign r9 = regs[9];
	assign r10 = regs[10];
	assign r11 = regs[11];
	assign r12 = regs[12];
	assign r13 = regs[13];
	assign r14 = regs[14];
	assign r15 = regs[15];
	
endmodule