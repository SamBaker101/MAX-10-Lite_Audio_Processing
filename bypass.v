module bypass
	#(parameter RESOLUTION = 24)
	(
	input [RESOLUTION - 1:0]data_in,
	output [RESOLUTION - 1:0]data_out

);

assign data_out = data_in;

endmodule
