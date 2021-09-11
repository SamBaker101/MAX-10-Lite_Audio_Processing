module i2s_encode
	#(parameter RESOLUTION = 24)
(
	input SCLK, LRCK, 
	input [RESOLUTION-1:0] data_in_L, data_in_R,
	output reg data_out
);

reg [31:0] count;
reg LR;

always @(negedge SCLK)
	begin
		
	count <= count + 1;

	if (LR != LRCK)
		begin
		count <= 32'd0;
		LR <= LRCK;
		end
	
	if (count < RESOLUTION) begin
		if (LRCK == 0)
			data_out <= data_in_L[count];
		else
			data_out <= data_in_R[count];
		end
	
	end
endmodule
