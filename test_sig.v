module test_sig(
	output wire [3:0] LED,
	inout wire PS2_DATA,
	inout wire PS2_CLK,
	input wire rst,
	input wire clk
	);
	
	wire been_ready;
	wire [8:0] last_change;
	wire [511:0] key_down;
	
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	decoder_sig de_si(
		.rst(rst),
		.clk(clk),
		.been_ready(been_ready),
		.key_down(key_down),
		.last_change(last_change),
		.nums(LED)
	);
	
endmodule
