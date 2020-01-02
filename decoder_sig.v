module decoder_sig(
	output wire [6:0] display,
	output wire [3:0] digit,
	inout wire PS2_DATA,
	inout wire PS2_CLK,
	input wire rst,
	input wire clk
	);
	
	parameter [8:0] LEFT_SHIFT_CODES  = 9'b0_0001_0010;
	parameter [8:0] RIGHT_SHIFT_CODES = 9'b0_0101_1001;
	parameter [8:0] KEY_CODES_UP = 9'b0_0111_0101;	// E075
	parameter [8:0] KEY_CODES_DOWN = 9'b0_0111_0010;	// E072
    parameter [8:0] KEY_CODES_LIFT = 9'b0_0110_1011;	// E06B
    parameter [8:0] KEY_CODES_RIGHT = 9'b0_0111_0100; // E074
	parameter [8:0] KEY_CODES_Z = 9'b0_0001_1010; // 1A
	
	reg [15:0] nums;
	reg [3:0] key_num;
	reg [9:0] last_key;
	
	wire shift_down;
	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;
	
	assign shift_down = (key_down[LEFT_SHIFT_CODES] == 1'b1 || key_down[RIGHT_SHIFT_CODES] == 1'b1) ? 1'b1 : 1'b0;
	
	SevenSegment seven_seg (
		.display(display),
		.digit(digit),
		.nums(nums),
		.rst(rst),
		.clk(clk)
	);
		
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	always @ (posedge clk, posedge rst) begin
		if (rst) begin
			nums <= 16'b0;
		end else begin
			nums <= nums;
			if (been_ready && key_down[last_change] == 1'b1) begin
				if (key_num != 4'b1111)begin
					if (shift_down == 1'b1) begin
						nums <= {key_num, nums[15:4]};
					end else begin
						nums <= {nums[11:0], key_num};
					end
				end
			end
		end
	end
	
	always @ (*) begin
		case (last_change)
			KEY_CODES_UP : key_num = 4'b0000; //up
			KEY_CODES_DOWN : key_num = 4'b0001; //down
			KEY_CODES_LIFT : key_num = 4'b0010; //left
			KEY_CODES_RIGHT : key_num = 4'b0011; //right
			KEY_CODES_Z : key_num = 4'b0100; //Z
			default		  : key_num = 4'b1111;
		endcase
	end
	
endmodule
