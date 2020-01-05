module boss(rst,clk22,enma1,enma2,enma3,enma4,bosshp,bossx,bossy,boss);
	input rst;
	input clk22;
	input enma1;
	input enma2;
	input enma3;
	input enma4;
	input [9:0] bosshp;
	output reg [9:0] bossx;
	output reg [9:0] bossy;
	output reg boss;

	reg nt_boss;
	reg [9:0] nt_bossx;
	reg [9:0] nt_bossy;

	wire enma;
	assign enma = enma1 | enma2 | enma3 | enma4;//if enma = 0 then boss comes

	always@(posedge clk22)begin
		if(rst)
		begin
			boss <= 1'b0;
			bossx <= 10'd0;
			bossy <= 10'd75;
		end
		else
		begin
			boss <= nt_boss;
			bossx <= nt_bossx;
			bossy <= nt_bossy;
		end
	end

	always@(*)begin
		if(boss)
		begin
		if(bosshp > 10'd300)
			begin
				if(bossx < 10'd400)
				begin
					nt_bossx = bossx + 10'd1;
					nt_bossy = 10'd75;
				end
				else
				begin
					nt_bossx = 10'd400;
					nt_bossy = 10'd75;
				end
			end
			else if(bosshp <= 10'd300 && bosshp > 10'd150)
			begin
				if(bossy < 10'd150)
				begin
					nt_bossy = bossy + 10'd1;
					nt_bossx = bossx;
				end
				else
				begin
					nt_bossy = 10'd150;
					nt_bossx = bossx;
				end
			end
			else if(bosshp <= 10'd150 && bosshp > 10'd0)
			begin
				if(bossx > 10'd50)
				begin
					nt_bossx = bossx - 10'd1;
					nt_bossy = bossy;
				end
				else
				begin
					nt_bossx = 10'd50;
					nt_bossy = bossy;
				end
			end
			else
			begin
				nt_bossx = 10'd0;
				nt_bossy = 10'd0;
			end
		end
		else
		begin
			nt_bossx = 10'd0;
			nt_bossy = 10'd0;
		end
	end
	
	always@(*)begin
		if(bosshp > 10'd0 && bosshp < 10'd451 && !enma)
		begin
			nt_boss = 1'b1;
		end
		else
		begin
			nt_boss = 1'b0;
		end
	end
endmodule
