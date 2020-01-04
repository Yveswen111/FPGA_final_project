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
	parameter [8:0] KEY_CODES_UP = 9'b0_0001_1101;    // W => 1D
	parameter [8:0] KEY_CODES_DOWN = 9'b0_0001_1011;  // S => 1B
    	parameter [8:0] KEY_CODES_LEFT = 9'b0_0001_1100;  // A => 1C
    	parameter [8:0] KEY_CODES_RIGHT = 9'b0_0010_0011; // D => 23
	parameter [8:0] KEY_CODES_Z = 9'b0_0010_1001;     // space => 29
	
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
					KEY_CODES_UP:begin 
						nt_nums[3] = 1'b1;
						nt_nums[2] = nums[2];
						nt_nums[1] = nums[1];
						nt_nums[0] = nums[0];
					end
					KEY_CODES_DOWN:begin 
						nt_nums[3] = nums[3];
						nt_nums[2] = 1'b1;
						nt_nums[1] = nums[1];
						nt_nums[0] = nums[0];
					end
					KEY_CODES_LEFT:begin 
						nt_nums[3] = nums[3];
						nt_nums[2] = nums[2];
						nt_nums[1] = 1'b1;
						nt_nums[0] = nums[0];
					end
					KEY_CODES_RIGHT:begin 
						nt_nums[3] = nums[3];
						nt_nums[2] = nums[2];
						nt_nums[1] = nums[1];
						nt_nums[0] = 1'b1;
					end
					default:nt_nums = nums;
				endcase
			end
			else begin
				case(last_change)
					KEY_CODES_UP:begin 
						nt_nums[3] = 1'b0;
						nt_nums[2] = nums[2];
						nt_nums[1] = nums[1];
						nt_nums[0] = nums[0];
					end
					KEY_CODES_DOWN:begin 
						nt_nums[3] = nums[3];
						nt_nums[2] = 1'b0;
						nt_nums[1] = nums[1];
						nt_nums[0] = nums[0];
					end
					KEY_CODES_LEFT:begin 
						nt_nums[3] = nums[3];
						nt_nums[2] = nums[2];
						nt_nums[1] = 1'b0;
						nt_nums[0] = nums[0];
					end
					KEY_CODES_RIGHT:begin 
						nt_nums[3] = nums[3];
						nt_nums[2] = nums[2];
						nt_nums[1] = nums[1];
						nt_nums[0] = 1'b0;
					end
					default:nt_nums = nums;
				endcase
			end
		end
		else begin
			nt_nums = nums;
		end
	end
	
endmodule
