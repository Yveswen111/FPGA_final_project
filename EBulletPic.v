module EBulletPic(clk_25m, addr, pixel);
	input clk_25m;
	input [16:0]addr;
	output [11:0]pixel;
	wire [11:0] data;
	
	blk_mem_gen_5 blk_mem_gen_5_inst(
      .clka(clk_25m),
      .wea(0),
      .addra(addr),
      .dina(data[11:0]),
      .douta(pixel)
    ); 
endmodule