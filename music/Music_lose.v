`define NM1 32'd262 //C_freq 1
`define NM2 32'd294 //D_freq 2
`define NM3 32'd330 //E_freq 3
`define NM4 32'd349 //F_freq 4
`define NM5 32'd392 //G_freq 5
`define NM6 32'd415 //A_freq 6//降
`define NM7 32'd466 //B_freq 7//降
`define NM8 32'd196 //G-_freq 5-
`define NM9 32'd220 //A-_freq 6-
`define NM10 32'd247 //B-_freq 7-
`define NM11 32'd524 //C+_freq 1+
`define NM12 32'd588 //D+_freq 2+
`define NM13 32'd277 //D_freq- b2
`define NM14 32'd311 //D_freq+ #2
`define NM15 32'd622 //E_freq+ 3+//降
`define NM16 32'd554 //D_freq+ #2+
`define NM17 32'd698 //F_freq+ 4+
`define NM18 32'd740 //F_freq+ #4+
`define NM19 32'd784 //G_freq+ 5+
`define NM20 32'd830 //A_freq+ 6+//降
`define NM21 32'd932 //B_freq+ 7+//降
`define NM22 32'd1048 //C_freq++ 1+
`define NM23 32'd1176 //D_freq++ 2+
`define NM24 32'd1245 //E_freq++ 3+//降

`define NM0 32'd20000 //slience (over freq.)

module Music_lose (
	input [9:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		10'd0 : tone = `NM5;
		10'd1 : tone = `NM5;
		10'd2 : tone = `NM7;
		10'd3 : tone = `NM7;
		10'd4 : tone = `NM11;
		10'd5 : tone = `NM11;
		10'd6 : tone = `NM15;
		10'd7 : tone = `NM15;
		//2
		10'd8 : tone = `NM17;
		10'd9 : tone = `NM17;
		10'd10 : tone = `NM17;
		10'd11 : tone = `NM17;
		10'd12 : tone = `NM15;
		10'd13 : tone = `NM15;
		10'd14 : tone = `NM17;
		10'd15 : tone = `NM17;
		10'd16 : tone = `NM19;
		10'd17 : tone = `NM19;
		10'd18 : tone = `NM19;
		10'd19 : tone = `NM19;
		10'd20 : tone = `NM15;
		10'd21 : tone = `NM15;
		10'd22 : tone = `NM11;
		10'd23 : tone = `NM11;
		//3
		10'd24 : tone = `NM7;
		10'd25 : tone = `NM7;
		10'd26 : tone = `NM5;
		10'd27 : tone = `NM5;
		10'd28 : tone = `NM15;
		10'd29 : tone = `NM15;
		10'd30 : tone = `NM17;
		10'd31 : tone = `NM17;
		10'd32 : tone = `NM11;
		10'd33 : tone = `NM11;
		10'd34 : tone = `NM11;
		10'd35 : tone = `NM11;
		10'd36 : tone = `NM11; //1
		10'd37 : tone = `NM11;
		10'd38 : tone = `NM15; //2
		10'd39 : tone = `NM15;
		//4
		10'd40 : tone = `NM17; //3
		10'd41 : tone = `NM17;
		10'd42 : tone = `NM17;
		10'd43 : tone = `NM17;
		10'd44 : tone = `NM15; //2
		10'd45 : tone = `NM15;
		10'd46 : tone = `NM17; //1
		10'd47 : tone = `NM17;
		10'd48 : tone = `NM19; //7-
		10'd49 : tone = `NM19;
		10'd50 : tone = `NM19; //6-
		10'd51 : tone = `NM19;
		10'd52 : tone = `NM21; //7-
		10'd53 : tone = `NM21;
		10'd54 : tone = `NM22; //1
		10'd55 : tone = `NM22;
		//5
		10'd56 : tone = `NM24; //7-
		10'd57 : tone = `NM24;
		10'd58 : tone = `NM23; //6-
		10'd59 : tone = `NM23;
		10'd60 : tone = `NM22; //+5-
		10'd61 : tone = `NM23;
		10'd62 : tone = `NM22; //7-
		10'd63 : tone = `NM21;
		10'd64 : tone = `NM22;//repeat
		10'd65 : tone = `NM22;
		10'd66 : tone = `NM22;
		10'd67 : tone = `NM22;
		10'd68 : tone = `NM21;
		10'd69 : tone = `NM21;
		10'd70 : tone = `NM19;
		10'd71 : tone = `NM19;
		//6
		10'd72 : tone = `NM17;
		10'd73 : tone = `NM17;
		10'd74 : tone = `NM17;
		10'd75 : tone = `NM17;
		10'd76 : tone = `NM19;
		10'd77 : tone = `NM19;
		10'd78 : tone = `NM15;
		10'd79 : tone = `NM15;
		10'd80 : tone = `NM17;
		10'd81 : tone = `NM17;
		10'd82 : tone = `NM17;
		10'd83 : tone = `NM17;	
		10'd84 : tone = `NM15;
		10'd85 : tone = `NM15;
		10'd86 : tone = `NM17;
		10'd87 : tone = `NM17;
		//7
		10'd88 : tone = `NM19;
		10'd89 : tone = `NM19;
		10'd90 : tone = `NM19;
		10'd91 : tone = `NM11;
		10'd92 : tone = `NM15;
		10'd93 : tone = `NM17;
		10'd94 : tone = `NM15;
		10'd95 : tone = `NM15;
		10'd96 : tone = `NM11;
		10'd97 : tone = `NM11;
		10'd98 : tone = `NM11;
		10'd99 : tone = `NM11;
		10'd100 : tone = `NM11;
		10'd101 : tone = `NM11;
		10'd102 : tone = `NM7;
		10'd103 : tone = `NM7;
		//8
		10'd104 : tone = `NM11;	//6-
		10'd105 : tone = `NM11;
		10'd106 : tone = `NM7; //7-
		10'd107 : tone = `NM11;
		10'd108 : tone = `NM15;	//1
		10'd109 : tone = `NM15;
		10'd110 : tone = `NM17; //2
		10'd111 : tone = `NM17;
		10'd112 : tone = `NM19;	//3
		10'd113 : tone = `NM19;
		10'd114 : tone = `NM17;
		10'd115 : tone = `NM17;
		10'd116 : tone = `NM7; //6
		10'd117 : tone = `NM7;
		10'd118 : tone = `NM7; //5
		10'd119 : tone = `NM7;
		//9
		10'd120 : tone = `NM11; //3
		10'd121 : tone = `NM11;
		10'd122 : tone = `NM11;
		10'd123 : tone = `NM11;
		10'd124 : tone = `NM11; //6-
		10'd125 : tone = `NM11;
		10'd126 : tone = `NM11;
		10'd127 : tone = `NM11;	
		
		default : tone = `NM0;
	endcase
end

endmodule