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
module vga_RGB(clk_25m, reimux, reimuy, hc, vc, vgaRed, vgaGreen, vgaBlue, rst, valid);
	input clk_25m, valid;
	input [9:0]reimux;
	input [9:0]reimuy; //position of player
	input rst; //reset signal
	input [9:0]hc;
	input [9:0]vc; //monitor coordinate
	output reg [3:0]vgaRed;
	output reg [3:0]vgaGreen;
	output reg [3:0]vgaBlue;

	reg [16:0]adrbg;//background image
	wire [9:0]Dbg;
	BgPic i1(clk_25m,adrbg,Dbg);
	reg [16:0]adrmyp;//player image
	wire [9:0]Dmyp;
	ReimuPic i2(clk_25m,adrmyp,Dmyp);
	
	always@(*) begin//player position calculate. need change
		if((hc<=reimux+15)&&(hc>reimux-15)&&(vc>=reimuy-25)&&(vc<reimuy+25))
			adrmyp = hc+15-reimux+30*(vc+25-reimuy);
		else
			adrmyp = 0;
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
			if((Dmyp!=10'b00000000))//reimu pic
				{vgaRed,vgaGreen,vgaBlue}<=Dmyp;
			else
				//background
				{vgaRed,vgaGreen,vgaBlue}<=Dbg;
		end
	end
endmodule