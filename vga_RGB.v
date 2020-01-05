`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name:    vga_RGB 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga_RGB(clk_25m, reimux, reimuy, reimuE, bossx, bossy, reimu_bulletx, reimu_bullety, reimu_bullet, boss, hc, vc, vgaRed, vgaGreen, vgaBlue, rst, valid, enmx1, enmy1, enmx2, enmy2, enmx3, enmy3, enmx4, enmy4, enm1, enm2, enm3, enm4, bulletx1, bullety1, bulletx2, bullety2, bulletx3, bullety3, bulletx4, bullety4, bulletx5, bullety5, bulletx6, bullety6, bulletx7, bullety7, bulletx8, bullety8, bulletx9, bullety9, bulletx10, bullety10, bulletx11, bullety11, bulletx12, bullety12);
	input clk_25m, valid;
	input [9:0]reimux;
	input [9:0]reimuy; //position of player
	input reimuE; //existence of player
	input rst; //reset signal
	input [9:0]bossx;
	input [9:0]bossy; //position of boss
	input [9:0]reimu_bulletx;
	input [9:0]reimu_bullety; //position of reimu_bullet
	input reimu_bullet;//existence of reimu_bullet
	input [9:0]enmx1;
	input [9:0]enmy1;
	input [9:0]enmx2;
	input [9:0]enmy2;
	input [9:0]enmx3;
	input [9:0]enmy3;
	input [9:0]enmx4;
	input [9:0]enmy4;//position of enemy
	input enm1, enm2, enm3, enm4;//existence of enemy
	input [9:0]bulletx1;//enemy1 => ｜
	input [9:0]bullety1;
	input [9:0]bulletx2;//enemy2 => ｜
	input [9:0]bullety2;
	input [9:0]bulletx3;//enemy3 => ｜
	input [9:0]bullety3;
	input [9:0]bulletx4;//enemy4 => ｜
	input [9:0]bullety4;
	input [9:0]bulletx5;//enemy1 => ／
	input [9:0]bullety5;
	input [9:0]bulletx6;//enemy2 => ／
	input [9:0]bullety6;
	input [9:0]bulletx7;//enemy3 => ／
	input [9:0]bullety7;
	input [9:0]bulletx8;//enemy4 => ／
	input [9:0]bullety8;
	input [9:0]bulletx9;//enemy1 => ＼
	input [9:0]bullety9;
	input [9:0]bulletx10;//enemy2 => ＼
	input [9:0]bullety10;
	input [9:0]bulletx11;//enemy3 => ＼
	input [9:0]bullety11;
	input [9:0]bulletx12;//enemy4 => ＼
	input [9:0]bullety12;
	input boss; //existence of boss 
	input [9:0]hc;
	input [9:0]vc; //monitor coordinate
	output reg [3:0]vgaRed;
	output reg [3:0]vgaGreen;
	output reg [3:0]vgaBlue;

	reg [16:0]adrbg;//background image
	wire [11:0]Dbg;
	BgPic i1(clk_25m,adrbg,Dbg);
	reg [16:0]adrmyp;//player image
	wire [11:0]Dmyp;
	ReimuPic i2(clk_25m,adrmyp,Dmyp);
	reg [16:0]adrboss;//boss image
	wire [11:0]Dboss;
	BossPic i3(clk_25m, adrboss, Dboss);
	reg [16:0]adrrb;//reimu bullet
	wire [11:0]Drb;
	RBulletPic i4(clk_25m, adrrb, Drb);
	reg [16:0]adrenm;//enemy pic
	wire [11:0]Denm;
	EnmPic i5(clk_25m, adrenm, Denm);
	reg [16:0]adreb;//enemy_bullet pic
	wire [11:0]Deb;
	EBulletPic i6(clk_25m, adreb, Deb);
	
	always@(*) begin//player position calculate.
		if((hc<=reimux+15)&&(hc>reimux-15)&&(vc>=reimuy-25)&&(vc<reimuy+25))
			adrmyp = hc+15-reimux+30*(vc+25-reimuy);
		else
			adrmyp = 17'd0;
	end
	
	always@(*) begin//boss position calculate.
		if((hc<=bossx+25)&&(hc>bossx-25)&&(vc>=bossy-37)&&(vc<bossy+38))
			adrboss = hc+25-bossx+50*(vc+37-bossy);
		else
			adrboss = 17'd0;
	end
	
	always@(*) begin//reimu_bullet position calculate.
		if((hc<=reimu_bulletx+8)&&(hc>reimu_bulletx-7)&&(vc>=reimu_bullety-7)&&(vc<reimu_bullety+8))
			adrrb = hc+7-reimu_bulletx+15*(vc+7-reimu_bullety);
		else
			adrrb = 17'd0;
	end
	
	always@(*) begin//enemy position calculate.
		if((hc<=enmx1+14)&&(hc>enmx1-14)&&(vc>=enmy1-14)&&(vc<enmy1+14)&&enm1)
			adrenm = hc+14-enmx1+28*(vc+14-enmy1);
		else if((hc<=enmx2+14)&&(hc>enmx2-14)&&(vc>=enmy2-14)&&(vc<enmy2+14)&&enm2)
			adrenm = hc+14-enmx2+28*(vc+14-enmy2);
		else if((hc<=enmx3+14)&&(hc>enmx3-14)&&(vc>=enmy3-14)&&(vc<enmy3+14)&&enm3)
			adrenm = hc+14-enmx3+28*(vc+14-enmy3);
		else if((hc<=enmx4+14)&&(hc>enmx4-14)&&(vc>=enmy4-14)&&(vc<enmy4+14)&&enm4)
			adrenm = hc+14-enmx4+28*(vc+14-enmy4);
		else
			adrenm = 17'd0;
	end
	
	always@(*)begin//enemy_bullet position calculate
		if((hc<=bulletx1+8)&&(hc>bulletx1-8)&&(vc>=bullety1-8)&&(vc<bullety1+8))
			adreb = hc+8-bulletx1+17*(vc+8-bullety1);
		else if((hc<=bulletx2+8)&&(hc>bulletx2-8)&&(vc>=bullety2-8)&&(vc<bullety2+8))
			adreb = hc+8-bulletx2+17*(vc+8-bullety2);
		else if((hc<=bulletx3+8)&&(hc>bulletx3-8)&&(vc>=bullety3-8)&&(vc<bullety3+8))
			adreb = hc+8-bulletx3+17*(vc+8-bullety3);
		else if((hc<=bulletx4+8)&&(hc>bulletx4-8)&&(vc>=bullety4-8)&&(vc<bullety4+8))
			adreb = hc+8-bulletx4+17*(vc+8-bullety4);
		else if((hc<=bulletx5+8)&&(hc>bulletx5-8)&&(vc>=bullety5-8)&&(vc<bullety5+8))
			adreb = hc+8-bulletx5+17*(vc+8-bullety5);
		else if((hc<=bulletx6+8)&&(hc>bulletx6-8)&&(vc>=bullety6-8)&&(vc<bullety6+8))
			adreb = hc+8-bulletx6+17*(vc+8-bullety6);
		else if((hc<=bulletx7+8)&&(hc>bulletx7-8)&&(vc>=bullety7-8)&&(vc<bullety7+8))
			adreb = hc+8-bulletx7+17*(vc+8-bullety7);
		else if((hc<=bulletx8+8)&&(hc>bulletx8-8)&&(vc>=bullety8-8)&&(vc<bullety8+8))
			adreb = hc+8-bulletx8+17*(vc+8-bullety8);
		else if((hc<=bulletx9+8)&&(hc>bulletx9-8)&&(vc>=bullety9-8)&&(vc<bullety9+8))
			adreb = hc+8-bulletx9+17*(vc+8-bullety9);
		else if((hc<=bulletx10+8)&&(hc>bulletx10-8)&&(vc>=bullety10-8)&&(vc<bullety10+8))
			adreb = hc+8-bulletx10+17*(vc+8-bullety10);
		else if((hc<=bulletx11+8)&&(hc>bulletx11-8)&&(vc>=bullety11-8)&&(vc<bullety11+8))
			adreb = hc+8-bulletx11+17*(vc+8-bullety11);
		else if((hc<=bulletx12+8)&&(hc>bulletx12-8)&&(vc>=bullety12-8)&&(vc<bullety12+8))
			adreb = hc+8-bulletx12+17*(vc+8-bullety12);
		else
			adreb = 17'd0;
	end
	
	always@(*)begin
		adrbg = ((hc>>1)+320*(vc>>1))% 76800;
	end
	
	//----------------choosing pixel
	always@(posedge clk_25m)begin
		if(rst == 1'b1 || valid != 1'b1) begin
			vgaRed[3:0]<=4'b0000;
			vgaGreen[3:0]<=4'b0000;
			vgaBlue[3:0]<=4'b0000;
		end
		else begin
			if((Dboss!=12'd0)&&boss)//boss pic
				{vgaRed,vgaGreen,vgaBlue}<=Dboss;
			else if((Denm!=12'd0))//enemy pic
				{vgaRed,vgaGreen,vgaBlue}<=Denm;
			else if((Dmyp!=12'd0)&&reimuE)//reimu pic
				{vgaRed,vgaGreen,vgaBlue}<=Dmyp;
			else if(Deb!=12'd0)//enemy_bullet
				{vgaRed,vgaGreen,vgaBlue}<=Deb;				
			else if((Drb!=12'd0)&&reimu_bullet)//reimu_bullet
				{vgaRed,vgaGreen,vgaBlue}<=Drb;
			else
				//background
				{vgaRed,vgaGreen,vgaBlue}<=Dbg;
		end
	end
endmodule