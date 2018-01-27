`timescale  1 ps / 1 ps
`include "defines.v"
module	Decode(
				input wire clk,
				input wire rst,
				input wire [3:0]icode,
				input wire [3:0]ifun,
				input wire [3:0]rA,
				input wire [3:0]rB,
				output reg [3:0]srcA,
				output reg [3:0]srcB
				);
				
    always @(*)	begin

   		case(icode)
			`INOP:	begin
    			srcA	<= `RNONE;
    			srcB	<= `RNONE;
    		end
    		`IHALT:		begin
    			srcA	<= `RNONE;
    			srcB	<= `RNONE;
    		end 
    		`IRRMOVQ:	begin  // Ò²ÊÇCMOV
    			srcA	<=  rA;
    			srcB	<= `RNONE;
    		end
    		`IIRMOVQ:	begin
    			srcA	<= `RNONE;
    			srcB	<= `RNONE;
    		end
    		`IRMMOVQ:   begin
    			srcA	<=  rA;
    			srcB <=  rB;
    		end
    		`IMRMOVQ:   begin
				srcA	<= `RNONE;
    			srcB <=  rB;
			end
    		`IOPQ:      begin
   				srcA	<=  rA;
   				srcB <=  rB;
   			end
			`IJXX:		begin
    	 		srcA	<= `RNONE;
    	 		srcB	<= `RNONE;
			end
			`ICALL:	begin
    	 		srcA	<= `RNONE;
    	 		srcB <=  `RRSP;
			end
			`IRET:		begin
    	 		srcA	<=  `RRSP;
    	 		srcB <=  `RRSP;
			end
			`IPUSHQ:	begin
    	 		srcA	<=  rA;
   		 		srcB <=  `RRSP;
			end
			`IPOPQ:	begin
    	 		srcA	<=  `RRSP;
   		 		srcB <=  `RRSP;
			end
			`IIADDQ: begin
    	 		srcA	<= `RNONE;
   		 		srcB <=  rB;
			end
		endcase
    	
    end
	
endmodule