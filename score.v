module score(
	input rst,
	input clk22,
	input shot_reimu,
	input shot_enm,
	input shot_boss,
	input gamestart,
	input [6:0]enmhp1,
	input [6:0]enmhp2,
	input [6:0]enmhp3,
	input [6:0]enmhp4,
	input [9:0]bosshp,
	output reg [3:0]score0,//個
	output reg [3:0]score1,//十
	output reg [3:0]score2,//百
	output reg [3:0]score3 //千
	);
	
	wire count0, count1, count2, count3;
	
	assign count0 = (score0 > 4'b1001);
	assign count1 = (score1 > 4'b1001);
	assign count2 = (score2 > 4'b1001);
	assign count3 = (score3 > 4'b1001);
	
	reg [3:0] nt_score0;
	reg [3:0] nt_score1;
	reg [3:0] nt_score2;
	reg [3:0] nt_score3;
	reg [3:0] enm;
	reg [3:0] nt_enm;
	reg boss, nt_boss;
	
	always@(posedge clk22)
	begin
		if(rst||gamestart)
		begin
		    enm <= 4'b0000;
			boss <= 1'b0;
			score0 <= 4'b0000;
			score1 <= 4'b0000;
			score2 <= 4'b0000;
			score3 <= 4'b0000;
		end
		else
		begin
		    enm <= nt_enm;
			boss <= nt_boss;
			score0 <= nt_score0;
			score1 <= nt_score1;
			score2 <= nt_score2;
			score3 <= nt_score3;
		end
	end

    always@(*)//
    begin
        if(enmhp1 == 7'd0)
        begin
            nt_enm[0] = 1'b1;
        end
        else
        begin
            nt_enm[0] = 1'b0;
        end
        if(enmhp2 == 7'd0)
        begin
            nt_enm[1] = 1'b1;
        end
        else
        begin
            nt_enm[1] = 1'b0;
        end
        if(enmhp3 == 7'd0)
        begin
            nt_enm[2] = 1'b1;
        end
        else
        begin
            nt_enm[2] = 1'b0;
        end
        if(enmhp4 == 7'd0)
        begin
            nt_enm[3] = 1'b1;
        end
        else
        begin
            nt_enm[3] = 1'b0;
        end
		
		if(bosshp == 10'd0)
		begin
			nt_boss = 1'b1;
		end
		else
		begin
			nt_boss = 1'b0;
		end
    end

	always@(*)//score
	begin
		if(shot_enm)//shot enemy, socre + 1
		begin
			nt_score0 = score0 + 4'b0001;
		end
		else if(shot_boss)//shot boss, socre + 2
		begin
			nt_score0 = score0 + 4'b0010;
		end
		else if(shot_reimu)
		begin
		    nt_score0 = 4'b0000;
		end
		else if(count0)//進位
		begin
			nt_score0 = score0 - 4'b1010;
		end
		else
		begin
		    nt_score0 = score0;
		end
		
		if(shot_reimu)
		begin
		    nt_score1 = 4'b0000;
		end
		else if(count0)
		begin
		    nt_score1 = score1 + 4'b0001;
		end
		else if(count1)
		begin
		    nt_score1 = score1 - 4'b1010;
		end
		else
		begin
		    nt_score1 = score1;
		end
		
		if((enmhp1 == 7'd0 && !enm[0]) || (enmhp2 == 7'd0 && !enm[1]) || (enmhp3 == 7'd0 && !enm[2]) || (enmhp4 == 7'd0 && !enm[3]))
		begin
			nt_score2 = score2 + 4'b0001;
		end
		else if(count1)
		begin
		    nt_score2 = score2 + 4'b0001;
		end
		else if(count2)
		begin
		    nt_score2 = score2 - 4'b1010;
		end
		else
		begin
		    nt_score2 = score2;
		end
		
		
		if(bosshp == 10'd0 && !boss)//boss die, socre + 1000
		begin
			nt_score3 = score3 + 4'b0001;
		end
		else if(count2)
		begin
		   nt_score3 = score3 + 4'b0001;
		end
		else if(count3)
		begin
		   nt_score3 = 4'b1001;
		end
		else
		begin
			nt_score3 = score3;
	    end
	 end
endmodule
