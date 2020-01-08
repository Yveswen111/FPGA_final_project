`define NM1 32'd262 //C_freq 1
`define NM2 32'd294 //D_freq 2
`define NM3 32'd330 //E_freq 3
`define NM4 32'd349 //F_freq 4
`define NM5 32'd392 //G_freq 5
`define NM6 32'd440 //A_freq 6
`define NM7 32'd494 //B_freq 7
`define NM8 32'd196 //G-_freq 5-
`define NM9 32'd220 //A-_freq 6-
`define NM10 32'd247 //B-_freq 7-
`define NM11 32'd524 //C+_freq 1+
`define NM12 32'd588 //D+_freq 2+
`define NM13 32'd277 //D_freq- b2
`define NM14 32'd311 //D_freq+ #2
`define NM15 32'd660 //E_freq+ 3+
`define NM16 32'd554 //D_freq+ #2+
`define NM17 32'd698 //F_freq+ 4+
`define NM18 32'd740 //F_freq+ #4+
`define NM19 32'd784 //G_freq+ 5+
`define NM20 32'd880 //A_freq+ 6+
`define NM21 32'd988 //B_freq+ 7+
`define NM22 32'd1048 //C_freq++ 1+

`define NM0 32'd20000 //slience (over freq.)

module Music_start (
	input [9:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		10'd0 : tone = `NM0;
		10'd1 : tone = `NM0;
		10'd2 : tone = `NM15;
		10'd3 : tone = `NM15;
		10'd4 : tone = `NM15;
		10'd5 : tone = `NM15;
		10'd6 : tone = `NM19;
		10'd7 : tone = `NM19;
		
		10'd8 : tone = `NM20;
		10'd9 : tone = `NM20;
		10'd10 : tone = `NM20;
		10'd11 : tone = `NM20;
		10'd12 : tone = `NM20;
		10'd13 : tone = `NM20;
		10'd14 : tone = `NM19;
		10'd15 : tone = `NM20;
		10'd16 : tone = `NM19;
		10'd17 : tone = `NM19;
		10'd18 : tone = `NM15;
		10'd19 : tone = `NM15;
		10'd20 : tone = `NM12;
		10'd21 : tone = `NM12;
		10'd22 : tone = `NM19;
		10'd23 : tone = `NM19;
		
		10'd24 : tone = `NM15;
		10'd25 : tone = `NM15;
		10'd26 : tone = `NM15;
		10'd27 : tone = `NM15;
		10'd28 : tone = `NM15;
		10'd29 : tone = `NM15;
		10'd30 : tone = `NM15;
		10'd31 : tone = `NM15;
		10'd32 : tone = `NM0;
		10'd33 : tone = `NM0;
		10'd34 : tone = `NM15;
		10'd35 : tone = `NM15;
		10'd36 : tone = `NM15;
		10'd37 : tone = `NM15;
		10'd38 : tone = `NM19;
		10'd39 : tone = `NM19;
		
		10'd40 : tone = `NM20;
		10'd41 : tone = `NM20;
		10'd42 : tone = `NM20;
		10'd43 : tone = `NM20;
		10'd44 : tone = `NM20; //2
		10'd45 : tone = `NM20;
		10'd46 : tone = `NM19; //1
		10'd47 : tone = `NM20;
		10'd48 : tone = `NM22; //7-
		10'd49 : tone = `NM22;
		10'd50 : tone = `NM21; //6-
		10'd51 : tone = `NM22;
		10'd52 : tone = `NM21; //7-
		10'd53 : tone = `NM20;
		10'd54 : tone = `NM20; //1
		10'd55 : tone = `NM19;
		10'd56 : tone = `NM19; //7-
		//5
		10'd57 : tone = `NM20;
		10'd58 : tone = `NM20; //6-
		10'd59 : tone = `NM20;
		10'd60 : tone = `NM20; //+5-
		10'd61 : tone = `NM20;
		10'd62 : tone = `NM20; //7-
		10'd63 : tone = `NM20;
		10'd64 : tone = `NM20;
		10'd65 : tone = `NM0;
		10'd66 : tone = `NM0;
		10'd67 : tone = `NM19;
		10'd68 : tone = `NM20;
		10'd69 : tone = `NM19;
		10'd70 : tone = `NM19;
		10'd71 : tone = `NM15;
		10'd72 : tone = `NM15;
		//6
		10'd73 : tone = `NM12;
		10'd74 : tone = `NM12;
		10'd75 : tone = `NM12;
		10'd76 : tone = `NM12;
		10'd77 : tone = `NM12;
		10'd78 : tone = `NM12;
		10'd79 : tone = `NM0;
		10'd80 : tone = `NM0;
		10'd81 : tone = `NM19;
		10'd82 : tone = `NM20;
		10'd83 : tone = `NM19;
		10'd84 : tone = `NM19;
		10'd85 : tone = `NM12;
		10'd86 : tone = `NM12;
		//7
		10'd87 : tone = `NM11;
		10'd88 : tone = `NM11;
		10'd89 : tone = `NM11;
		10'd90 : tone = `NM11;
		10'd91 : tone = `NM11;
		10'd92 : tone = `NM11;
		10'd93 : tone = `NM0;
		10'd94 : tone = `NM0;
		10'd95 : tone = `NM6;
		10'd96 : tone = `NM6;
		10'd97 : tone = `NM6;
		10'd98 : tone = `NM6;
		10'd99 : tone = `NM7;
		10'd100 : tone = `NM7;
		//8
		10'd101 : tone = `NM11;
		10'd102 : tone = `NM11;
		10'd103 : tone = `NM11;
		10'd104 : tone = `NM11;
		10'd105 : tone = `NM11;
		10'd106 : tone = `NM11;
		10'd107 : tone = `NM12;
		10'd108 : tone = `NM12;
		10'd109 : tone = `NM7;
		10'd110 : tone = `NM7;
		10'd111 : tone = `NM7;
		10'd112 : tone = `NM7;
		10'd113 : tone = `NM7;
		10'd114 : tone = `NM7;
		10'd115 : tone = `NM6;
		10'd116 : tone = `NM6;
		//9
		10'd117 : tone = `NM0;
		10'd118 : tone = `NM6;
		10'd119 : tone = `NM6;
		10'd120 : tone = `NM6;
		10'd121 : tone = `NM6;
		10'd122 : tone = `NM6;
		10'd123 : tone = `NM6;
		10'd124 : tone = `NM6;
		10'd125 : tone = `NM6;
		10'd126 : tone = `NM6;
		10'd127 : tone = `NM6;
		10'd128 : tone = `NM6;	//6-
		10'd129 : tone = `NM6;
		10'd130 : tone = `NM6; //7-
		10'd131 : tone = `NM6;
		10'd132 : tone = `NM6;	//1

		default : tone = `NM0;
	endcase
end

endmodule