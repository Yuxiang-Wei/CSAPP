`include "defines.v"
module inst_rom(
	input	wire		clk,
	input	wire		[63:0]valM,
	input	wire[`WORD]		    addr,
	input	wire			    mem_read_i,
	input	wire			    mem_write_i,
	input	wire[`WORD]		    mem_addr_i,
	input	wire[`WORD]		    mem_data_i,
	output	 wire[`WORD]		    mem_data_o,
	output	 wire[`INSTBUS]	    inst
);

	reg [7:0]	inst_mem[0:600];

	initial $readmemh ( "D:/Xilinx/Projects/seq/inst_rom.data",	inst_mem );
	//initial $stop;
	//always @ (*)begin
	//	inst	<=	inst_mem[addr[`WORDNUM-1:2]];
	//end
	assign inst = {inst_mem[addr],inst_mem[addr+1],inst_mem[addr+2],inst_mem[addr+3],inst_mem[addr+4],inst_mem[addr+5],inst_mem[addr+6],inst_mem[addr+7],inst_mem[addr+8],inst_mem[addr+9]};
	assign mem_data_o = mem_read_i ? {inst_mem[mem_addr_i+7],inst_mem[mem_addr_i+6],inst_mem[mem_addr_i+5],inst_mem[mem_addr_i+4],inst_mem[mem_addr_i+3],inst_mem[mem_addr_i+2],inst_mem[mem_addr_i+1],inst_mem[mem_addr_i]} : valM;
	
	always @(posedge clk) begin
		if( mem_write_i == `ENABLE ) begin
			{inst_mem[mem_addr_i+7],inst_mem[mem_addr_i+6],inst_mem[mem_addr_i+5],inst_mem[mem_addr_i+4],inst_mem[mem_addr_i+3],inst_mem[mem_addr_i+2],inst_mem[mem_addr_i+1],inst_mem[mem_addr_i]} =      mem_data_i;
		end
	end

endmodule