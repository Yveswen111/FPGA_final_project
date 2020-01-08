//00 start
//01 game
//10 win
//11 lose

module PlayerCtrl (
	input [1:0]scene,
	input boss,
	input clk,
	input reset,
	output reg [9:0] ibeat
);
parameter BEATLEAGTH_START = 10'd768;
parameter BEATLEAGTH_GAME = 10'd352;
parameter BEATLEAGTH_BOSS = 10'd133;
parameter BEATLEAGTH_WIN = 10'd297;
parameter BEATLEAGTH_LOSE = 10'd136;
reg [9:0] nt_ibeat_start;
reg [9:0] nt_ibeat_game;
reg [9:0] nt_ibeat_boss;
reg [9:0] nt_ibeat_win;
reg [9:0] nt_ibeat_lose;
//bad apple => 768
//U.N.Owen => 352
//Gods love gensoukyou => 133
//Otenba Koi Musume => 297
//suika no tsuki => 136
always @(posedge clk, posedge reset) begin
	if (reset)
		ibeat <= 10'd0;
	else if(scene == 2'b00)
		ibeat <= nt_ibeat_start;
	else if(scene == 2'b01 && !boss)
		ibeat <= nt_ibeat_game;
	else if(scene == 2'b01 && boss)
		ibeat <= nt_ibeat_boss;
	else if(scene == 2'b10)
		ibeat <= nt_ibeat_win;
	else if(scene == 2'b11)
		ibeat <= nt_ibeat_lose;
	else
		ibeat <= 10'd0;
end

always@(*)
begin
	if(ibeat < BEATLEAGTH_START && scene == 2'b00)
	begin
		nt_ibeat_start = ibeat + 10'd1;
	end
	else
	begin
		nt_ibeat_start = 10'd0;
	end
	
	if(ibeat < BEATLEAGTH_GAME && scene == 2'b01 && !boss)
	begin
		nt_ibeat_game = ibeat + 10'd1;
	end
	else
	begin
		nt_ibeat_start = 10'd0;
	end
	
	if(ibeat < BEATLEAGTH_BOSS && scene == 2'b01 && boss)
	begin
		nt_ibeat_boss = ibeat + 10'd1;
	end
	else
	begin
		nt_ibeat_boss = 10'd0;
	end
	
	if(ibeat < BEATLEAGTH_WIN && scene == 2'b10)
	begin
		nt_ibeat_win = ibeat + 10'd1;
	end
	else
	begin
		nt_ibeat_win = 10'd0;
	end
	
	if(ibeat < BEATLEAGTH_LOSE && scene == 2'b11)
	begin
		nt_ibeat_lose = ibeat + 10'd1;
	end
	else
	begin
		nt_ibeat_lose = 10'd0;
	end
end

endmodule