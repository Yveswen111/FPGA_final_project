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
	wire clk_21;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
	wire been_ready;
	wire [8:0] last_change;
	wire [511:0] key_down;
	wire [3:0] input_sig;
	wire [9:0] reimux,reimuy;
	wire [9:0] bossx,bossy;
	wire [9:0] reimu_bulletx,reimu_bullety;
	wire shoot, reimuE,boss;
	wire reimu_bullet;
	wire [9:0]bosshp;
	wire [6:0]enmhp1, enmhp2, enmhp3, enmhp4;
	wire [9:0]enmx1;
	wire [9:0]enmy1;
	wire [9:0]enmx2;
	wire [9:0]enmy2;
	wire [9:0]enmx3;
	wire [9:0]enmy3;
	wire [9:0]enmx4;
	wire [9:0]enmy4;
	wire enm1, enm2, enm3, enm4;
	wire shot; //get hurt
	wire [9:0]bulletx1;//enemy1 => ｜
	wire [9:0]bullety1;
	wire [9:0]bulletx2;//enemy2 => ｜
	wire [9:0]bullety2;
	wire [9:0]bulletx3;//enemy3 => ｜
	wire [9:0]bullety3;
	wire [9:0]bulletx4;//enemy4 => ｜
	wire [9:0]bullety4;
	wire [9:0]bulletx5;//enemy1 => ／
	wire [9:0]bullety5;
	wire [9:0]bulletx6;//enemy2 => ／
	wire [9:0]bullety6;
	wire [9:0]bulletx7;//enemy3 => ／
	wire [9:0]bullety7;
	wire [9:0]bulletx8;//enemy4 => ／
	wire [9:0]bullety8;
	wire [9:0]bulletx9;//enemy1 => ＼
	wire [9:0]bullety9;
	wire [9:0]bulletx10;//enemy2 => ＼
	wire [9:0]bullety10;
	wire [9:0]bulletx11;//enemy3 => ＼
	wire [9:0]bullety11;
	wire [9:0]bulletx12;//enemy4 => ＼
	wire [9:0]bullety12;
	wire [1:0]life;
	
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
      .clk22(clk_22),
	  .clk21(clk_21)
    );
	
	enm enemy(
		.rst(rst),
		.clk22(clk_22),
		.enmhp1(enmhp1),
		.enmhp2(enmhp2),
		.enmhp3(enmhp3),
		.enmhp4(enmhp4),
		.enm1(enm1),
		.enm2(enm2),
		.enm3(enm3),
		.enm4(enm4),
		.enmx1(enmx1),
		.enmy1(enmy1),
		.enmx2(enmx2),
		.enmy2(enmy2),
		.enmx3(enmx3),
		.enmy3(enmy3),
		.enmx4(enmx4),
		.enmy4(enmy4)
	);
	
	enm_bullet eb1 (
		.rst (rst),
		.clk22 (clk_22),
		.reimux (reimux),
		.reimuy (reimuy),
		.enmx1 (enmx1),
		.enmy1 (enmy1),
		.enmx2 (enmx2),
		.enmy2 (enmy2),
		.enmx3 (enmx3),
		.enmy3 (enmy3),
		.enmx4 (enmx4),
		.enmy4 (enmy4),
		.enm1 (enm1),
		.enm2 (enm2),
		.enm3 (enm3),
		.enm4 (enm4),
		.shot (shot),
		.bulletx1 (bulletx1),
		.bullety1 (bullety1),
		.bulletx2 (bulletx2),
		.bullety2 (bullety2),
		.bulletx3 (bulletx3),
		.bullety3 (bullety3),
		.bulletx4 (bulletx4),
		.bullety4 (bullety4),
		.bulletx5 (bulletx5),
		.bullety5 (bullety5),
		.bulletx6 (bulletx6),
		.bullety6 (bullety6),
		.bulletx7 (bulletx7),
		.bullety7 (bullety7),
		.bulletx8 (bulletx8),
		.bullety8 (bullety8),
		.bulletx9 (bulletx9),
		.bullety9 (bullety9),
		.bulletx10 (bulletx10),
		.bullety10 (bullety10),
		.bulletx11 (bulletx11),
		.bullety11 (bullety11),
		.bulletx12 (bulletx12),
		.bullety12 (bullety12)
	);
	
	reimu_life rl(
		.clk_22(clk_22),
		.shot(shot),
		.rst(rst),
		.life(life),
		.reimuE(reimuE)
	);
	
	reimu myp(
		.clk22(clk_22),
		.gameover(0),
		.btnstate(input_sig),
		.reimux(reimux),
		.reimuy(reimuy),
		.rst(rst)
	);
	
	boss flan(
		.rst(rst),
		.clk22(clk_22),
		.enm1(enm1),
		.enm2(enm2),
		.enm3(enm3),
		.enm4(enm4),
		.bosshp(bosshp),
		.bossx(bossx),
		.bossy(bossy),
		.boss(boss)
	);
	
	reimu_bullet(
		.clk_22(clk_21),
		.rst(rst),
		.reimu_bulletx(reimu_bulletx),
		.reimu_bullety(reimu_bullety),
		.reimux(reimux),
		.reimuy(reimuy),
		.shoot(shoot),
		.reimu_bullet(reimu_bullet),
		.bossx(bossx),
		.bossy(bossy),
		.bosshp(bosshp),
		.enmhp1(enmhp1),
		.enmhp2(enmhp2),
		.enmhp3(enmhp3),
		.enmhp4(enmhp4),
		.enmx1(enmx1),
		.enmy1(enmy1),
		.enmx2(enmx2),
		.enmy2(enmy2),
		.enmx3(enmx3),
		.enmy3(enmy3),
		.enmx4(enmx4),
		.enmy4(enmy4)
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
		.reimuE(reimuE),
		.bossx(bossx),
		.bossy(bossy),
		.boss(boss),
		.reimu_bulletx(reimu_bulletx),
		.reimu_bullety(reimu_bullety),
		.reimu_bullet(reimu_bullet),
		.enm1(enm1),
		.enm2(enm2),
		.enm3(enm3),
		.enm4(enm4),
		.enmx1(enmx1),
		.enmy1(enmy1),
		.enmx2(enmx2),
		.enmy2(enmy2),
		.enmx3(enmx3),
		.enmy3(enmy3),
		.enmx4(enmx4),
		.enmy4(enmy4),
		.bulletx1 (bulletx1),
		.bullety1 (bullety1),
		.bulletx2 (bulletx2),
		.bullety2 (bullety2),
		.bulletx3 (bulletx3),
		.bullety3 (bullety3),
		.bulletx4 (bulletx4),
		.bullety4 (bullety4),
		.bulletx5 (bulletx5),
		.bullety5 (bullety5),
		.bulletx6 (bulletx6),
		.bullety6 (bullety6),
		.bulletx7 (bulletx7),
		.bullety7 (bullety7),
		.bulletx8 (bulletx8),
		.bullety8 (bullety8),
		.bulletx9 (bulletx9),
		.bullety9 (bullety9),
		.bulletx10 (bulletx10),
		.bullety10 (bullety10),
		.bulletx11 (bulletx11),
		.bullety11 (bullety11),
		.bulletx12 (bulletx12),
		.bullety12 (bullety12)
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
