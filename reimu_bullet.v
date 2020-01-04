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
	output reg [9:0]reimu_bulletx,
	output reg [9:0]reimu_bullety,
	input [9:0]reimux,
	input [9:0]reimuy
//	input [9:0]bossx,
//	input [9:0]bossy,
//	input [9:0]enmx1,
//	input [9:0]enmy1,
//	input [9:0]enmx2,
//	input [9:0]enmy2,
//	input [9:0]enmx3,
//	input [9:0]enmy3,
//	input [9:0]enmx4,
//	input [9:0]enmy4,
//	output reg [6:0]enmhp1,
//	output reg [6:0]enmhp2,
//	output reg [6:0]enmhp3,
//	output reg [6:0]enmhp4,
//	output reg [9:0]bosshp
			);

always@(posedge clk_22)begin
	if(rst)begin
		reimu_bulletx <= reimux;
		reimu_bullety <= reimuy;
	end
	else begin/*
		if(((mybx>=bossx-41)&&(mybx<=bossx+41)&&(myby<=bossy+24)))begin//打到BOSS
			mybx<=planex;
			myby<=planey;
			if(bosshp>0) bosshp<=bosshp-2;
			else bosshp<=0;
		end
			
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
		
		else*/ if(reimu_bullety<=10'd0)begin //overheaven
			reimu_bulletx <= reimux;
			reimu_bullety <= reimuy;
		end
	
		else
			if(reimu_bullety <= 10'd120)
				reimu_bullety <= reimu_bullety-10'd1;
			else if(reimu_bullety <= 10'd240)
				reimu_bullety <= reimu_bullety-10'd4;
			else
				reimu_bullety <= reimu_bullety-10'd5;
	end
end

endmodule
