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
	input [9:0]reimux,
	input [9:0]reimuy,
	input [9:0]bossx,
	input [9:0]bossy,
/*	input [9:0]enmx1,
	input [9:0]enmy1,
	input [9:0]enmx2,
	input [9:0]enmy2,
	input [9:0]enmx3,
	input [9:0]enmy3,
	input [9:0]enmx4,
	input [9:0]enmy4,
	output reg enm1,
	output reg enm2,
	output reg enm3,
	output reg enm4,*/
	output reg [9:0]bosshp
			);
	
	reg [9:0]nt_reimu_bulletx;
	reg [9:0]nt_reimu_bullety;
	reg nt_reimu_bullet;

/*	reg [6:0]enmhp1;
	reg [6:0]enmhp2;
	reg [6:0]enmhp3;
	reg [6:0]enmhp4;*/
	reg [9:0]nt_bosshp;
	
	assign boss = (bosshp!=9'd0);

	always@(posedge clk_22)begin
		if(rst)begin
			reimu_bulletx <= reimux;
			reimu_bullety <= reimuy;
			reimu_bullet <= 1'b0;
			bosshp <= 10'd450;
		end
		else begin
			reimu_bulletx <= nt_reimu_bulletx;
			reimu_bullety <= nt_reimu_bullety;
			reimu_bullet <= nt_reimu_bullet;
			bosshp <= nt_bosshp;
		end
	end
	
	always@(*)begin
		if(shoot) begin
			if((reimu_bulletx >= bossx-25)&&(reimu_bulletx <= bossx+25)&&(reimu_bullety <= bossy+38)&&(reimu_bullety >= bossy-37))begin //hit boss
				if(bosshp > 10'd0)
					nt_bosshp = bosshp-10'd2;
				else
					nt_bosshp = 10'd0;

				nt_reimu_bullet = 1'b0;
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
			end
			else if(reimu_bullety<=10'd0)begin //overheaven
				nt_reimu_bulletx = reimux;
				nt_reimu_bullety = reimuy;
				nt_reimu_bullet = 1'b0;
				nt_bosshp = bosshp;
			end
			else begin
				nt_reimu_bullet = 1'b1;
				nt_bosshp = bosshp;
				nt_reimu_bulletx = reimu_bulletx;
				
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
		end
	end

endmodule
		/*
		else if((mybx>enmx1-15)&&(mybx<enmx1+15)&&(myby<enmy1+18)&&(myby>enmy1-18))begin//打到杂鱼1
			mybx<=planex;
			myby<=planey;
			if(enmhp1>0) enmhp1<=enmhp1-5'b00010;
			else enmhp1<=0;
		end
		else if((mybx>enmx2-15)&&(mybx<enmx2+15)&&(myby<enmy2+18)&&(myby>enmy2-18))begin//打到杂鱼2
			mybx<=planex;
			myby<=planey;
			if(enmhp2>0) enmhp2<=enmhp2-5'b00010;
			else enmhp2<=0;
		end
		else if((mybx>enmx3-15)&&(mybx<enmx3+15)&&(myby<enmy3+18)&&(myby>enmy3-18))begin//打到杂鱼3
			mybx<=planex;
			myby<=planey;
			if(enmhp3>0) enmhp3<=enmhp3-5'b00010;
			else enmhp3<=0;
		end
		else if((mybx>enmx4-15)&&(mybx<enmx4+15)&&(myby<enmy4+18)&&(myby>enmy4-18))begin//打到杂鱼4
			mybx<=planex;
			myby<=planey;
			if(enmhp4>0) enmhp4<=enmhp4-5'b00010;
			else enmhp4<=0; 
		end
		*/