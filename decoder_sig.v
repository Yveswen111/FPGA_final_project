module decoder_sig(
	input wire rst,
	input wire clk,
	input wire been_ready,
	input wire [8:0] last_change,
	input wire [511:0] key_down,
	output reg[3:0] nums
	);
	
	parameter [8:0] LEFT_SHIFT_CODES  = 9'b0_0001_0010;
	parameter [8:0] RIGHT_SHIFT_CODES = 9'b0_0101_1001;
	parameter [8:0] KEY_CODES_UP = 9'b0_0111_0101;	// E075
	parameter [8:0] KEY_CODES_DOWN = 9'b0_0111_0010;	// E072
    parameter [8:0] KEY_CODES_LEFT = 9'b0_0110_1011;	// E06B
    parameter [8:0] KEY_CODES_RIGHT = 9'b0_0111_0100; // E074
	parameter [8:0] KEY_CODES_Z = 9'b0_0001_1010; // 1A
	
	reg [3:0] nt_nums;
		
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			nums <= 4'b0000;
		end
		else
		begin
			nums <= nt_nums;
		end
	end
	
	always@(*)begin
		if (been_ready)begin
			if(key_down[last_change])begin
				case(last_change)
					KEY_CODES_UP:nt_nums[3] = 1'b1;
					KEY_CODES_DOWN:nt_nums[2] = 1'b1;
					KEY_CODES_LEFT:nt_nums[1] = 1'b1;
					KEY_CODES_RIGHT:nt_nums[0] = 1'b1;
				endcase
			end
			else begin
				case(last_change)
					KEY_CODES_UP:nt_nums[3] = 1'b0;
					KEY_CODES_DOWN:nt_nums[2] = 1'b0;
					KEY_CODES_LEFT:nt_nums[1] = 1'b0;
					KEY_CODES_RIGHT:nt_nums[0] = 1'b0;
				endcase
			end
		end
		else begin
			nt_nums = nums;
		end
	end
	
endmodule
