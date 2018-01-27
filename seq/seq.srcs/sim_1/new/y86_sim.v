`timescale 1ns / 1ps

module y86_sim();

reg clk;
reg rst;
wire [63:0]rax;
wire [63:0]rcx;
wire [63:0]rdx;
wire [63:0]rbx;
wire [63:0]rsp;
wire [63:0]rbp;
wire [63:0]rsi;
wire [63:0]rdi;
wire [63:0]r8,r9,r10,r11,r12,r13,r14,r15;

initial begin
	clk = 0;
	rst = 0;
end

 always #10 clk = ~clk;

y86cpu_a sim1(clk,rst,rax,rcx,rdx,rbx,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14,r15);

endmodule
