module reimu(rst,clk22,gamestart,btnstate,reimux,reimuy);//自機
    input rst;
	input clk22;
	input gamestart;
	input [3:0]btnstate;
	/*
	keyboard
	up => 1000
	down => 0100
	left => 0010
	right => 0001
	*/
	output reg [9:0] reimux;
	output reg [9:0] reimuy;
	reg [9:0] nt_reimux;
	reg [9:0] nt_reimuy;

	always@(posedge clk22)
	begin
		if(rst || gamestart)
		begin
			reimux <= 10'd220;
			reimuy <= 10'd360;
		end
		else
		begin
			reimux <= nt_reimux;
			reimuy <= nt_reimuy;
		end
	end
	
	always@(*)
	begin
		if(btnstate[3:2] == 2'b10)//up
		begin
			if(reimuy > 10'd25)
			nt_reimuy = reimuy - 10'd7;
			else
			nt_reimuy = 10'd25;
		end
		else if(btnstate[3:2] == 2'b01)//down
		begin
			if(reimuy < 10'd465)
			nt_reimuy = reimuy + 10'd7;
			else
			nt_reimuy = 10'd465;
		end
		else
		begin
			nt_reimuy = reimuy;
		end
		
		if(btnstate[1:0] == 2'b10)//left
		begin
			if(reimux > 10'd24)
			nt_reimux = reimux - 10'd7;
			else
			nt_reimux = 10'd24;
		end
		else if(btnstate[1:0] == 2'b01)//right
		begin
			if(reimux < 10'd430)
			nt_reimux = reimux + 10'd7;
			else
			nt_reimux = 10'd430;
		end
		else
		begin
			nt_reimux = reimux;
		end
	end

endmodule
