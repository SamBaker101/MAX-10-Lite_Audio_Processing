module audio_top (
	input SYS_CLK,
	input GPIO3, 
	input [9:0] SW,
	
	output GPIO1, GPIO2, GPIO4, GPIO0, GPIO5, GPIO6, GPIO7,
	output [9:0] LEDR
	);

	
wire MCLK, LRCK, SCLK, data_CLK, locked;
wire test_clk;
wire [31:0] data_L_in, data_R_in, data_L_out, data_R_out;

reg reset = 1'b0;



//CLOCKS
assign GPIO0 = MCLK;																						
assign GPIO1 = LRCK;																						
assign GPIO2 = SCLK;																						

PLL PL0 (reset, SYS_CLK, MCLK, locked);															//Master Clock
clock_div #(8) clk0 (MCLK, reset, SCLK);															//Data Clock
clock_div #(32) clk1 (SCLK, reset, data_CLK);													//LR Select Clock
clock_div #(64) clk2 (SCLK, reset, LRCK);															//Serial Clock
clock_div #(6400000) clk3 (MCLK, reset, test_clk);												//Test_clock



// A/D & D/A data
wire [31:0] data_L, data_R;

i2s_decode #(32) dec (.SCLK(SCLK), .LRCK(LRCK), .data_in(GPIO3), .data_out_L(data_L_in), .data_out_R(data_R_in));
i2s_encode #(32) enc (.SCLK(SCLK), .LRCK(LRCK), .data_in_L(data_L_out), .data_in_R(data_R_out), .data_out(GPIO4));


	
//Filters and Effects
clipping #(32) clipL (.clk(data_CLK), .enable(SW[0]), .data_in(data_L_in), .data_out(data_L_out));
clipping #(32) clipR (.clk(data_CLK), .enable(SW[0]), .data_in(data_R_in), .data_out(data_R_out));



//TESTS
//assign LEDR[0] = test_clk;
//assign LEDR[1] = locked;
//assign GPIO4 = GPIO3;                                                             //direct bypass test
assign LEDR[9:0] = data_L_in[31:22];                                                  //data_test
//bypass #(32) bp1 (.data_in(data_L_in), .data_out(data_L_out));
//bypass #(32) bp2 (.data_in(data_R_in), .data_out(data_R_out));





endmodule

