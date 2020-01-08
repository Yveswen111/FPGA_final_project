module enm_bullet(
	input rst,
	input clk22,
	input [9:0]reimux,
	input [9:0]reimuy,
	input [9:0]enmx1,
	input [9:0]enmy1,
	input [9:0]enmx2,
	input [9:0]enmy2,
	input [9:0]enmx3,
	input [9:0]enmy3,
	input [9:0]enmx4,
	input [9:0]enmy4,
	input enm1,
	input enm2,
	input enm3,
	input enm4,
	output shot, //get hurt
	output reg bullet1,//output signal ,bullet exist = 1
	output reg bullet2,
	output reg bullet3,
	output reg bullet4,
	output reg bullet5,
	output reg bullet6,
	output reg bullet7,
	output reg bullet8,
	output reg bullet9,
	output reg bullet10,
	output reg bullet11,
	output reg bullet12,
	output reg [9:0]bulletx1,//enemy1 => ｜
	output reg [9:0]bullety1,
	output reg [9:0]bulletx2,//enemy2 => ｜
	output reg [9:0]bullety2,
	output reg [9:0]bulletx3,//enemy3 => ｜
	output reg [9:0]bullety3,
	output reg [9:0]bulletx4,//enemy4 => ｜
	output reg [9:0]bullety4,
	output reg [9:0]bulletx5,//enemy1 => ／
	output reg [9:0]bullety5,
	output reg [9:0]bulletx6,//enemy2 => ／
	output reg [9:0]bullety6,
	output reg [9:0]bulletx7,//enemy3 => ／
	output reg [9:0]bullety7,
	output reg [9:0]bulletx8,//enemy4 => ／
	output reg [9:0]bullety8,
	output reg [9:0]bulletx9,//enemy1 => ＼
	output reg [9:0]bullety9,
	output reg [9:0]bulletx10,//enemy2 => ＼
	output reg [9:0]bullety10,
	output reg [9:0]bulletx11,//enemy3 => ＼
	output reg [9:0]bullety11,
	output reg [9:0]bulletx12,//enemy4 => ＼
	output reg [9:0]bullety12
	);
	
	reg nt_bullet1, nt_bullet2, nt_bullet3, nt_bullet4, nt_bullet5, nt_bullet6, nt_bullet7, nt_bullet8, nt_bullet9, nt_bullet10, nt_bullet11, nt_bullet12;

	reg [9:0]nt_bulletx1;
	reg [9:0]nt_bullety1;
	reg [9:0]nt_bulletx2;
	reg [9:0]nt_bullety2;
	reg [9:0]nt_bulletx3;
	reg [9:0]nt_bullety3;
	reg [9:0]nt_bulletx4;
	reg [9:0]nt_bullety4;
	reg [9:0]nt_bulletx5;
	reg [9:0]nt_bullety5;
	reg [9:0]nt_bulletx6;
	reg [9:0]nt_bullety6;
	reg [9:0]nt_bulletx7;
	reg [9:0]nt_bullety7;
	reg [9:0]nt_bulletx8;
	reg [9:0]nt_bullety8;
	reg [9:0]nt_bulletx9;
	reg [9:0]nt_bullety9;
	reg [9:0]nt_bulletx10;
	reg [9:0]nt_bullety10;
	reg [9:0]nt_bulletx11;
	reg [9:0]nt_bullety11;
	reg [9:0]nt_bulletx12;
	reg [9:0]nt_bullety12;

	reg shot1, shot2, shot3, shot4, shot5, shot6, shot7, shot8, shot9, shot10, shot11, shot12;
	assign shot = shot1 | shot2 | shot3 | shot4 | shot5 | shot6 | shot7 | shot8 | shot9 | shot10 | shot11 | shot12;
	
	reg nt_shot1, nt_shot2, nt_shot3, nt_shot4, nt_shot5, nt_shot6, nt_shot7, nt_shot8, nt_shot9, nt_shot10, nt_shot11, nt_shot12;

	always@(posedge clk22)
	begin
		if(rst)
		begin
			shot1 <= 1'b0;
			shot2 <= 1'b0;
			shot3 <= 1'b0;
			shot4 <= 1'b0;
			shot5 <= 1'b0;
			shot6 <= 1'b0;
			shot7 <= 1'b0;
			shot8 <= 1'b0;
			shot9 <= 1'b0;
			shot10 <= 1'b0;
			shot11 <= 1'b0;
			shot12 <= 1'b0;
			bullet1 <= 1'b0;
			bullet2 <= 1'b0;
			bullet3 <= 1'b0;
			bullet4 <= 1'b0;
			bullet5 <= 1'b0;
			bullet6 <= 1'b0;
			bullet7 <= 1'b0;
			bullet8 <= 1'b0;
			bullet9 <= 1'b0;
			bullet10 <= 1'b0;
			bullet11 <= 1'b0;
			bullet12 <= 1'b0;
			bulletx1 <= enmx1;
			bullety1 <= enmy1;
			bulletx2 <= enmx2;
			bullety2 <= enmy2;
			bulletx3 <= enmx3;
			bullety3 <= enmy3;
			bulletx4 <= enmx4;
			bullety4 <= enmy4;
			bulletx5 <= enmx1;
			bullety5 <= enmy1;
			bulletx6 <= enmx2;
			bullety6 <= enmy2;
			bulletx7 <= enmx3;
			bullety7 <= enmy3;
			bulletx8 <= enmx4;
			bullety8 <= enmy4;
			bulletx9 <= enmx1;
			bullety9 <= enmy1;
			bulletx10 <= enmx2;
			bullety10 <= enmy2;
			bulletx11 <= enmx3;
			bullety11 <= enmy3;
			bulletx12 <= enmx4;
			bullety12 <= enmy4;
		end
		else
		begin
			shot1 <= nt_shot1;
			shot2 <= nt_shot2;
			shot3 <= nt_shot3;
			shot4 <= nt_shot4;
			shot5 <= nt_shot5;
			shot6 <= nt_shot6;
			shot7 <= nt_shot7;
			shot8 <= nt_shot8;
			shot9 <= nt_shot9;
			shot10 <= nt_shot10;
			shot11 <= nt_shot11;
			shot12 <= nt_shot12;
			bullet1 <= nt_bullet1;
			bullet2 <= nt_bullet2;
			bullet3 <= nt_bullet3;
			bullet4 <= nt_bullet4;
			bullet5 <= nt_bullet5;
			bullet6 <= nt_bullet6;
			bullet7 <= nt_bullet7;
			bullet8 <= nt_bullet8;
			bullet9 <= nt_bullet9;
			bullet10 <= nt_bullet10;
			bullet11 <= nt_bullet11;
			bullet12 <= nt_bullet12;
			bulletx1 <= nt_bulletx1;
			bullety1 <= nt_bullety1;
			bulletx2 <= nt_bulletx2;
			bullety2 <= nt_bullety2;
			bulletx3 <= nt_bulletx3;
			bullety3 <= nt_bullety3;
			bulletx4 <= nt_bulletx4;
			bullety4 <= nt_bullety4;
			bulletx5 <= nt_bulletx5;
			bullety5 <= nt_bullety5;
			bulletx6 <= nt_bulletx6;
			bullety6 <= nt_bullety6;
			bulletx7 <= nt_bulletx7;
			bullety7 <= nt_bullety7;
			bulletx8 <= nt_bulletx8;
			bullety8 <= nt_bullety8;
			bulletx9 <= nt_bulletx9;
			bullety9 <= nt_bullety9;
			bulletx10 <= nt_bulletx10;
			bullety10 <= nt_bullety10;
			bulletx11 <= nt_bulletx11;
			bullety11 <= nt_bullety11;
			bulletx12 <= nt_bulletx12;
			bullety12 <= nt_bullety12;
		end
	end

	always@(*)//enm1
	begin
		if(!enm1)
		begin
			nt_shot1 = 1'b0;
			nt_bullet1 = 1'b0;
			nt_bulletx1 = 10'd0;
			nt_bullety1 = 10'd0;
			nt_shot5 = 1'b0;
			nt_bullet5 = 1'b0;
			nt_bulletx5 = 10'd0;
			nt_bullety5 = 10'd0;
			nt_shot9 = 1'b0;
			nt_bullet9 = 1'b0;
			nt_bulletx9 = 10'd0;
			nt_bullety9 = 10'd0;
		end
		else
		begin
			if(bulletx1 > (reimux - 10'd10) && bulletx1 < (reimux + 10'd12) && bullety1 > (reimuy - 10'd11) && bullety1 < (reimuy + 10'd11))// =>｜
			begin
				nt_shot1 = 1'b1;
				nt_bullet1 = 1'b0;
				nt_bulletx1 = enmx1;
				nt_bullety1 = enmy1;
			end
			else
			begin
				if(bulletx1 > 10'd432 || bulletx1 < 10'd8 || bullety1 > 10'd472 || bullety1 < 10'd8)
				begin
					nt_shot1 = 1'b0;
					nt_bullet1 = 1'b0;
					nt_bulletx1 = enmx1;
					nt_bullety1 = enmy1;
				end
				else
				begin
					nt_shot1 = 1'b0;
					nt_bullet1 = 1'b1;
					nt_bulletx1 = bulletx1;
					nt_bullety1 = bullety1 + 10'd10;
				end
			end
			
			if(bulletx5 > (reimux - 10'd10) && bulletx5 < (reimux + 10'd12) && bullety5 > (reimuy - 10'd11) && bullety5 < (reimuy + 10'd11))// =>　／
			begin
				nt_shot5 = 1'b1;
				nt_bullet5 = 1'b0;
				nt_bulletx5 = enmx1;
				nt_bullety5 = enmy1;
			end
			else
			begin
				if(bulletx5 > 10'd432 || bulletx5 < 10'd8 || bullety5 > 10'd472 || bullety5 < 10'd8)
				begin
					nt_shot5 = 1'b0;
					nt_bullet5 = 1'b0;
					nt_bulletx5 = enmx1;
					nt_bullety5 = enmy1;
				end
				else
				begin
					nt_shot5 = 1'b0;
					nt_bullet5 = 1'b1;
					nt_bulletx5 = bulletx5 - 10'd7;
					nt_bullety5 = bullety5 + 10'd7;
				end
			end
			
			if(bulletx9 > (reimux - 10'd10) && bulletx9 < (reimux + 10'd12) && bullety9 > (reimuy - 10'd11) && bullety9 < (reimuy + 10'd11))// =>　＼
			begin
				nt_shot9 = 1'b1;
				nt_bullet9 = 1'b0;
				nt_bulletx9 = enmx1;
				nt_bullety9 = enmy1;
			end
			else
			begin
				if(bulletx9 > 10'd432 || bulletx9 < 10'd8 || bullety9 > 10'd472 || bullety9 < 10'd8)
				begin
					nt_shot9 = 1'b0;
					nt_bullet9 = 1'b0;
					nt_bulletx9 = enmx1;
					nt_bullety9 = enmy1;
				end
				else
				begin
					nt_shot9 = 1'b0;
					nt_bullet9 = 1'b1;
					nt_bulletx9 = bulletx9 + 10'd7;
					nt_bullety9 = bullety9 + 10'd7;
				end
			end
		end
	end
	
	always@(*)//enm2
	begin
		if(!enm2)
		begin
			nt_shot2 = 1'b0;
			nt_bullet2 = 1'b0;
			nt_bulletx2 = 10'd0;
			nt_bullety2 = 10'd0;
			nt_shot6 = 1'b0;
			nt_bullet6 = 1'b0;
			nt_bulletx6 = 10'd0;
			nt_bullety6 = 10'd0;
			nt_shot10 = 1'b0;
			nt_bullet10 = 1'b0;
			nt_bulletx10 = 10'd0;
			nt_bullety10 = 10'd0;
		end
		else
		begin
		
			if(bulletx2 > (reimux - 10'd10) && bulletx2 < (reimux + 10'd12) && bullety2 > (reimuy - 10'd11) && bullety2 < (reimuy + 10'd11))// =>｜
			begin
				nt_shot2 = 1'b1;
				nt_bullet2 = 1'b0;
				nt_bulletx2 = enmx2;
				nt_bullety2 = enmy2;
			end
			else
			begin
				if(bulletx2 > 10'd432 || bulletx2 < 10'd8 || bullety2 > 10'd472 || bullety2 < 10'd8)
				begin
					nt_shot2 = 1'b0;
					nt_bullet2 = 1'b0;
					nt_bulletx2 = enmx2;
					nt_bullety2 = enmy2;
				end
				else
				begin
					nt_shot2 = 1'b0;
					nt_bullet2 = 1'b1;
					nt_bulletx2 = bulletx2;
					nt_bullety2 = bullety2 + 10'd10;
				end
			end
			
			if(bulletx6 > (reimux - 10'd10) && bulletx6 < (reimux + 10'd12) && bullety6 > (reimuy - 10'd11) && bullety6 < (reimuy + 10'd11))// =>　／
			begin
				nt_shot6 = 1'b1;
				nt_bullet6 = 1'b0;
				nt_bulletx6 = enmx2;
				nt_bullety6 = enmy2;
			end
			else
			begin
				if(bulletx6 > 10'd432 || bulletx6 < 10'd8 || bullety6 > 10'd472 || bullety6 < 10'd8)
				begin
					nt_shot6 = 1'b0;
					nt_bullet6 = 1'b0;
					nt_bulletx6 = enmx2;
					nt_bullety6 = enmy2;
				end
				else
				begin
					nt_shot6 = 1'b0;
					nt_bullet6 = 1'b1;
					nt_bulletx6 = bulletx6 - 10'd7;
					nt_bullety6 = bullety6 + 10'd7;
				end
			end
			
			if(bulletx10 > (reimux - 10'd10) && bulletx10 < (reimux + 10'd12) && bullety10 > (reimuy - 10'd11) && bullety10 < (reimuy + 10'd11))// =>　＼
			begin
				nt_shot10 = 1'b1;
				nt_bullet10 = 1'b0;
				nt_bulletx10 = enmx2;
				nt_bullety10 = enmy2;
			end
			else
			begin
				if(bulletx10 > 10'd432 || bulletx10 < 10'd8 || bullety10 > 10'd472 || bullety10 < 10'd8)
				begin
					nt_shot10 = 1'b0;
					nt_bullet10 = 1'b0;
					nt_bulletx10 = enmx2;
					nt_bullety10 = enmy2;
				end
				else
				begin
					nt_shot10 = 1'b0;
					nt_bullet10 = 1'b1;
					nt_bulletx10 = bulletx10 + 10'd7;
					nt_bullety10 = bullety10 + 10'd7;
				end
			end
		end
	end
	
	always@(*)//enm3
	begin
		if(!enm3)
		begin
			nt_shot3 = 1'b0;
			nt_bullet3 = 1'b0;
			nt_bulletx3 = 10'd0;
			nt_bullety3 = 10'd0;
			nt_shot7 = 1'b0;
			nt_bullet7 = 1'b0;
			nt_bulletx7 = 10'd0;
			nt_bullety7 = 10'd0;
			nt_shot11 = 1'b0;
			nt_bullet11 = 1'b0;
			nt_bulletx11 = 10'd0;
			nt_bullety11 = 10'd0;
		end
		else
		begin
			if(bulletx3 > (reimux - 10'd10) && bulletx3 < (reimux + 10'd12) && bullety3 > (reimuy - 10'd11) && bullety3 < (reimuy + 10'd11))// =>｜
			begin
				nt_shot3 = 1'b1;
				nt_bullet3 = 1'b0;
				nt_bulletx3 = enmx3;
				nt_bullety3 = enmy3;
			end
			else
			begin
				if(bulletx3 > 10'd432 || bulletx3 < 10'd8 || bullety3 > 10'd472 || bullety3 < 10'd8)
				begin
					nt_shot3 = 1'b0;
					nt_bullet3 = 1'b0;
					nt_bulletx3 = enmx3;
					nt_bullety3 = enmy3;
				end
				else
				begin
					nt_shot3 = 1'b0;
					nt_bullet3 = 1'b1;
					nt_bulletx3 = bulletx3;
					nt_bullety3 = bullety3 + 10'd10;
				end
			end
			
			if(bulletx7 > (reimux - 10'd10) && bulletx7 < (reimux + 10'd12) && bullety7 > (reimuy - 10'd11) && bullety7 < (reimuy + 10'd11))// =>　／
			begin
				nt_shot7 = 1'b1;
				nt_bullet7 = 1'b0;
				nt_bulletx7 = enmx3;
				nt_bullety7 = enmy3;
			end
			else
			begin
				if(bulletx7 > 10'd432 || bulletx7 < 10'd8 || bullety7 > 10'd472 || bullety7 < 10'd8)
				begin
					nt_shot7 = 1'b0;
					nt_bullet7 = 1'b0;
					nt_bulletx7 = enmx3;
					nt_bullety7 = enmy3;
				end
				else
				begin
					nt_shot7 = 1'b0;
					nt_bullet7 = 1'b1;
					nt_bulletx7 = bulletx7 - 10'd7;
					nt_bullety7 = bullety7 + 10'd7;
				end
			end
			
			if(bulletx11 > (reimux - 10'd10) && bulletx11 < (reimux + 10'd12) && bullety11 > (reimuy - 10'd11) && bullety11 < (reimuy + 10'd11))// =>　＼
			begin
				nt_shot11 = 1'b1;
				nt_bullet11 = 1'b0;
				nt_bulletx11 = enmx3;
				nt_bullety11 = enmy3;
			end
			else
			begin
				if(bulletx11 > 10'd432 || bulletx11 < 10'd8 || bullety11 > 10'd472 || bullety11 < 10'd8)
				begin
					nt_shot11 = 1'b0;
					nt_bullet11 = 1'b0;
					nt_bulletx11 = enmx3;
					nt_bullety11 = enmy3;
				end
				else
				begin
					nt_shot11 = 1'b0;
					nt_bullet11 = 1'b1;
					nt_bulletx11 = bulletx11 + 10'd7;
					nt_bullety11 = bullety11 + 10'd7;
				end
			end
		end
	end
	
	always@(*)//enm4
	begin
		if(!enm4)
		begin
			nt_shot4 = 1'b0;
			nt_bullet4 = 1'b0;
			nt_bulletx4 = 10'd0;
			nt_bullety4 = 10'd0;
			nt_shot8 = 1'b0;
			nt_bullet8 = 1'b0;
			nt_bulletx8 = 10'd0;
			nt_bullety8 = 10'd0;
			nt_shot12 = 1'b0;
			nt_bullet12 = 1'b0;
			nt_bulletx12 = 10'd0;
			nt_bullety12 = 10'd0;
		end
		else
		begin
		
			if(bulletx4 > (reimux - 10'd10) && bulletx4 < (reimux + 10'd12) && bullety4 > (reimuy - 10'd11) && bullety4 < (reimuy + 10'd11))// =>｜
			begin
				nt_shot4 = 1'b1;
				nt_bullet4 = 1'b0;
				nt_bulletx4 = enmx4;
				nt_bullety4 = enmy4;
			end
			else
			begin
				if(bulletx4 > 10'd432 || bulletx4 < 10'd8 || bullety4 > 10'd472 || bullety4 < 10'd8)
				begin
					nt_shot4 = 1'b0;
					nt_bullet4 = 1'b0;
					nt_bulletx4 = enmx4;
					nt_bullety4 = enmy4;
				end
				else
				begin
					nt_shot4 = 1'b0;
					nt_bullet4 = 1'b1;
					nt_bulletx4 = bulletx4;
					nt_bullety4 = bullety4 + 10'd10;
				end
			end
			
			if(bulletx8 > (reimux - 10'd10) && bulletx8 < (reimux + 10'd12) && bullety8 > (reimuy - 10'd11) && bullety8 < (reimuy + 10'd11))// =>　／
			begin
				nt_shot8 = 1'b1;
				nt_bullet8 = 1'b0;
				nt_bulletx8 = enmx4;
				nt_bullety8 = enmy4;
			end
			else
			begin
				if(bulletx8 > 10'd432 || bulletx8 < 10'd8 || bullety8 > 10'd472 || bullety8 < 10'd8)
				begin
					nt_shot8 = 1'b0;
					nt_bullet8 = 1'b0;
					nt_bulletx8 = enmx4;
					nt_bullety8 = enmy4;
				end
				else
				begin
					nt_shot8 = 1'b0;
					nt_bullet8 = 1'b1;
					nt_bulletx8 = bulletx8 - 10'd7;
					nt_bullety8 = bullety8 + 10'd7;
				end
			end
			
			if(bulletx12 > (reimux - 10'd10) && bulletx12 < (reimux + 10'd12) && bullety12 > (reimuy - 10'd11) && bullety12 < (reimuy + 10'd11))// =>　＼
			begin
				nt_shot12 = 1'b1;
				nt_bullet12 = 1'b0;
				nt_bulletx12 = enmx4;
				nt_bullety12 = enmy4;
			end
			else
			begin
				if(bulletx12 > 10'd440 || bulletx12 < 10'd8 || bullety12 > 10'd472 || bullety12 < 10'd8)
				begin
					nt_shot12 = 1'b0;
					nt_bullet12 = 1'b0;
					nt_bulletx12 = enmx4;
					nt_bullety12 = enmy4;
				end
				else
				begin
					nt_shot12 = 1'b0;
					nt_bullet12 = 1'b1;
					nt_bulletx12 = bulletx12 + 10'd7;
					nt_bullety12 = bullety12 + 10'd7;
				end
			end
		end
	end
endmodule
