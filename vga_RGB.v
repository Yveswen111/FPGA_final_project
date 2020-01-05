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
module vga_RGB(clk_25m, reimux, reimuy, reimuE, bossx, bossy, reimu_bulletx, reimu_bullety, reimu_bullet, boss, hc, vc, vgaRed, vgaGreen, vgaBlue, rst, valid);
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
			else if((Dmyp!=12'd0)&&reimuE)//reimu pic
				{vgaRed,vgaGreen,vgaBlue}<=Dmyp;
			else if((Drb!=12'd0)&&reimu_bullet)//reimu_bullet
				{vgaRed,vgaGreen,vgaBlue}<=Drb;
			else
				//background
				{vgaRed,vgaGreen,vgaBlue}<=Dbg;
		end
	end
endmodule