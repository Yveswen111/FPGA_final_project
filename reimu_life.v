module reimu_life(
	input clk_22,
	input shot,
	input rst,
	input gamestart,
	output reg[1:0]life,
	output reimuE
);
	reg [1:0]nt_life;
	reg reimuE_1, nt_reimuE_1;
	reg state, nt_state;
	reg [5:0]count;
	wire reimu_live;
	
	assign reimu_live = (life > 0);
	assign reimuE = reimuE_1 & reimu_live;
	
	always@(posedge clk_22)begin
		if(rst||gamestart)begin
			life <= 2'd3;
			reimuE_1 <= 1'b1;
			state <= 1'b0;
		end
		else begin
			life <= nt_life;
			reimuE_1 <= nt_reimuE_1;
			state <= nt_state;
		end
	end
	
	always@(posedge clk_22)begin
		if(state == 1'b1)begin
			count <= count + 7'd1;
		end
		else count <= 7'd0;
	end
	
	always@(*)begin
		case(state)
			1'b1:begin
				if(count[5]) nt_state = 1'b0;
				else nt_state = 1'b1;
				
				nt_life = life;
				nt_reimuE_1 = count[2];
			end
			default:begin
				if(shot)begin
					nt_state = 1'b1;
					if(life > 2'd0)	nt_life = life - 2'b1;
					else nt_life = 2'b0;
				end
				else begin
					nt_state = 1'b0;
					nt_life = life;
				end
				
				nt_reimuE_1 = 1'b1;
			end
		endcase
	end
	
endmodule