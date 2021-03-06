// Quartus II Verilog Template
// Single port RAM with single read/write address
`include "Const.vh"

module VertMat
#(parameter DATA_WIDTH=`VERT_WIDTH, parameter ADDR_WIDTH=`PRED_WIDTH)
(
	input [DATA_WIDTH:0] data_a, data_b,
	input [ADDR_WIDTH:0] addr_a, addr_b,
	input we_a, we_b, clk,
	output reg [DATA_WIDTH:0] q_a, q_b,
	output [31:0] test
);

	// Declare the RAM variable
	reg [DATA_WIDTH:0] ram[2**ADDR_WIDTH-1:0];
	assign test = ram[2][`VERT_WIDTH - 1: `WEIGHT_WIDTH + 1];
	// Port A
	always @ (posedge clk)
	begin
		if (we_a)
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else
		begin
			q_a <= ram[addr_a];
		end
	end

	// Port B
	always @ (posedge clk)
	begin
		if (we_b)
		begin
			ram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else
		begin
			q_b <= ram[addr_b];
		end
	end

endmodule
