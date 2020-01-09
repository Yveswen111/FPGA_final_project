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
parameter BEATLEAGTH_START = 10'd133;
parameter BEATLEAGTH_GAME = 10'd768;
parameter BEATLEAGTH_BOSS = 10'd352;
parameter BEATLEAGTH_WIN = 10'd297;
parameter BEATLEAGTH_LOSE = 10'd136;
//bad apple => 768
//U.N.Owen => 352
//Gods love gensoukyou => 133
//Otenba Koi Musume => 297
//suika no tsuki => 136
always @(posedge clk, posedge reset) begin
	if (reset)
		ibeat <= 10'd0;
	else if(scene == 2'b00)
	begin
		if(ibeat < BEATLEAGTH_START)
		begin
			ibeat <= ibeat + 10'd1;
		end
		else
		begin
			ibeat <= 10'd0;
		end
	end
	else if(scene == 2'b01)
	begin
		if(!boss)
		begin
			if(ibeat < BEATLEAGTH_GAME)
			begin
				ibeat <= ibeat + 10'd1;
			end
			else
			begin
				ibeat <= 10'd0;
			end
		end
		else
		begin
			if(ibeat < BEATLEAGTH_BOSS)
			begin
				ibeat <= ibeat + 10'd1;
			end
			else
			begin
				ibeat <= 10'd0;
			end
		end
	end
	else if(scene == 2'b10)
	begin
		if(ibeat < BEATLEAGTH_WIN)
		begin
			ibeat = ibeat + 10'd1;
		end
		else
		begin
			ibeat = 10'd0;
		end
	end
	else if(scene == 2'b11)
	begin
		if(ibeat < BEATLEAGTH_LOSE)
		begin
			ibeat = ibeat + 10'd1;
		end
		else
		begin
			ibeat = 10'd0;
		end
	end
	else
		ibeat <= 10'd0;
    end
endmodule
