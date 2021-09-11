module clipping
	#(parameter RESOLUTION = 24)
	(
	input clk, enable,
	input [RESOLUTION - 1:0]data_in,
	output[RESOLUTION - 1:0]data_out

);

assign data_out = enable ? data_in<<1 : data_in;

endmodule
