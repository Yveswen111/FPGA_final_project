module scene_changer(
	input clk_22,
	input rst,
	input space,
	input [9:0]bosshp,
	input [1:0]life,
	output reg [1:0]scene,
	output reg gamestart
);
	reg [1:0]nt_scene;
	reg nt_gamestart;
	
	parameter open = 2'b00;
	parameter game = 2'b01;
	parameter win = 2'b10;
	parameter lose = 2'b11;
	
	wire win_sig, lose_sig;
	
	assign win_sig = (bosshp == 10'd0);
	assign lose_sig = (life == 2'd0);
	
	always@(posedge clk_22)begin
		if(rst)begin
			scene <= open;
			gamestart <= 1'b0;
		end
		else begin
			scene <= nt_scene;
			gamestart <= nt_gamestart;
		end
	end
	
	always@(*)begin
		case(scene)
			open:begin
				if(space)begin
					nt_scene = game;
					nt_gamestart = 1'b1;
				end
				else begin
					nt_scene = open;
					nt_gamestart = 1'b1;
				end
			end
			game:begin
				if(win_sig)begin
					nt_scene = win;
					nt_gamestart = 1'b0;
				end
				else if(lose_sig)begin
					nt_scene = lose;
					nt_gamestart = 1'b0;
				end
				else begin
					nt_scene = game;
					nt_gamestart = 1'b0;
				end
			end
			win:begin
				if(space)begin
					nt_scene = open;
					nt_gamestart = 1'b0;
				end
				else begin
					nt_scene = win;
					nt_gamestart = 1'b0;
				end
			end
			lose:begin
				if(space)begin
					nt_scene = open;
					nt_gamestart = 1'b0;
				end
				else begin
					nt_scene = lose;
					nt_gamestart = 1'b0;
				end
			end
			default:begin
				nt_scene = scene;
				nt_gamestart = gamestart;
			end
		endcase
	end
endmodule