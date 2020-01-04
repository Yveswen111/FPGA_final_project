module top(
   input clk,
   input rst,
   inout PS2_DATA,
   inout PS2_CLK,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync
    );

    wire clk_25MHz;
    wire clk_22;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
	wire been_ready;
	wire [8:0] last_change;
	wire [511:0] key_down;
	wire [3:0] input_sig;
	wire [9:0] reimux,reimuy;
	wire shoot, reimuE;
	
	assign reimuE = ~shoot;
	
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	decoder_sig de_si(
		.rst(rst),
		.clk(clk),
		.been_ready(been_ready),
		.key_down(key_down),
		.last_change(last_change),
		.nums(input_sig),
		.shoot(shoot)
	);

     clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .clk1(clk_25MHz),
      .clk22(clk_22)
    );
	
	reimu myp(
		.clk22(clk_22),
		.gameover(0),
		.btnstate(input_sig),
		.reimux(reimux),
		.reimuy(reimuy),
		.rst(rst)
	);

	vga_RGB rgb(
		.clk_25m(clk_25MHz),
		.reimux(reimux),
		.reimuy(reimuy),
		.hc(h_cnt),
		.vc(v_cnt),
		.vgaRed(vgaRed),
		.vgaGreen(vgaGreen),
		.vgaBlue(vgaBlue),
		.rst(rst),
		.valid(valid),
		.reimuE(reimuE)
	);

    vga_controller   vga_inst(
      .pclk(clk_25MHz),
      .reset(rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
      
endmodule
