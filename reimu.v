module reimu(clk22,gameover,btnstate,reimux,reimuy);//自機
	input clk22;
	input gameover;
	input [3:0] btnstate;
	/*
	keyboard
	up => 0000
	down => 0001
	left => 0010
	right => 0011
	*/
	output reg [9:0] reimux;
	output reg [9:0] reimuy;
	reg [9:0] nt_reimux;
	reg [9:0] nt_reimuy;

	always@(posedge clk22)
	begin
		if(gameover)
		begin
			reimux <= 10'd0;
			reimuy <= 10'd0;
		end
		else
		begin
			reimux <= nt_reimux;
			reimuy <= nt_reimuy;
		end
	end
	
	always@(posedge clk22)
	begin
		case(btnstate)
		4'b0000://up
		begin
			if(reimuy > 10'd0)
			begin
				nt_reimuy = reimuy - 10'd1;
			end
			else
			begin
				nt_reimuy = 10'd0;
			end
		end
		4'b0001://down
		begin
			if(reimuy < 10'd480)
			begin
				nt_reimuy = reimuy + 10'd1;
			end
			else
			begin
				nt_reimuy = 10'd480;
			end
		end
		4'b0010://left
		begin
			if(reimux > 10'd0)
			begin
				nt_reimux = reimux - 10'd1;
			end
			else
			begin
				nt_reimux = 10'd0;
			end
		end
		4'b0011://right
		begin
			if(reimux < 10'd440)
			begin
				nt_reimux = reimux + 10'd1;
			end
			else
			begin
				nt_reimux = 10'd440;
			end
		end
		default:
		begin
			nt_reimux = reimux;
			nt_reimuy = reimuy;
		end
		endcase
    end

endmodule
