module boss_bullet(
	input rst,
	input clk22,
	input [9:0]reimux,
	input [9:0]reimuy,
	input [9:0]bossx,
	input [9:0]bossy,
	input boss,
	output shot,
	output reg flandore_bigbullet,//output signal, bullet exist = 1
	output reg flandore_bullet1,
	output reg flandore_bullet2,
	output reg flandore_bullet3,
	output reg flandore_bullet4,
	output reg flandore_bullet5,
	output reg [9:0]flandore_bigbulletx,//boss big bullet
	output reg [9:0]flandore_bigbullety,
	output reg [9:0]flandore_bulletx1,//normal bullet like this => ／/|\＼
	output reg [9:0]flandore_bullety1,
	output reg [9:0]flandore_bulletx2,
	output reg [9:0]flandore_bullety2,
	output reg [9:0]flandore_bulletx3,
	output reg [9:0]flandore_bullety3,
	output reg [9:0]flandore_bulletx4,
	output reg [9:0]flandore_bullety4,
	output reg [9:0]flandore_bulletx5,
	output reg [9:0]flandore_bullety5
	);
	
	reg nt_flandore_bigbullet, nt_flandore_bullet1, nt_flandore_bullet2, nt_flandore_bullet3, nt_flandore_bullet4, nt_flandore_bullet5;
	
	reg [9:0]nt_flandore_bigbulletx;
	reg [9:0]nt_flandore_bigbullety;
	reg [9:0]nt_flandore_bulletx1;
	reg [9:0]nt_flandore_bullety1;
	reg [9:0]nt_flandore_bulletx2;
	reg [9:0]nt_flandore_bullety2;
	reg [9:0]nt_flandore_bulletx3;
	reg [9:0]nt_flandore_bullety3;
	reg [9:0]nt_flandore_bulletx4;
	reg [9:0]nt_flandore_bullety4;
	reg [9:0]nt_flandore_bulletx5;
	reg [9:0]nt_flandore_bullety5;
	
	reg shot1, shot2, shot3, shot4, shot5, shot6;
	assign shot = shot1 | shot2 | shot3 | shot4 | shot5 | shot6;
	
	reg nt_shot1, nt_shot2, nt_shot3, nt_shot4, nt_shot5, nt_shot6;
	
	reg reverse1, reverse2, reverse3, reverse4, reverse5;
	reg nt_reverse1, nt_reverse2, nt_reverse3, nt_reverse4, nt_reverse5;
	
	always@(posedge clk22)
	begin
		if(rst || !boss)
		begin
			shot1 <= 1'b0;
			shot2 <= 1'b0;
			shot3 <= 1'b0;
			shot4 <= 1'b0;
			shot5 <= 1'b0;
			shot6 <= 1'b0;
			flandore_bigbullet <= 1'b0;
			flandore_bullet1 <= 1'b0;
			flandore_bullet2 <= 1'b0;
			flandore_bullet3 <= 1'b0;
			flandore_bullet4 <= 1'b0;
			flandore_bullet5 <= 1'b0;
			flandore_bigbulletx <= bossx;
			flandore_bigbullety <= bossy;
			flandore_bulletx1 <= bossx;
			flandore_bullety1 <= bossy;
			flandore_bulletx2 <= bossx;
			flandore_bullety2 <= bossy;
			flandore_bulletx3 <= bossx;
			flandore_bullety3 <= bossy;
			flandore_bulletx4 <= bossx;
			flandore_bullety4 <= bossy;
			flandore_bulletx5 <= bossx;
			flandore_bullety5 <= bossy;
			reverse1 <= 1'b0;
			reverse2 <= 1'b0;
			reverse3 <= 1'b0;
			reverse4 <= 1'b0;
			reverse5 <= 1'b0;
		end
		else
		begin
			shot1 <= nt_shot1;
			shot2 <= nt_shot2;
			shot3 <= nt_shot3;
			shot4 <= nt_shot4;
			shot5 <= nt_shot5;
			shot6 <= nt_shot6;
			flandore_bigbullet <= nt_flandore_bigbullet;
			flandore_bullet1 <= nt_flandore_bullet1;
			flandore_bullet2 <= nt_flandore_bullet2;
			flandore_bullet3 <= nt_flandore_bullet3;
			flandore_bullet4 <= nt_flandore_bullet4;
			flandore_bullet5 <= nt_flandore_bullet5;
			flandore_bigbulletx <= nt_flandore_bigbulletx;
			flandore_bigbullety <= nt_flandore_bigbullety;
			flandore_bulletx1 <= nt_flandore_bulletx1;
			flandore_bullety1 <= nt_flandore_bullety1;
			flandore_bulletx2 <= nt_flandore_bulletx2;
			flandore_bullety2 <= nt_flandore_bullety2;
			flandore_bulletx3 <= nt_flandore_bulletx3;
			flandore_bullety3 <= nt_flandore_bullety3;
			flandore_bulletx4 <= nt_flandore_bulletx4;
			flandore_bullety4 <= nt_flandore_bullety4;
			flandore_bulletx5 <= nt_flandore_bulletx5;
			flandore_bullety5 <= nt_flandore_bullety5;
			reverse1 <= nt_reverse1;
			reverse2 <= nt_reverse2;
			reverse3 <= nt_reverse3;
			reverse4 <= nt_reverse4;
			reverse5 <= nt_reverse5;
		end
	end

	always@(*)
	begin
		if(flandore_bulletx1 < 10'd30)
		begin
			nt_reverse1 = 1'b1;
		end
		else if(flandore_bulletx1 > 10'd410)
		begin
			nt_reverse1 = 1'b0;
		end
		else
		begin
			nt_reverse1 = reverse1;
		end
		if(flandore_bulletx2 < 10'd30)
		begin
			nt_reverse2 = 1'b1;
		end
		else if(flandore_bulletx2 > 10'd410)
		begin
			nt_reverse2 = 1'b0;
		end
		else
		begin
			nt_reverse2 = reverse2;
		end
		if(flandore_bulletx4 > 10'd410)
		begin
			nt_reverse4 = 1'b1;
		end
		else if(flandore_bulletx4 < 10'd30)
		begin
			nt_reverse4 = 1'b0;
		end
		else
		begin
			nt_reverse4 = reverse4;
		end
		
		if(flandore_bulletx5 > 10'd410)
		begin
			nt_reverse5 = 1'b1;
		end
		else if(flandore_bulletx5 < 10'd30)
		begin
			nt_reverse5 = 1'b0;
		end
		else
		begin
			nt_reverse5 = reverse5;
		end
	end
	
	always@(*)//boss
	begin
		if(!boss)
		begin
			nt_flandore_bullet1 = 1'b0;
			nt_flandore_bullet2 = 1'b0;
			nt_flandore_bullet3 = 1'b0;
			nt_flandore_bullet4 = 1'b0;
			nt_flandore_bullet5 = 1'b0;
			nt_flandore_bigbulletx = 10'd0;
			nt_flandore_bigbullety = 10'd0;
			nt_flandore_bulletx1 = 10'd0;
			nt_flandore_bullety1 = 10'd0;
			nt_flandore_bulletx2 = 10'd0;
			nt_flandore_bullety2 = 10'd0;
			nt_flandore_bullety2 = 10'd0;
			nt_flandore_bulletx3 = 10'd0;
			nt_flandore_bullety3 = 10'd0;
			nt_flandore_bulletx4 = 10'd0;
			nt_flandore_bullety4 = 10'd0;
			nt_flandore_bulletx5 = 10'd0;
			nt_flandore_bullety5 = 10'd0;
		end
		else
		begin
			if(flandore_bulletx1 > (reimux - 10'd10) && flandore_bulletx1 < (reimux + 10'd12) && flandore_bullety1 > (reimuy - 10'd11) && flandore_bullety1 < (reimuy + 10'd11))// => 嚗?
			begin
				nt_shot1 = 1'b1;
				nt_flandore_bullet1 = 1'b0;
				nt_flandore_bulletx1 = bossx;
				nt_flandore_bullety1 = bossy;
			end
			else
			begin
				if(flandore_bullety1 > 10'd472 || flandore_bullety1 < 10'd8)
				begin
					nt_shot1 = 1'b0;
					nt_flandore_bullet1 = 1'b0;
					nt_flandore_bulletx1 = bossx;
					nt_flandore_bullety1 = bossy;
				end
				else
				begin
					nt_shot1 = 1'b0;
					nt_flandore_bullet1 = 1'b1;
					nt_flandore_bullety1 = flandore_bullety1 + 10'd4;
					if(!reverse1)
					begin
						nt_flandore_bulletx1 = flandore_bulletx1 - 10'd8;
					end
					else
					begin
						nt_flandore_bulletx1 = flandore_bulletx1 + 10'd8;
					end
				end
			end
			
			if(flandore_bulletx2 > (reimux - 10'd10) && flandore_bulletx2 < (reimux + 10'd12) && flandore_bullety2 > (reimuy - 10'd11) && flandore_bullety2 < (reimuy + 10'd11))// => /
			begin
				nt_shot2 = 1'b1;
				nt_flandore_bullet2 = 1'b0;
				nt_flandore_bulletx2 = bossx;
				nt_flandore_bullety2 = bossy;
			end
			else
			begin
				if(flandore_bullety2 > 10'd472 || flandore_bullety2 < 10'd8)
				begin
					nt_shot2 = 1'b0;
					nt_flandore_bullet2 = 1'b0;
					nt_flandore_bulletx2 = bossx;
					nt_flandore_bullety2 = bossy;
				end
				else
				begin
					nt_shot2 = 1'b0;
					nt_flandore_bullet2 = 1'b1;
					nt_flandore_bullety2 = flandore_bullety2 + 10'd3;
					if(!reverse2)
					begin
						nt_flandore_bulletx2 = flandore_bulletx2 - 10'd9;
					end
					else
					begin
						nt_flandore_bulletx2 = flandore_bulletx2 + 10'd9;
					end
				end
			end
				
			if(flandore_bulletx3 > (reimux - 10'd10) && flandore_bulletx3 < (reimux + 10'd12) && flandore_bullety3 > (reimuy - 10'd11) && flandore_bullety3 < (reimuy + 10'd11))// => |
			begin
				nt_shot3 = 1'b1;
				nt_flandore_bullet3 = 1'b0;
				nt_flandore_bulletx3 = bossx;
				nt_flandore_bullety3 = bossy;
				nt_reverse3 = 1'b0;
			end
			else
			begin
				if(flandore_bullety3 > 10'd450)
				begin
					nt_reverse3 = 1'b1;
				end
				else
				begin
					if(flandore_bulletx3 > 10'd432 || flandore_bulletx3 < 10'd8 || flandore_bullety3 < 10'd15)
					begin
						nt_shot3 = 1'b0;
						nt_flandore_bullet3 = 1'b0;
						nt_flandore_bulletx3 = bossx;
						nt_flandore_bullety3 = bossy;
						nt_reverse3 = 1'b0;
					end
					else
					begin
						nt_shot3 = 1'b0;
						nt_flandore_bullet3 = 1'b1;
						nt_flandore_bulletx3 = flandore_bulletx3;
						if(!reverse3)
						begin
							nt_flandore_bullety3 = flandore_bullety3 + 10'd10;
						end
						else
						begin
							nt_flandore_bullety3 = flandore_bullety3 - 10'd10;
						end
					end
				end
			end
				
			if(flandore_bulletx4 > (reimux - 10'd10) && flandore_bulletx4 < (reimux + 10'd12) && flandore_bullety4 > (reimuy - 10'd11) && flandore_bullety4 < (reimuy + 10'd11))// => \
			begin
				nt_shot4 = 1'b1;
				nt_flandore_bullet4 = 1'b0;
				nt_flandore_bulletx4 = bossx;
				nt_flandore_bullety4 = bossy;
			end
			else
			begin
				if(flandore_bullety4 > 10'd472 || flandore_bullety4 < 10'd8)
				begin
					nt_shot4 = 1'b0;
					nt_flandore_bullet4 = 1'b0;
					nt_flandore_bulletx4 = bossx;
					nt_flandore_bullety4 = bossy;
				end
				else
				begin
					nt_shot4 = 1'b0;
					nt_flandore_bullet4 = 1'b1;
					nt_flandore_bullety4 = flandore_bullety4 + 10'd3;
					if(!reverse4)
					begin
						nt_flandore_bulletx4 = flandore_bulletx4 + 10'd9;
					end
					else
					begin
						nt_flandore_bulletx4 = flandore_bulletx4 - 10'd9;
					end
				end
			end
				
			if(flandore_bulletx5 > (reimux - 10'd10) && flandore_bulletx5 < (reimux + 10'd12) && flandore_bullety5 > (reimuy - 10'd11) && flandore_bullety5 < (reimuy + 10'd11))// => 嚗?
			begin
				nt_shot5 = 1'b1;
				nt_flandore_bullet5 = 1'b0;
				nt_flandore_bulletx5 = bossx;
				nt_flandore_bullety5 = bossy;
			end
			else
			begin
				if(flandore_bullety5 > 10'd472 || flandore_bullety5 < 10'd8)
				begin
					nt_shot5 = 1'b0;
					nt_flandore_bullet5 = 1'b0;
					nt_flandore_bulletx5 = bossx;
					nt_flandore_bullety5 = bossy;
				end
				else
				begin
					nt_shot5 = 1'b0;
					nt_flandore_bullet5 = 1'b1;
					nt_flandore_bullety5 = flandore_bullety5 + 10'd4;
					if(!reverse5)
					begin
						nt_flandore_bulletx5 = flandore_bulletx5 + 10'd8;
					end
					else
					begin
						nt_flandore_bulletx5 = flandore_bulletx5 - 10'd8;
					end
				end
			end
			
			if(flandore_bigbulletx > (reimux - 10'd34) && flandore_bigbulletx < (reimux + 10'd36) && flandore_bigbullety > (reimuy - 10'd35) && flandore_bigbullety < (reimuy + 10'd35))
			begin
				nt_shot6 = 1'b1;
				nt_flandore_bigbullet = 1'b0;
				nt_flandore_bigbulletx = bossx;
				nt_flandore_bigbullety = bossy + 10'd30;
			end
			else
			begin
				if(flandore_bigbulletx > 10'd408 || flandore_bigbulletx < 10'd32 || flandore_bigbullety > 10'd448 || flandore_bigbullety < 10'd32)
				begin
					nt_shot6 = 1'b0;
					nt_flandore_bigbullet = 1'b0;
					nt_flandore_bigbulletx = bossx;
					nt_flandore_bigbullety = bossy + 10'd30;
				end
				else
				begin
					nt_shot6 = 1'b0;
					nt_flandore_bigbullet = 1'b1;
					nt_flandore_bigbullety = flandore_bigbullety + 10'd12;
					if(bossx > reimux)
					begin
						nt_flandore_bigbulletx = flandore_bigbulletx + (bossx - reimux) / 10;
					end
					else
					begin
						nt_flandore_bigbulletx = flandore_bigbulletx + (reimux - bossx) / 10;
					end
				end
			end
		end
	end
endmodule
