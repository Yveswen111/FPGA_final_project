//00 start
//01 game
//10 win
//11 lose

module Mux (
	input [1:0]scene,
	input boss,
	input clk,
	input rst,
	input [31:0] freq_start,
	input [31:0] freq_game,
	input [31:0] freq_boss,
	input [31:0] freq_win,
	input [31:0] freq_lose,
	output reg [31:0] freq
);

	always@(posedge clk)
	begin
		if (posedge clk, posedge reset)
			freq <= 32'd0;
		else if(scene == 2'b00)
			freq <= freq_start;
		else if(scene == 2'b01 && !boss)
			freq <= freq_game;
		else if(scene == 2'b01 && boss)
			freq <= freq_boss;
		else if(scene == 2'b10)
			freq <= freq_win;
		else if(scene == 2'b11)
			freq <= freq_lose;
		else
			freq <= 10'd0;
	end
endmodule
