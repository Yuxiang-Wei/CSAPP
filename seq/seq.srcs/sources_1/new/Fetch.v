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
			
			reg [`WORD] valN;  //����תΪС��

	always @(*)	begin
		//ȡ��icode,ifun
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
			`IRRMOVQ:	begin  // Ҳ��CMOV
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
				// С����תΪ����
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
				//δ����ָ���������⣬��ͷ����
				valP = pc + 64'h2;
				rA = inst[`RA];
				rB = inst[`RB];
			end
			`IJXX:	begin
				valP = pc + 64'h9;
				/* ��ʱ����ҪrA rB��valC���µ�PC */
				valN = inst[`Dest];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`ICALL:	begin
				valP = pc + 64'h9;
				/* ��ʱ����ҪrA rB��valC���µ�PC */	
				valN = inst[`Dest];
				valC = {valN[7:0], valN[15:8], valN[23:16], valN [31:24], valN [39:32], valN [47:40], valN[55:48], valN[63:56]};
			end
			`IRET:	begin
				/* ֱ�ӷ����ˣ����ù��� */
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
			default: $stop;  //ָ�����ֹͣ���� 
		endcase	
	end
endmodule