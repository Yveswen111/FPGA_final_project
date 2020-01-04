module enm(
	input rst,
	input clk22,
	input [6:0]enmhp1,
	input [6:0]enmhp2,
	input [6:0]enmhp3,
	input [6:0]enmhp4,
	output reg [9:0]enmx1,
	output reg [9:0]enmy1,
	output reg [9:0]enmx2,
	output reg [9:0]enmy2,
	output reg [9:0]enmx3,
	output reg [9:0]enmy3,
	output reg [9:0]enmx4,
	output reg [9:0]enmy4
	);
	
	reg [9:0]nt_enmx1;
	reg [9:0]nt_enmy1;
	reg [9:0]nt_enmx2;
	reg [9:0]nt_enmy2;
	reg [9:0]nt_enmx3;
	reg [9:0]nt_enmy3;
	reg [9:0]nt_enmx4;
	reg [9:0]nt_enmy4;
	
	always@(posedge clk22)begin
		if(rst)
		begin
			enmx1 <= 10'd40;
			enmy1 <= 10'd40;
			enmx2 <= 10'd140;
			enmy2 <= 10'd80;
			enmx3 <= 10'd240;
			enmy3 <= 10'd80;
			enmx4 <= 10'd340;
			enmy4 <= 10'd40;
		end
		else
		begin
			enmx1 <= nt_enmx1;
			enmy1 <= nt_enmy1;
			enmx2 <= nt_enmx2;
			enmy2 <= nt_enmy2;
			enmx3 <= nt_enmx3;
			enmy3 <= nt_enmy3;
			enmx4 <= nt_enmx4;
			enmy4 <= nt_enmy4;
		end
	end

	always@(*)
	begin
		if(enmhp1 > 7'd80)
		begin
			if(enmy1 < 10'd200)
			begin
				nt_enmy1 = enmy1 + 10'd2;
				nt_enmx1 = 10'd40;
			end
			else
			begin
				nt_enmy1 = 10'd200;
				nt_enmx1 = 10'd40;
			end
		end
		else if(7'd80 >= enmhp1 && enmhp1 > 7'd40)
		begin
			if(enmx1 < 10'd140)
			begin
				nt_enmx1 = enmx1 + 10'd1;
				nt_enmy1 = enmy1;
			end
			else
			begin
				nt_enmx1 = 10'd140;
				nt_enmy1 = enmy1;
			end
		end
		else if(7'd40 >= enmhp1 && enmhp1 > 7'd0)
		begin
			if(enmy1 > 10'd20)
			begin
				nt_enmy1 = enmy1 - 10'd2;
				nt_enmx1 = enmx1;
			end
			else
			begin
				nt_enmy1 = 10'd20;
				nt_enmx1 = enmx1;
			end
		end
		else
		begin
			nt_enmx1 = 10'd0;
			nt_enmy1 = 10'd0;
		end
	end
	
	always@(*)
	begin
		if(enmhp2 > 7'd80)
		begin
			if(enmy2 > 10'd20)
			begin
				nt_enmy2 = enmy2 - 10'd2;
				nt_enmx2 = 10'd140;
			end
			else
			begin
				nt_enmy2 = 10'd20;
				nt_enmx2 = 10'd140;
			end
		end
		else if(7'd80 >= enmhp2 && enmhp2 > 7'd40)
		begin
			if(enmx2 > 10'd40)
			begin
				nt_enmx2 = enmx2 - 10'd1;
				nt_enmy2 = enmy2;
			end
			else
			begin
				nt_enmx2 = 10'd40;
				nt_enmy2 = enmy2;
			end
		end
		else if(7'd40 >= enmhp2 && enmhp2 > 7'd0)
		begin
			if(enmy2 > 10'd200)
			begin
				nt_enmy2 = enmy2 + 10'd2;
				nt_enmx2 = enmx2;
			end
			else
			begin
				nt_enmy2 = 10'd20;
				nt_enmx2 = enmx2;
			end
		end
		else
		begin
			nt_enmx2 = 10'd0;
			nt_enmy2 = 10'd0;
		end
	end
	
	always@(*)
	begin
		if(enmhp3 > 7'd80)
		begin
			if(enmy3 < 10'd200)
			begin
				nt_enmy3 = enmy3 + 10'd2;
				nt_enmx3 = 10'd240;
			end
			else
			begin
				nt_enmy3 = 10'd200;
				nt_enmx3 = 10'd240;
			end
		end
		else if(7'd80 >= enmhp3 && enmhp3 > 7'd40)
		begin
			if(enmx3 < 10'd340)
			begin
				nt_enmx3 = enmx3 + 10'd1;
				nt_enmy3 = enmy3;
			end
			else
			begin
				nt_enmx3 = 10'd340;
				nt_enmy3 = enmy3;
			end
		end
		else if(7'd40 >= enmhp3 && enmhp3 > 7'd0)
		begin
			if(enmy3 > 10'd20)
			begin
				nt_enmy3 = enmy3 - 10'd2;
				nt_enmx3 = enmx3;
			end
			else
			begin
				nt_enmy3 = 10'd20;
				nt_enmx3 = enmx3;
			end
		end
		else
		begin
			nt_enmx3 = 10'd0;
			nt_enmy3 = 10'd0;
		end
	end
	
	always@(*)
	begin
		if(enmhp4 > 7'd80)
		begin
			if(enmy4 > 10'd20)
			begin
				nt_enmy4 = enmy4 - 10'd2;
				nt_enmx4 = 10'd340;
			end
			else
			begin
				nt_enmy4 = 10'd20;
				nt_enmx4 = 10'd340;
			end
		end
		else if(7'd80 >= enmhp4 && enmhp4 > 7'd40)
		begin
			if(enmx4 > 10'd240)
			begin
				nt_enmx4 = enmx4 - 10'd1;
				nt_enmy4 = enmy4;
			end
			else
			begin
				nt_enmx4 = 10'd240;
				nt_enmy4 = enmy4;
			end
		end
		else if(7'd40 >= enmhp4 && enmhp4 > 7'd0)
		begin
			if(enmy4 < 10'd200)
			begin
				nt_enmy4 = enmy4 + 10'd2;
				nt_enmx4 = enmx4;
			end
			else
			begin
				nt_enmy4 = 10'd200;
				nt_enmx4 = enmx4;
			end
		end
		else
		begin
			nt_enmx4 = 10'd0;
			nt_enmy4 = 10'd0;
		end
	end

endmodule
