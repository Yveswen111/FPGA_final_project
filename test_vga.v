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
	wire shot, shot1, shot2; //get hurt
	wire [9:0]bulletx1;//enemy1 => ï½?
	wire [9:0]bullety1;
	wire [9:0]bulletx2;//enemy2 => ï½?
	wire [9:0]bullety2;
	wire [9:0]bulletx3;//enemy3 => ï½?
	wire [9:0]bullety3;
	wire [9:0]bulletx4;//enemy4 => ï½?
	wire [9:0]bullety4;
	wire [9:0]bulletx5;//enemy1 => ï¼?
	wire [9:0]bullety5;
	wire [9:0]bulletx6;//enemy2 => ï¼?
	wire [9:0]bullety6;
	wire [9:0]bulletx7;//enemy3 => ï¼?
	wire [9:0]bullety7;
	wire [9:0]bulletx8;//enemy4 => ï¼?
	wire [9:0]bullety8;
	wire [9:0]bulletx9;//enemy1 => ï¼?
	wire [9:0]bullety9;
	wire [9:0]bulletx10;//enemy2 => ï¼?
	wire [9:0]bullety10;
	wire [9:0]bulletx11;//enemy3 => ï¼?
	wire [9:0]bullety11;
	wire [9:0]bulletx12;//enemy4 => ï¼?
	wire [9:0]bullety12;
	wire [1:0]life;
	wire bullet1;//bullet exist = 1
	wire bullet2;
	wire bullet3;
	wire bullet4;
	wire bullet5;
	wire bullet6;
	wire bullet7;
	wire bullet8;
	wire bullet9;
	wire bullet10;
	wire bullet11;
	wire bullet12;
	wire flandore_bigbullet;//boss big bullet
	wire flandore_bullet1;
	wire flandore_bullet2;//normal bullet like this => ï¼?/|\ï¼?
	wire flandore_bullet3;
	wire flandore_bullet4;
	wire flandore_bullet5;
	wire [9:0]flandore_bigbulletx;//boss big bullet
	wire [9:0]flandore_bigbullety;
	wire [9:0]flandore_bulletx1;//normal bullet like this => ï¼?/|\ï¼?
	wire [9:0]flandore_bullety1;
	wire [9:0]flandore_bulletx2;
	wire [9:0]flandore_bullety2;
	wire [9:0]flandore_bulletx3;
	wire [9:0]flandore_bullety3;
	wire [9:0]flandore_bulletx4;
	wire [9:0]flandore_bullety4;
	wire [9:0]flandore_bulletx5;
	wire [9:0]flandore_bullety5;
	wire space;
	wire [1:0]scene;
	wire gamestart;
	wire shot_boss, shot_enm, shot_reimu;
	wire [3:0]score0, score1, score2, score3;
	
	assign shot = shot1||shot2;
	
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
		.enmy4(enmy4),
		.gamestart(gamestart)
	);
	
	scene_changer sc(
		.clk_22(clk_22),
		.rst(rst),
		.space(space),
		.bosshp(bosshp),
		.life(life),
		.scene(scene),
		.gamestart(gamestart)
	);
	
	OnePulse op(
		.signal_single_pulse(space),
		.signal(shoot),
		.clock(clk_22)
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
		.shot (shot1),
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
		.bullety12 (bullety12),
		.bullet1 (bullet1),
		.bullet2 (bullet2),
		.bullet3 (bullet3),
		.bullet4 (bullet4),
		.bullet5 (bullet5),
		.bullet6 (bullet6),
		.bullet7 (bullet7),
		.bullet8 (bullet8),
		.bullet9 (bullet9),
		.bullet10 (bullet10),
		.bullet11 (bullet11),
		.bullet12 (bullet12),
		.gamestart(gamestart)
	);
	
	reimu_life rl(
		.clk_22(clk_22),
		.shot(shot),
		.rst(rst),
		.life(life),
		.reimuE(reimuE),
		.gamestart(gamestart)
	);
	
	reimu myp(
		.clk22(clk_22),
		.gamestart(gamestart),
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
		.boss(boss),
		.gamestart(gamestart)
	);
	
	reimu_bullet rb(
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
		.enmy4(enmy4),
		.reimuE(reimuE),
		.gamestart(gamestart),
		.shot_enm (shot_enm),
		.shot_boss (shot_boss)
	);
	
	boss_bullet bb1 (
		.rst (rst),
		.clk22 (clk_22),
		.reimux (reimux),
		.reimuy (reimuy),
		.bossx (bossx),
		.bossy (bossy),
		.boss (boss),
		.shot (shot2),
		.flandore_bigbullet (flandore_bigbullet),
		.flandore_bullet1 (flandore_bullet1),
		.flandore_bullet2 (flandore_bullet2),
		.flandore_bullet3 (flandore_bullet3),
		.flandore_bullet4 (flandore_bullet4),
		.flandore_bullet5 (flandore_bullet5),
		.flandore_bigbulletx (flandore_bigbulletx),
		.flandore_bigbullety (flandore_bigbullety),
		.flandore_bulletx1 (flandore_bulletx1),
		.flandore_bullety1 (flandore_bullety1),
		.flandore_bulletx2 (flandore_bulletx2),
		.flandore_bullety2 (flandore_bullety2),
		.flandore_bulletx3 (flandore_bulletx3),
		.flandore_bullety3 (flandore_bullety3),
		.flandore_bulletx4 (flandore_bulletx4),
		.flandore_bullety4 (flandore_bullety4),
		.flandore_bulletx5 (flandore_bulletx5),
		.flandore_bullety5 (flandore_bullety5),
		.gamestart(gamestart)
	);
	
	OnePulse op1(
		.signal_single_pulse(shot_reimu),
		.signal(shot),
		.clock(clk_21)
	);
	
	score sc1 (
		.rst (rst),
		.clk22 (clk_21),
		.shot_reimu (shot_reimu),
		.shot_enm (shot_enm),
		.shot_boss (shot_boss),
		.enmhp1 (enmhp1),
		.enmhp2 (enmhp2),
		.enmhp3 (enmhp3),
		.enmhp4 (enmhp4),
		.bosshp (bosshp),
		.score0 (score0),
		.score1 (score1),
		.score2 (score2),
		.score3 (score3),
		.gamestart(gamestart)
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
		.bullety12 (bullety12),
		.bullet1 (bullet1),
		.bullet2 (bullet2),
		.bullet3 (bullet3),
		.bullet4 (bullet4),
		.bullet5 (bullet5),
		.bullet6 (bullet6),
		.bullet7 (bullet7),
		.bullet8 (bullet8),
		.bullet9 (bullet9),
		.bullet10 (bullet10),
		.bullet11 (bullet11),
		.bullet12 (bullet12),
		.flandore_bigbullet (flandore_bigbullet),
		.flandore_bullet1 (flandore_bullet1),
		.flandore_bullet2 (flandore_bullet2),
		.flandore_bullet3 (flandore_bullet3),
		.flandore_bullet4 (flandore_bullet4),
		.flandore_bullet5 (flandore_bullet5),
		.flandore_bigbulletx (flandore_bigbulletx),
		.flandore_bigbullety (flandore_bigbullety),
		.flandore_bulletx1 (flandore_bulletx1),
		.flandore_bullety1 (flandore_bullety1),
		.flandore_bulletx2 (flandore_bulletx2),
		.flandore_bullety2 (flandore_bullety2),
		.flandore_bulletx3 (flandore_bulletx3),
		.flandore_bullety3 (flandore_bullety3),
		.flandore_bulletx4 (flandore_bulletx4),
		.flandore_bullety4 (flandore_bullety4),
		.flandore_bulletx5 (flandore_bulletx5),
		.flandore_bullety5 (flandore_bullety5),
		.life(life),
		.scene(scene),
		.score0 (score0),
		.score1 (score1),
		.score2 (score2),
		.score3 (score3)
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
