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
module vga_RGB(clk, reimux, reimuy, hc, vc, vgaRed, vgaGreen, vgaBlue, rst)
	input clk;
	input [9:0]reimux;
	input [9:0]reimuy; //position of player
	input rst; //reset signal
	input [9:0]hc;
	input [9:0]vc; //螢幕座標
	output reg [3:0]vgaRed;
	output reg [3:0]vgaGreen;
	output reg [3:0]vgaBlue;

	reg [12:0]adrbg1;//background image
	wire [7:0]Dbg1;
	bg1 i2(clk,adrbg1,Dbg1);
	reg [10:0]adrmyp;//player image
	wire [7:0]Dmyp1;
	mypl1 i5(clk,adrmyp,Dmyp1);
	
	always@(*) begin//player position calculate. need change
		if((hc<=reimux+15)&&(hc>reimux-15)&&(vc>=reimuy-19)&&(vc<reimuy+18))
			adrmyp = hc-reimux+15+(vc-reimuy+19)*30;
		else
			adrmyp = 0;
	end
	
	always@(*)begin
		adrbg1 = ((hc>>1)+320*(vc>>1))% 76800;
	end
	
	//----------------贴图部分	
	always@(posedge clk)begin
		if(rst == 1'b1) begin
			vgaRed[3:0]<=4'b0000;
			vgaGreen[3:0]<=4'b0000;
			vgaBlue[3:0]<=4'b0000;
		end
		else begin
			if((Dmyp1!=8'b00000000))//自机贴图
				{vgaRed,vgaGreen,vgaBlue}<=Dmyp1;
			else
				//background
				{vgaRed,vgaGreen,vgaBlue}<=Dbg1;
		end
	end
endmodule