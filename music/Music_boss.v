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

module Music_boss (
	input [9:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		10'd0 : tone = `NM11;
		10'd1 : tone = `NM6;
		10'd2 : tone = `NM3;
		10'd3 : tone = `NM11;
		10'd4 : tone = `NM6;
		10'd5 : tone = `NM3;
		10'd6 : tone = `NM11;
		10'd7 : tone = `NM6;
		10'd8 : tone = `NM3;
		10'd9 : tone = `NM11;
		10'd10 : tone = `NM6;
		10'd11 : tone = `NM3;
		
		10'd12 : tone = `NM7;
		10'd13 : tone = `NM7;
		10'd14 : tone = `NM7;
		10'd15 : tone = `NM0;
		10'd16 : tone = `NM7;
		10'd17 : tone = `NM7;
		10'd18 : tone = `NM7;
		10'd19 : tone = `NM0;
		10'd20 : tone = `NM7;
		10'd21 : tone = `NM7;
		10'd22 : tone = `NM7;
		10'd23 : tone = `NM0;
		
		10'd24 : tone = `NM11;
		10'd25 : tone = `NM6;
		10'd26 : tone = `NM3;
		10'd27 : tone = `NM11;
		10'd28 : tone = `NM6;
		10'd29 : tone = `NM3;
		10'd30 : tone = `NM11;
		10'd31 : tone = `NM6;
		10'd32 : tone = `NM3;
		10'd33 : tone = `NM11;
		10'd34 : tone = `NM6;
		10'd35 : tone = `NM3;
		
		10'd36 : tone = `NM12; //1
		10'd37 : tone = `NM12;
		10'd38 : tone = `NM12; //2
		10'd39 : tone = `NM0;
		10'd40 : tone = `NM12; //3
		10'd41 : tone = `NM12;
		10'd42 : tone = `NM12;
		10'd43 : tone = `NM0;
		10'd44 : tone = `NM12; //2
		10'd45 : tone = `NM12;
		10'd46 : tone = `NM12; //1
		10'd47 : tone = `NM0;
		
		10'd48 : tone = `NM11; //7-
		10'd49 : tone = `NM6;
		10'd50 : tone = `NM3; //6-
		10'd51 : tone = `NM11;
		10'd52 : tone = `NM6; //7-
		10'd53 : tone = `NM3;
		10'd54 : tone = `NM11; //1
		10'd55 : tone = `NM6;
		10'd56 : tone = `NM3; //7-
		10'd57 : tone = `NM11;
		10'd58 : tone = `NM6; //6-
		10'd59 : tone = `NM3;
		
		10'd60 : tone = `NM7; //+5-
		10'd61 : tone = `NM7;
		10'd62 : tone = `NM7; //7-
		10'd63 : tone = `NM0;
		10'd64 : tone = `NM7;//repeat
		10'd65 : tone = `NM7;
		10'd66 : tone = `NM7;
		10'd67 : tone = `NM0;
		10'd68 : tone = `NM7;
		10'd69 : tone = `NM7;
		10'd70 : tone = `NM7;
		10'd71 : tone = `NM0;
		
		10'd72 : tone = `NM11;
		10'd73 : tone = `NM6;
		10'd74 : tone = `NM3;
		10'd75 : tone = `NM11;
		10'd76 : tone = `NM6;
		10'd77 : tone = `NM3;
		10'd78 : tone = `NM11;
		10'd79 : tone = `NM6;
		10'd80 : tone = `NM3;
		10'd81 : tone = `NM11;
		10'd82 : tone = `NM6;
		10'd83 : tone = `NM3;
		
		10'd84 : tone = `NM12;
		10'd85 : tone = `NM12;
		10'd86 : tone = `NM12;
		10'd87 : tone = `NM0;
		10'd88 : tone = `NM12;
		10'd89 : tone = `NM12;
		10'd90 : tone = `NM12;
		10'd91 : tone = `NM0;
		10'd92 : tone = `NM12;
		10'd93 : tone = `NM12;
		10'd94 : tone = `NM12;
		10'd95 : tone = `NM0;
		//ÔøΩÔè≠??áÔøΩ
		10'd96 : tone = `NM6;
		10'd97 : tone = `NM6;
		10'd98 : tone = `NM0;
		10'd99 : tone = `NM0;
		10'd100 : tone = `NM15;
		10'd101 : tone = `NM15;
		10'd102 : tone = `NM0;
		10'd103 : tone = `NM0;
		10'd104 : tone = `NM7;	//6-
		10'd105 : tone = `NM7;
		10'd106 : tone = `NM0; //7-
		10'd107 : tone = `NM0;
		10'd108 : tone = `NM15;	//1
		10'd109 : tone = `NM15;
		10'd110 : tone = `NM0; //2
		10'd111 : tone = `NM0;
		
		10'd112 : tone = `NM11;	//3
		10'd113 : tone = `NM11;
		10'd114 : tone = `NM11;
		10'd115 : tone = `NM11;
		10'd116 : tone = `NM12; //6
		10'd117 : tone = `NM12;
		10'd118 : tone = `NM15; //5
		10'd119 : tone = `NM15;
		10'd120 : tone = `NM12; //3
		10'd121 : tone = `NM12;
		10'd122 : tone = `NM12;
		10'd123 : tone = `NM12;
		10'd124 : tone = `NM19; //6-
		10'd125 : tone = `NM19;
		10'd126 : tone = `NM19;
		10'd127 : tone = `NM19;
	
		10'd128 : tone = `NM20; //3
		10'd129 : tone = `NM20;
		10'd130 : tone = `NM15; //2
		10'd131 : tone = `NM15;
		10'd132 : tone = `NM21; //1
		10'd133 : tone = `NM21;
		10'd134 : tone = `NM22; //7-
		10'd135 : tone = `NM22;
		10'd136 : tone = `NM21; //6-
		10'd137 : tone = `NM21;
		10'd138 : tone = `NM22; //7-
		10'd139 : tone = `NM21;
		10'd140 : tone = `NM20; //1
		10'd141 : tone = `NM20;
		10'd142 : tone = `NM19; //2
		10'd143 : tone = `NM19;
		//
		10'd144 : tone = `NM15; //3
		10'd145 : tone = `NM15;
		10'd146 : tone = `NM19;
		10'd147 : tone = `NM19;
		10'd148 : tone = `NM12; //2
		10'd149 : tone = `NM12;
		10'd150 : tone = `NM15; //1
		10'd151 : tone = `NM15;
		10'd152 : tone = `NM11; //7-
		10'd153 : tone = `NM11;
		10'd154 : tone = `NM11; //6-
		10'd155 : tone = `NM11;
		10'd156 : tone = `NM11; //7-
		10'd157 : tone = `NM11;
		10'd158 : tone = `NM11; //1
		10'd159 : tone = `NM11;
	
		10'd160 : tone = `NM6; //7-
		10'd161 : tone = `NM6;
		10'd162 : tone = `NM0; //6-
		10'd163 : tone = `NM0;
		10'd164 : tone = `NM15; //+5-
		10'd165 : tone = `NM15;
		10'd166 : tone = `NM0; //7-
		10'd167 : tone = `NM0;
		10'd168 : tone = `NM7;//6+
		10'd169 : tone = `NM7;
		10'd170 : tone = `NM0;//3+
		10'd171 : tone = `NM0;//7+
		10'd172 : tone = `NM15;
		10'd173 : tone = `NM15;//1++
		10'd174 : tone = `NM0;
		10'd175 : tone = `NM0;
			
		10'd176 : tone = `NM11;
		10'd177 : tone = `NM11;
		10'd178 : tone = `NM11;
		10'd179 : tone = `NM11;
		10'd180 : tone = `NM12;
		10'd181 : tone = `NM12;
		10'd182 : tone = `NM15;
		10'd183 : tone = `NM15;
		10'd184 : tone = `NM12;
		10'd185 : tone = `NM12;
		10'd186 : tone = `NM12;
		10'd187 : tone = `NM12;
		10'd188 : tone = `NM19;
		10'd189 : tone = `NM19;
		10'd190 : tone = `NM19;
		10'd191 : tone = `NM19;
		
		10'd192 : tone = `NM20;
		10'd193 : tone = `NM20;
		10'd194 : tone = `NM15;
		10'd195 : tone = `NM15;
		10'd196 : tone = `NM21;
		10'd197 : tone = `NM21;
		10'd198 : tone = `NM22;
		10'd199 : tone = `NM22;
		10'd200 : tone = `NM21;
		10'd201 : tone = `NM21;
		10'd202 : tone = `NM22;
		10'd203 : tone = `NM21;
		10'd204 : tone = `NM20;
		10'd205 : tone = `NM20;
		10'd206 : tone = `NM19;
		10'd207 : tone = `NM19;
	
		10'd208 : tone = `NM20;
		10'd209 : tone = `NM20;
		10'd210 : tone = `NM20;
		10'd211 : tone = `NM20;
		10'd212 : tone = `NM20;
		10'd213 : tone = `NM20;
		10'd214 : tone = `NM20;
		10'd215 : tone = `NM20;
		10'd216 : tone = `NM20;
		10'd217 : tone = `NM20;
		10'd218 : tone = `NM20;
		10'd219 : tone = `NM20;
		10'd220 : tone = `NM20;
		10'd221 : tone = `NM20;
		10'd222 : tone = `NM20;
		10'd223 : tone = `NM20;
		//repeat
		10'd224 : tone = `NM6;
		10'd225 : tone = `NM6;
		10'd226 : tone = `NM0;
		10'd227 : tone = `NM0;
		10'd228 : tone = `NM15;
		10'd229 : tone = `NM15;
		10'd230 : tone = `NM0;
		10'd231 : tone = `NM0;
		10'd232 : tone = `NM7;	//6-
		10'd233 : tone = `NM7;
		10'd234 : tone = `NM0; //7-
		10'd235 : tone = `NM0;
		10'd236 : tone = `NM15;	//1
		10'd237 : tone = `NM15;
		10'd238 : tone = `NM0; //2
		10'd239 : tone = `NM0;
		
		10'd240 : tone = `NM11;	//3
		10'd241 : tone = `NM11;
		10'd242 : tone = `NM11;
		10'd243 : tone = `NM11;
		10'd244 : tone = `NM12; //6
		10'd245 : tone = `NM12;
		10'd246 : tone = `NM15; //5
		10'd247 : tone = `NM15;
		10'd248 : tone = `NM12; //3
		10'd249 : tone = `NM12;
		10'd250 : tone = `NM12;
		10'd251 : tone = `NM12;
		10'd252 : tone = `NM19; //6-
		10'd253 : tone = `NM19;
		10'd254 : tone = `NM19;
		10'd255 : tone = `NM19;
		
		10'd256 : tone = `NM20; //3
		10'd257 : tone = `NM20;
		10'd258 : tone = `NM15; //2
		10'd259 : tone = `NM15;
		10'd260 : tone = `NM21; //1
		10'd261 : tone = `NM21;
		10'd262 : tone = `NM22; //7-
		10'd263 : tone = `NM22;
		10'd264 : tone = `NM21; //6-
		10'd265 : tone = `NM21;
		10'd266 : tone = `NM22; //7-
		10'd267 : tone = `NM21;
		10'd268 : tone = `NM20; //1
		10'd269 : tone = `NM20;
		10'd270 : tone = `NM19; //2
		10'd271 : tone = `NM19;

		10'd272 : tone = `NM15; //3
		10'd273 : tone = `NM15;
		10'd274 : tone = `NM19;
		10'd275 : tone = `NM19;
		10'd276 : tone = `NM12; //2
		10'd277 : tone = `NM12;
		10'd278 : tone = `NM15; //1
		10'd279 : tone = `NM15;
		10'd280 : tone = `NM11; //7-
		10'd281 : tone = `NM11;
		10'd282 : tone = `NM11; //6-
		10'd283 : tone = `NM11;
		10'd284 : tone = `NM11; //7-
		10'd285 : tone = `NM11;
		10'd286 : tone = `NM11; //1
		10'd287 : tone = `NM11;
	
		10'd288 : tone = `NM6; //7-
		10'd289 : tone = `NM6;
		10'd290 : tone = `NM0; //6-
		10'd291 : tone = `NM0;
		10'd292 : tone = `NM15; //+5-
		10'd293 : tone = `NM15;
		10'd294 : tone = `NM0; //7-
		10'd295 : tone = `NM0;
		10'd296 : tone = `NM7;//6+
		10'd297 : tone = `NM7;
		10'd298 : tone = `NM0;//3+
		10'd299 : tone = `NM0;//7+
		10'd300 : tone = `NM15;
		10'd301 : tone = `NM15;//1++
		10'd302 : tone = `NM0;
		10'd303 : tone = `NM0;
		
		10'd304 : tone = `NM11;
		10'd305 : tone = `NM11;
		10'd306 : tone = `NM11;
		10'd307 : tone = `NM11;
		10'd308 : tone = `NM12;
		10'd309 : tone = `NM12;
		10'd310 : tone = `NM15;
		10'd311 : tone = `NM15;
		10'd312 : tone = `NM12;
		10'd313 : tone = `NM12;
		10'd314 : tone = `NM12;
		10'd315 : tone = `NM12;
		10'd316 : tone = `NM19;
		10'd317 : tone = `NM19;
		10'd318 : tone = `NM19;
		10'd319 : tone = `NM19;
	
		10'd320 : tone = `NM20;
		10'd321 : tone = `NM20;
		10'd322 : tone = `NM15;
		10'd323 : tone = `NM15;
		10'd324 : tone = `NM21;
		10'd325 : tone = `NM21;
		10'd326 : tone = `NM22;
		10'd327 : tone = `NM22;
		10'd328 : tone = `NM21;
		10'd329 : tone = `NM21;
		10'd330 : tone = `NM22;
		10'd331 : tone = `NM21;
		10'd332 : tone = `NM20;
		10'd333 : tone = `NM20;
		10'd334 : tone = `NM19;
		10'd335 : tone = `NM19;
		
		10'd336 : tone = `NM20;
		10'd337 : tone = `NM20;
		10'd338 : tone = `NM20;
		10'd339 : tone = `NM20;
		10'd340 : tone = `NM20;
		10'd341 : tone = `NM20;
		10'd342 : tone = `NM20;
		10'd343 : tone = `NM20;
		10'd344 : tone = `NM20;
		10'd345 : tone = `NM20;
		10'd346 : tone = `NM20;
		10'd347 : tone = `NM20;
		10'd348 : tone = `NM20;
		10'd349 : tone = `NM20;
		10'd350 : tone = `NM20;
		10'd351 : tone = `NM20;
	
		default : tone = `NM0;
	endcase
end

endmodule