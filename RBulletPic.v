module RBulletPic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	
	blk_mem_gen_3 blk_mem_gen_3_inst(
      .clka(clk_25m),
      .addra(addr),
      .douta(pixel)
    ); 
endmodule