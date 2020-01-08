module ScoPic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_20 blk_mem_gen_20_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module Ti1Pic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_21 blk_mem_gen_21_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module Ti2Pic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_22 blk_mem_gen_22_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module En1Pic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_23 blk_mem_gen_23_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module En2Pic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_24 blk_mem_gen_24_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule

module WinPic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_25 blk_mem_gen_25_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule