`timescale 1ns / 1ps
`include "defines.v"

module Memory(
	input wire clk,
    input wire rst,
    input wire [3:0] icode,
    input wire [`WORD] valE,
    input wire [`WORD] valA,
    input wire [`WORD] valP,
	output reg mem_read,
 	output reg mem_write,
 	output reg [63:0] mem_addr,
 	output reg [63:0] mem_data,
    output reg Stat
 );
 	
 	
 	
 	always @(*)	begin
 			mem_read <= 0;
 			mem_write <= 0;
 			case(icode)
 					`IMRMOVQ:		begin
 							mem_addr <= valE;
 							mem_read <= 1;
 					end
 					`IRMMOVQ:		begin
 							mem_addr <= valE;
 							mem_data <= valA;
 							mem_write <= 1;
 					end
 					`IPUSHQ:		begin
 							mem_addr <= valE;
 							mem_data <= valA;
 							mem_write <= 1;
 					end
 					`ICALL:		begin
 							mem_addr <= valE;
 							mem_data <= valP;
 							mem_write <= 1;
 					end
 					`IPOPQ:	begin
 							mem_addr <= valA;
 							mem_read <= 1;
 					end
 					`IRET:		begin
 							mem_addr <= valA;
 							mem_read <= 1;
 					end
 			endcase
 			
 			//TODO  Stat
 			
 	end
endmodule