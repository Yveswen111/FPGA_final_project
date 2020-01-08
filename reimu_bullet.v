`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:19 02/09/2014 
// Design Name: 
// Module Name:    reimu_bullet 
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
module reimu_bullet(
	input clk_22,
	input rst,
	input shoot,
	output reg [9:0]reimu_bulletx,
	output reg [9:0]reimu_bullety,
	output reg reimu_bullet,
	input reimuE,
	input [9:0]reimux,
	input [9:0]reimuy,
	input [9:0]bossx,
	input [9:0]bossy,
	input [9:0]enmx1,
	input [9:0]enmy1,
	input [9:0]enmx2,
	input [9:0]enmy2,
	input [9:0]enmx3,
	input [9:0]enmy3,
	input [9:0]enmx4,
	input [9:0]enmy4,
	output reg [6:0]enmhp1,
	output reg [6:0]enmhp2,
	output reg [6:0]enmhp3,
	output reg [6:0]enmhp4,
	output reg [9:0]bosshp
			);
	
	reg [9:0]nt_reimu_bulletx;
	reg [9:0]nt_reimu_bullety;
	reg nt_reimu_bullet;

	reg [6:0]nt_enmhp1;
	reg [6:0]nt_enmhp2;
	reg [6:0]nt_enmhp3;
	reg [6:0]nt_enmhp4;
	reg [9:0]nt_bosshp;

	always@(posedge clk_22)begin
		if(rst)begin
			reimu_bulletx <= reimux;
			reimu_bullety <= reimuy;
			reimu_bullet <= 1'b0;
			bosshp <= 10'd450;
			enmhp1 <= 7'd120;
			enmhp2 <= 7'd120;
			enmhp3 <= 7'd120;
			enmhp4 <= 7'd120;
		end
		else begin
			reimu_bulletx <= nt_reimu_bulletx;
			reimu_bullety <= nt_reimu_bullety;
			reimu_bullet <= nt_reimu_bullet;
			bosshp <= nt_bosshp;
			enmhp1 <= nt_enmhp1;
			enmhp2 <= nt_enmhp2;
			enmhp3 <= nt_enmhp3;
			enmhp4 <= nt_enmhp4;
		end
	end
	
	always@(*)begin
		if(shoot&&reimuE) begin
			if((reimu_bulletx >= bossx-25)&&(reimu_bulletx <= bossx+25)&&(reimu_bullety <= bossy+38)&&(reimu_bullety >= bossy-37))begin //hit boss
				if(bosshp > 10'd0)
					nt_bosshp = bosshp-10'd1;
				else
					nt_bosshp = 10'd0;

				nt_reimu_bullet = 1'b0;
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_enmhp1 = enmhp1;
				nt_enmhp2 = enmhp2;
				nt_enmhp3 = enmhp3;
				nt_enmhp4 = enmhp4;
			end
			else if((reimu_bulletx >= enmx1-14)&&(reimu_bulletx <= enmx1+14)&&(reimu_bullety <= enmy1+14)&&(reimu_bullety >= enmy1-14))begin //hit enm1
				if(enmhp1 > 7'd0)
					nt_enmhp1 = enmhp1-7'd1;
				else
					nt_enmhp1 = 7'd0;

				nt_reimu_bullet = 1'b0;
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_bosshp = bosshp;
				nt_enmhp2 = enmhp2;
				nt_enmhp3 = enmhp3;
				nt_enmhp4 = enmhp4;
			end
			else if((reimu_bulletx >= enmx2-14)&&(reimu_bulletx <= enmx2+14)&&(reimu_bullety <= enmy2+14)&&(reimu_bullety >= enmy2-14))begin //hit enm2
				if(enmhp2 > 7'd0)
					nt_enmhp2 = enmhp2-7'd1;
				else
					nt_enmhp2 = 7'd0;

				nt_reimu_bullet = 1'b0;
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_bosshp = bosshp;
				nt_enmhp1 = enmhp1;
				nt_enmhp3 = enmhp3;
				nt_enmhp4 = enmhp4;
			end
			else if((reimu_bulletx >= enmx3-14)&&(reimu_bulletx <= enmx3+14)&&(reimu_bullety <= enmy3+14)&&(reimu_bullety >= enmy3-14))begin //hit enm3
				if(enmhp3 > 7'd0)
					nt_enmhp3 = enmhp3-7'd1;
				else
					nt_enmhp3 = 7'd0;

				nt_reimu_bullet = 1'b0;
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_bosshp = bosshp;
				nt_enmhp2 = enmhp2;
				nt_enmhp1 = enmhp1;
				nt_enmhp4 = enmhp4;
			end
			else if((reimu_bulletx >= enmx4-14)&&(reimu_bulletx <= enmx4+14)&&(reimu_bullety <= enmy4+14)&&(reimu_bullety >= enmy4-14))begin //hit enm4
				if(enmhp4 > 7'd0)
					nt_enmhp4 = enmhp4-7'd1;
				else
					nt_enmhp4 = 7'd0;

				nt_reimu_bullet = 1'b0;
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_bosshp = bosshp;
				nt_enmhp2 = enmhp2;
				nt_enmhp3 = enmhp3;
				nt_enmhp1 = enmhp1;
			end
			else if(reimu_bullety<=10'd0)begin //overheaven
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_reimu_bullet = 1'b0;
				nt_bosshp = bosshp;
				nt_enmhp1 = enmhp1;
				nt_enmhp2 = enmhp2;
				nt_enmhp3 = enmhp3;
				nt_enmhp4 = enmhp4;
			end
			else begin
				nt_reimu_bullet = 1'b1;
				nt_bosshp = bosshp;
				nt_reimu_bulletx = reimu_bulletx;
				nt_enmhp1 = enmhp1;
				nt_enmhp2 = enmhp2;
				nt_enmhp3 = enmhp3;
				nt_enmhp4 = enmhp4;
				
				if(reimu_bullety <= 10'd120)
					nt_reimu_bullety = reimu_bullety-10'd1;
				else if(reimu_bullety <= 10'd240)
					nt_reimu_bullety = reimu_bullety-10'd2;
				else
					nt_reimu_bullety = reimu_bullety-10'd4;
			end
		end
		else begin
			nt_reimu_bullet = 1'b0;
			nt_reimu_bulletx = reimux;
			nt_reimu_bullety = reimuy;
			nt_bosshp = bosshp;
			nt_enmhp1 = enmhp1;
			nt_enmhp2 = enmhp2;
			nt_enmhp3 = enmhp3;
			nt_enmhp4 = enmhp4;
		end
	end

endmodule