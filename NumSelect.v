module NumSelect(
	input clk_25m,
	input [16:0]addr,
	input [3:0]num,
	output [11:0]pixel
);

	wire [11:0]D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
	reg [11:0]choose;
	num0 n0(clk_25m, addr, D0);
	num1 n1(clk_25m, addr, D1);
	num2 n2(clk_25m, addr, D2);
	num3 n3(clk_25m, addr, D3);
	num4 n4(clk_25m, addr, D4);
	num5 n5(clk_25m, addr, D5);
	num6 n6(clk_25m, addr, D6);
	num7 n7(clk_25m, addr, D7);
	num8 n8(clk_25m, addr, D8);
	num9 n9(clk_25m, addr, D9);
	
	assign pixel = choose;
	
	always@(*)begin
		case(num)
			4'd1:choose = D1;
			4'd2:choose = D2;
			4'd3:choose = D3;
			4'd4:choose = D4;
			4'd5:choose = D5;
			4'd6:choose = D6;
			4'd7:choose = D7;
			4'd8:choose = D8;
			4'd9:choose = D9;
			default:choose = D0;
		endcase
	end
endmodule

module num0(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_10 blk_mem_gen_10_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num1(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_11 blk_mem_gen_11_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num2(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_12 blk_mem_gen_12_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num3(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_13 blk_mem_gen_13_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num4(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_14 blk_mem_gen_14_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num5(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_15 blk_mem_gen_15_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num6(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_16 blk_mem_gen_16_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num7(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_17 blk_mem_gen_17_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num8(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_18 blk_mem_gen_18_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module num9(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_19 blk_mem_gen_19_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule