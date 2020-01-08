module FBulletPic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	wire [11:0] data;
	
	blk_mem_gen_7 blk_mem_gen_7_inst(
      .clka(clk_25m),
      .wea(0),
      .addra(addr),
      .dina(data[11:0]),
      .douta(pixel)
    ); 
endmodule