// *******************************
// lab_SPEAKER_TOP
//
// ********************************

module TOP (
	input clk,
	input rst,
	output pmod_1,
	output pmod_2,
	output pmod_4
);
parameter BEAT_FREQ = 32'd8;	//one beat=0.125sec
parameter DUTY_BEST = 10'd512;	//duty cycle=50%

wire [31:0] freq;
wire [31:0] freq_start;
wire [31:0] freq_game;
wire [31:0] freq_boss;
wire [31:0] freq_win;
wire [31:0] freq_lose;
wire [9:0] ibeatNum;
wire beatFreq;

assign pmod_2 = 1'd1;	//no gain(6dB)
assign pmod_4 = 1'd1;	//turn-on

//Generate beat speed
PWM_gen btSpeedGen ( .clk(clk), 
					 .rst(rst),
					 .freq(BEAT_FREQ),
					 .duty(DUTY_BEST), 
					 .PWM(beatFreq)
);
	
//manipulate beat
PlayerCtrl playerCtrl_00 ( .scene(scene),
						   .clk(beatFreq),
						   .rst(rst),
						   .ibeat(ibeatNum)
);	
	
//Generate variant freq. of tones
Music_start music00 ( .ibeatNum(ibeatNum),
					  .tone(freq_start)
);

Music_game music01 ( .ibeatNum(ibeatNum),
					 .tone(freq_game)
);

Music_boss music02 ( .ibeatNum(ibeatNum),
					 .tone(freq_boss)
);

Music_win music03 ( .ibeatNum(ibeatNum),
					.tone(freq_win)
);

Music_lose music04 ( .ibeatNum(ibeatNum),
					 .tone(freq_lose)
);

Mux mx1(
);

// Generate particular freq. signal
PWM_gen toneGen ( .clk(clk), 
				  .rst(rst), 
				  .freq(freq),
				  .duty(DUTY_BEST), 
				  .PWM(pmod_1)
);
endmodule