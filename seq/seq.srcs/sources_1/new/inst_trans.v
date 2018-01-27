`timescale  1 ps / 1 ps
`include "defines.v"

module inst_trans(
				input wire clk,
				input wire rst,
				input wire [`INSTBUS]inst,
				output reg [`INSTBUS]rom_data_o
				);

	always @(*) begin
	rom_data_o = inst;
	end
endmodule