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
`define NM12 32'd554 //D+_freq 2+//降
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

`define NM0 32'd20000 //slience (over freq.)

module Music_win (
	input [9:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		10'd0 : tone = `NM5;
		10'd1 : tone = `NM5;
		10'd2 : tone = `NM5;
		10'd3 : tone = `NM5;
		//2
		10'd4 : tone = `NM11;
		10'd5 : tone = `NM11;
		10'd6 : tone = `NM11;
		10'd7 : tone = `NM7;
		10'd8 : tone = `NM7;
		10'd9 : tone = `NM11;
		10'd10 : tone = `NM11;
		10'd11 : tone = `NM11;
		10'd12 : tone = `NM15;
		10'd13 : tone = `NM15;
		10'd14 : tone = `NM15;
		10'd15 : tone = `NM15;
		10'd16 : tone = `NM15;
		10'd17 : tone = `NM15;
		10'd18 : tone = `NM15;
		10'd19 : tone = `NM15;
		//3
		10'd20 : tone = `NM11;
		10'd21 : tone = `NM11;
		10'd22 : tone = `NM7;
		10'd23 : tone = `NM7;
		10'd24 : tone = `NM11;
		10'd25 : tone = `NM11;
		10'd26 : tone = `NM15;
		10'd27 : tone = `NM15;
		10'd28 : tone = `NM15;
		10'd29 : tone = `NM15;
		10'd30 : tone = `NM17;
		10'd31 : tone = `NM17;
		10'd32 : tone = `NM11;
		10'd33 : tone = `NM11;
		10'd34 : tone = `NM7;
		10'd35 : tone = `NM7;
		//4
		10'd36 : tone = `NM11;
		10'd37 : tone = `NM11;
		10'd38 : tone = `NM7;
		10'd39 : tone = `NM7;
		10'd40 : tone = `NM11;
		10'd41 : tone = `NM11;
		10'd42 : tone = `NM15;
		10'd43 : tone = `NM15;
		10'd44 : tone = `NM15; //2
		10'd45 : tone = `NM15;
		10'd46 : tone = `NM15; //1
		10'd47 : tone = `NM15;
		10'd48 : tone = `NM15; //7-
		10'd49 : tone = `NM15;
		10'd50 : tone = `NM15; //6-
		10'd51 : tone = `NM15;
		//5
		10'd52 : tone = `NM11; //7-
		10'd53 : tone = `NM11;
		10'd54 : tone = `NM7; //1
		10'd55 : tone = `NM7;
		10'd56 : tone = `NM11; //7-
		10'd57 : tone = `NM11;
		10'd58 : tone = `NM19; //6-
		10'd59 : tone = `NM19;
		10'd60 : tone = `NM19; //+5-
		10'd61 : tone = `NM19;
		10'd62 : tone = `NM19; //7-
		10'd63 : tone = `NM19;
		10'd64 : tone = `NM17;
		10'd65 : tone = `NM17;
		10'd66 : tone = `NM17;
		10'd67 : tone = `NM17;
		//6
		10'd68 : tone = `NM11;
		10'd69 : tone = `NM11;
		10'd70 : tone = `NM7;
		10'd71 : tone = `NM7;
		10'd72 : tone = `NM11;
		10'd73 : tone = `NM11;
		10'd74 : tone = `NM15;
		10'd75 : tone = `NM15;
		10'd76 : tone = `NM15;
		10'd77 : tone = `NM15;
		10'd78 : tone = `NM15;
		10'd79 : tone = `NM15;
		10'd80 : tone = `NM15;
		10'd81 : tone = `NM15;
		10'd82 : tone = `NM15;
		10'd83 : tone = `NM15;
		//7
		10'd84 : tone = `NM11;
		10'd85 : tone = `NM11;
		10'd86 : tone = `NM7;
		10'd87 : tone = `NM7;
		10'd88 : tone = `NM11;
		10'd89 : tone = `NM11;
		10'd90 : tone = `NM15;
		10'd91 : tone = `NM15;
		10'd92 : tone = `NM15;
		10'd93 : tone = `NM15;
		10'd94 : tone = `NM17;
		10'd95 : tone = `NM17;
		10'd96 : tone = `NM11;
		10'd97 : tone = `NM11;
		10'd98 : tone = `NM7;
		10'd99 : tone = `NM7;
		//8
		10'd100 : tone = `NM11;
		10'd101 : tone = `NM11;
		10'd102 : tone = `NM7;
		10'd103 : tone = `NM7;
		10'd104 : tone = `NM11;
		10'd105 : tone = `NM11;
		10'd106 : tone = `NM15;
		10'd107 : tone = `NM15;
		10'd108 : tone = `NM15;
		10'd109 : tone = `NM15;
		10'd110 : tone = `NM15;
		10'd111 : tone = `NM15;
		10'd112 : tone = `NM15;
		10'd113 : tone = `NM15;
		10'd114 : tone = `NM15;
		10'd115 : tone = `NM15;
		//9
		10'd116 : tone = `NM11;
		10'd117 : tone = `NM11;
		10'd118 : tone = `NM7;
		10'd119 : tone = `NM7;
		10'd120 : tone = `NM11;
		10'd121 : tone = `NM11;
		10'd122 : tone = `NM19;
		10'd123 : tone = `NM19;
		10'd124 : tone = `NM19;
		10'd125 : tone = `NM19;
		10'd126 : tone = `NM19;
		10'd127 : tone = `NM19;
		10'd128 : tone = `NM6;	//6-
		10'd129 : tone = `NM7;	
		10'd130 : tone = `NM12; //7-
		10'd131 : tone = `NM15;
		//10
		10'd132 : tone = `NM15;
		10'd133 : tone = `NM15;
		10'd134 : tone = `NM12;
		10'd135 : tone = `NM12;
		10'd136 : tone = `NM15;
		10'd137 : tone = `NM15;
		10'd138 : tone = `NM19;
		10'd139 : tone = `NM19;
		10'd140 : tone = `NM19;
		10'd141 : tone = `NM19;
		10'd142 : tone = `NM17;
		10'd143 : tone = `NM19;
		10'd144 : tone = `NM17;
		10'd145 : tone = `NM12;
		10'd146 : tone = `NM7;
		10'd147 : tone = `NM7;
		//11
		10'd148 : tone = `NM15;
		10'd149 : tone = `NM15;
		10'd150 : tone = `NM15;
		10'd151 : tone = `NM15;
		10'd152 : tone = `NM15;
		10'd153 : tone = `NM15;
		10'd154 : tone = `NM15;
		10'd155 : tone = `NM15;
		10'd156 : tone = `NM3;
		10'd157 : tone = `NM3;
		10'd158 : tone = `NM4;
		10'd159 : tone = `NM4;
		10'd160 : tone = `NM5;
		10'd161 : tone = `NM5;
		10'd162 : tone = `NM6;
		10'd163 : tone = `NM6;
		//12
		10'd167 : tone = `NM7;
		10'd168 : tone = `NM7;
		10'd169 : tone = `NM7;
		10'd170 : tone = `NM7;
		10'd171 : tone = `NM7;
		10'd172 : tone = `NM7;
		10'd173 : tone = `NM7;
		10'd174 : tone = `NM7;
		10'd175 : tone = `NM5;
		10'd176 : tone = `NM5;
		10'd177 : tone = `NM7;
		10'd178 : tone = `NM7;
		10'd179 : tone = `NM5;
		10'd180 : tone = `NM5;
		10'd181 : tone = `NM4;
		10'd182 : tone = `NM4;
		//13
		10'd183 : tone = `NM3;
		10'd184 : tone = `NM3;
		10'd185 : tone = `NM3;
		10'd186 : tone = `NM3; //6-
		10'd187 : tone = `NM3;
		10'd188 : tone = `NM3; //+5-
		10'd189 : tone = `NM3;
		10'd190 : tone = `NM3; //7-
		10'd191 : tone = `NM3;
		10'd192 : tone = `NM3;//repeat
		10'd193 : tone = `NM3;
		10'd194 : tone = `NM3;
		10'd195 : tone = `NM5;
		10'd196 : tone = `NM5;
		10'd197 : tone = `NM7;
		10'd198 : tone = `NM7;
		//14
		10'd199 : tone = `NM15;
		10'd200 : tone = `NM15;
		10'd201 : tone = `NM15;
		10'd202 : tone = `NM15;
		10'd203 : tone = `NM15;
		10'd204 : tone = `NM15;
		10'd205 : tone = `NM15;
		10'd206 : tone = `NM15;
		10'd207 : tone = `NM12;
		10'd208 : tone = `NM12;
		10'd209 : tone = `NM15;
		10'd210 : tone = `NM15;
		10'd211 : tone = `NM12;
		10'd212 : tone = `NM12;
		10'd213 : tone = `NM6;
		10'd214 : tone = `NM6;
		//15
		10'd215 : tone = `NM7;
		10'd216 : tone = `NM7;
		10'd217 : tone = `NM7;
		10'd218 : tone = `NM7;
		10'd219 : tone = `NM7;
		10'd220 : tone = `NM7;
		10'd221 : tone = `NM7;
		10'd222 : tone = `NM7;
		10'd223 : tone = `NM7;
		10'd224 : tone = `NM7;
		10'd225 : tone = `NM7;
		10'd226 : tone = `NM7;
		10'd227 : tone = `NM17;
		10'd228 : tone = `NM17;
		10'd229 : tone = `NM17;
		10'd230 : tone = `NM17;
		//16
		10'd231 : tone = `NM18;
		10'd232 : tone = `NM18;
		10'd233 : tone = `NM18;
		10'd234 : tone = `NM18;
		10'd235 : tone = `NM18;
		10'd236 : tone = `NM18;
		10'd237 : tone = `NM19;
		10'd238 : tone = `NM19;
		10'd239 : tone = `NM17;
		10'd240 : tone = `NM17;
		10'd241 : tone = `NM19;
		10'd242 : tone = `NM19;
		10'd243 : tone = `NM21;
		10'd244 : tone = `NM21;
		10'd245 : tone = `NM17;
		10'd246 : tone = `NM17;
		//17
		10'd247 : tone = `NM20;
		10'd248 : tone = `NM20;
		10'd249 : tone = `NM15;
		10'd250 : tone = `NM15;
		10'd251 : tone = `NM11;
		10'd252 : tone = `NM11;
		10'd253 : tone = `NM20;
		10'd254 : tone = `NM20;
		10'd255 : tone = `NM15;		
		10'd256 : tone = `NM15;
		10'd257 : tone = `NM11;
		10'd258 : tone = `NM11;
		10'd259 : tone = `NM17;
		10'd260 : tone = `NM17;
		10'd261 : tone = `NM17;
		10'd262 : tone = `NM17;
		//18
		10'd263 : tone = `NM18;
		10'd264 : tone = `NM18;
		10'd265 : tone = `NM15;
		10'd266 : tone = `NM15;
		10'd267 : tone = `NM7;
		10'd268 : tone = `NM7;
		10'd269 : tone = `NM19;
		10'd270 : tone = `NM19;
		10'd271 : tone = `NM17;
		10'd272 : tone = `NM17;
		10'd273 : tone = `NM12;
		10'd274 : tone = `NM12;
		10'd275 : tone = `NM6;
		10'd276 : tone = `NM6;
		10'd277 : tone = `NM17;
		10'd278 : tone = `NM17;
		//19
		10'd279 : tone = `NM17;
		10'd280 : tone = `NM17;
		10'd281 : tone = `NM17;
		10'd282 : tone = `NM17;
		10'd283 : tone = `NM17;
		10'd284 : tone = `NM17;
		10'd285 : tone = `NM15;
		10'd286 : tone = `NM15;
		10'd287 : tone = `NM15;
		10'd288 : tone = `NM15;
		10'd289 : tone = `NM0;
		10'd290 : tone = `NM0;
		10'd291 : tone = `NM0;
		10'd292 : tone = `NM0;
		10'd293 : tone = `NM0;
		10'd294 : tone = `NM0;
		10'd295 : tone = `NM0;
		10'd296 : tone = `NM0;
		
		default : tone = `NM0;
	endcase
end

endmodule