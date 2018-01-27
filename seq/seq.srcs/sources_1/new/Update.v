`timescale 1ns / 1ps
`include "defines.v"

module Update(
		input wire clk,
    	input wire rst,
		input wire [3:0]icode,
		input wire Cnd,
		input wire [`WORD]valP,
		input wire [`WORD]valM,
		input wire [`WORD]valC,
		output reg [`WORD]pc
    );
    
    always @(posedge clk)	begin
    	case(icode)
			`ICALL: pc = valC;
			`IJXX:	pc = Cnd == 1 ? valC : valP;
			`IRET:	pc = valM;
			default:	begin
					if(valP > 0) 
						pc = valP;
					else	
						pc = 0;  //����Ҫ��ʼ��һ�£�pcһ��ʼ�Ǹ���״̬
			end
    	endcase
    end
   	
endmodule
