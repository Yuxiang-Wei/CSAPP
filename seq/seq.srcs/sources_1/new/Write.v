`timescale 1ns / 1ps
`include "defines.v"

module Write(
			input wire clk,
			input wire rst,
			input wire Cnd,
			input wire [3:0] icode,
			input wire [3:0] rA,
			input wire [3:0] rB,
			output reg [3:0] dstM,
			output reg [3:0] dstE
			);
    
   	 /*  RNONE  不需要寄存器 */ 
    always @(*)	begin
		case(icode)
			`INOP:	begin
				dstM = `RNONE;
				dstE = `RNONE;
			end
			`IHALT:	begin
				dstM = `RNONE;
				dstE = `RNONE;
			end 
			`IRRMOVQ:	begin  // 也是CMOV
				dstE = Cnd == 1 ? rB : `RNONE;
				dstM = `RNONE;
			end
			`IIRMOVQ:	begin
				dstM = `RNONE;
				dstE = rB;
			end
			`IRMMOVQ:	begin
				dstM = `RNONE;
				dstE = `RNONE;
			end
			`IMRMOVQ:	begin
				dstM = rA;
				dstE = `RNONE;
			end
			`IOPQ:	begin
				dstM = `RNONE;
				dstE = rB;
			end
			`IJXX:	begin
				dstM = `RNONE;
				dstE = `RNONE;
			end
			`ICALL:	begin
				dstM = `RNONE;
				dstE = `RRSP;
			end
			`IRET:	begin
				dstM = `RNONE;
				dstE = `RRSP;
			end
			`IPUSHQ:	begin
				dstM = `RNONE;
				dstE = `RRSP;
			end
			`IPOPQ:	begin
				dstM = rA;
				dstE = `RRSP;
			end
			`IIADDQ:	begin
				dstM = `RNONE;
				dstE = rB;
			end
		endcase
    end
endmodule
