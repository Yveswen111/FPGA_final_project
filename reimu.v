module reimu(clk22,gameover,btnstate,reimux,reimuy);//自機
	input clk22;
	input gameover;
	input [3:0]btnstate;
	/*
	keyboard
	up => 0000
	down => 0001
	left => 0010
	right => 0011
	*/
	output reg [9:0]reimux;
	output reg [9:0]reimuy;


	initial
	begin
		reimux <= 10'd220;
		reimuy <= 10'd360;
	end

	always@(posedge clk22)
	begin
		if(gameover)
		begin
			reimux <= 10'd0;
			reimuy <= 10'd0;
		end
	else
	begin
		if(btnstate == 4'b0000 && (reimux >= 10'd0) && (reimux <= 10'd440) && (reimuy >= 10'd0) && (reimuy <= 10'd480))
			reimuy <= reimuy - 10'd1;
		else if(btnstate == 4'b0001 && (reimux >= 10'd0) && (reimux <= 10'd440) && (reimuy >= 10'd0) && (reimuy <= 10'd480))
			reimux<=reimux - 10'd1;
		else if(btnstate == 4'b0010 && (reimux >= 10'd0) && (reimux <= 10'd440) && (reimuy >= 10'd0) && (reimuy <= 10'd480))
			reimuy<=reimuy + 10'd1;
		else if(btnstate == 4'b0011 && (reimux >= 10'd0) && (reimux <= 10'd440) && (reimuy >= 10'd0) && (reimuy <= 10'd480))
			reimux<=reimux + 10'd1;
		else if(reimux <= 10'd0)
		begin
			reimux <= 10'd220;
			reimuy <= 10'd360;
		end
		else
			reimux <= reimux;
	end
end

endmodule