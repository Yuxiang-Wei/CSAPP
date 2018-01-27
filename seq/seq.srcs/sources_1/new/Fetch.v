`timescale  1 ps / 1 ps
`include "defines.v"
module Fetch( 
			input clk, 
			input rst, 
			input [`WORD]pc, 
			input [`INSTBUS]inst, 
			output reg [3:0]icode,
			output reg [3:0]ifun,
			output reg [3:0]rA,
			output reg [3:0]rB,
			output reg [`WORD]valP,
			output reg [`WORD]valC
			);
			
			reg [`WORD] valN;  //辅助转为小端

	always @(*)	begin
		//取出icode,ifun
		$stop;
		icode = inst[`ICODE];
		ifun = inst[`IFUN];
		case(icode)
			`INOP:	begin
				valP = pc + 64'h1;
			end
			`IHALT:	begin
				valP = pc + 64'h1;
			end 
			`IRRMOVQ:	begin  // 也是CMOV
				valP = pc + 64'h2;
				rA = inst[`RA];
				rB = inst[`RB];
			end
			`IIRMOVQ:	begin
				valP = pc + 64'hA;
				rA = 4'hF;
				rB = inst[`RB];
				valN = inst[`V];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`IRMMOVQ:	begin
				valP = pc + 64'hA;
				rA = inst[`RA];
				rB = inst[`RB];
				valN = inst[`D];
				// 小端数转为正常
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`IMRMOVQ:   begin
				valP = pc + 64'hA;
				rA = inst[`RA];
				rB = inst[`RB];
				valN = inst[`D];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`IOPQ:	begin
				//未考虑指令错误的问题，回头加上
				valP = pc + 64'h2;
				rA = inst[`RA];
				rB = inst[`RB];
			end
			`IJXX:	begin
				valP = pc + 64'h9;
				/* 此时不需要rA rB，valC是新的PC */
				valN = inst[`Dest];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`ICALL:	begin
				valP = pc + 64'h9;
				/* 此时不需要rA rB，valC是新的PC */	
				valN = inst[`Dest];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`IRET:	begin
				/* 直接返回了，不用管了 */
				valP = pc + 64'h1;
			end
			`IPUSHQ:	begin
				valP = pc + 64'h2;
				rA = inst[`RA];
				rB = inst[`RB];  //0xf
			end
			`IPOPQ:	begin
				valP = pc + 64'h2;
				rA = inst[`RA];
				rB = inst[`RB];  //0xf
			end
			`IIADDQ:	begin
				valP = pc + 64'hA;
				rA = 4'hF;
				rB = inst[`RB];
				valN = inst[`V];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			default: $stop;  //指令错误，停止运行 
		endcase	
	end
endmodule