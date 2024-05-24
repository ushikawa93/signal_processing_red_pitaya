
module FIR_filter (

	input clk,
	input reset_n,
	input enable,
	input bypass,
	
	input [15:0] coef_0,
	input [15:0] coef_1,
	input [15:0] coef_2,
	input [15:0] coef_3,
	input [15:0] coef_4,
	input [15:0] coef_5,
	input [15:0] coef_6,
	input [15:0] coef_7,
	input [15:0] coef_8,
	input [15:0] coef_9,
	input [15:0] coef_10,
	input [15:0] coef_11,
	input [15:0] coef_12,
	input [15:0] coef_13,
	input [15:0] coef_14,
	input [15:0] coef_15,
	input [15:0] coef_16,
	input [15:0] coef_17,
	input [15:0] coef_18,
	input [15:0] coef_19,
	input [15:0] coef_20,
	input [15:0] coef_21,
	input [15:0] coef_22,
	input [15:0] coef_23,
	input [15:0] coef_24,
	input [15:0] coef_25,
	input [15:0] coef_26,
	input [15:0] coef_27,
	input [15:0] coef_28,
	input [15:0] coef_29,
	input [15:0] coef_30,
	input [15:0] coef_31,
	input [15:0] coef_32,

	input signed [13:0] data_in,
	input data_in_valid,
	
	output signed [31:0] data_out,
	output data_out_valid


);

parameter N = 32;

reg signed [15:0] coef [0:N];
reg signed [13:0] x [0:N]; 
reg signed [31:0] y_reg [0:N];
integer i;
reg data_valid_reg;

reg signed [31:0] y,y_0,y_1,y_2,y_3,y_4,y_5,y_6;

always @ (posedge clk)
begin

	if (!reset_n)
	begin
	
		for (i = 0; i<= N; i = i+1)
		begin
			x[i]=0;		
		end
		
		coef[0] <= coef_0;
		coef[1] <= coef_1;
		coef[2] <= coef_2;
		coef[3] <= coef_3;
		coef[4] <= coef_4;
		coef[5] <= coef_5;
		coef[6] <= coef_6;
		coef[7] <= coef_7;
		coef[8] <= coef_8;		
		coef[9] <= coef_9;
		
		coef[10] <= coef_10;
		coef[11] <= coef_11;
		coef[12] <= coef_12;
		coef[13] <= coef_13;
		coef[14] <= coef_14;
		coef[15] <= coef_15;
		coef[16] <= coef_16;
		coef[17] <= coef_17;		
		coef[18] <= coef_18;
		coef[19] <= coef_19;
		
		coef[20] <= coef_20;
		coef[21] <= coef_21;
		coef[22] <= coef_22;
		coef[23] <= coef_23;
		coef[24] <= coef_24;
		coef[25] <= coef_25;
		coef[26] <= coef_26;
		coef[27] <= coef_27;
		coef[28] <= coef_28;
		coef[29] <= coef_29;
		
		coef[30] <= coef_30;
		coef[31] <= coef_31;
		coef[32] <= coef_32;
		
		y <= 0;

		data_valid_reg <= 0;
		
		
			
	end
	
	else if (enable)
	begin 
		
		if(data_in_valid)
		begin
		
		    x[0] <= data_in;
            x[1] <= x[0];
            x[2] <= x[1];
            x[3] <= x[2];
            x[4] <= x[3];
            x[5] <= x[4];
            x[6] <= x[5];
            x[7] <= x[6];
            x[8] <= x[7];
            x[9] <= x[8];
            x[10] <= x[9];
            x[11] <= x[10];
            x[12] <= x[11];
            x[13] <= x[12];
            x[14] <= x[13];
            x[15] <= x[14];
            x[16] <= x[15];
            x[17] <= x[16];
            x[18] <= x[17];
            x[19] <= x[18];
            x[20] <= x[19];
            x[21] <= x[20];
            x[22] <= x[21];
            x[23] <= x[22];
            x[24] <= x[23];
            x[25] <= x[24];
            x[26] <= x[25];
            x[27] <= x[26];
            x[28] <= x[27];
            x[29] <= x[28];
            x[30] <= x[29];
            x[31] <= x[30];
            x[32] <= x[31];

            y_reg[0] <= coef[0] * x[0];
            y_reg[1] <= coef[1] * x[1];
            y_reg[2] <= coef[2] * x[2];
            y_reg[3] <= coef[3] * x[3];
            y_reg[4] <= coef[4] * x[4];
            y_reg[5] <= coef[5] * x[5];
            y_reg[6] <= coef[6] * x[6];
            y_reg[7] <= coef[7] * x[7];
            y_reg[8] <= coef[8] * x[8];
            y_reg[9] <= coef[9] * x[9];
            y_reg[10] <= coef[10] * x[10];
            y_reg[11] <= coef[11] * x[11];
            y_reg[12] <= coef[12] * x[12];
            y_reg[13] <= coef[13] * x[13];
            y_reg[14] <= coef[14] * x[14];
            y_reg[15] <= coef[15] * x[15];
            y_reg[16] <= coef[16] * x[16];
            y_reg[17] <= coef[17] * x[17];
            y_reg[18] <= coef[18] * x[18];
            y_reg[19] <= coef[19] * x[19];
            y_reg[20] <= coef[20] * x[20];
            y_reg[21] <= coef[21] * x[21];
            y_reg[22] <= coef[22] * x[22];
            y_reg[23] <= coef[23] * x[23];
            y_reg[24] <= coef[24] * x[24];
            y_reg[25] <= coef[25] * x[25];
            y_reg[26] <= coef[26] * x[26];
            y_reg[27] <= coef[27] * x[27];
            y_reg[28] <= coef[28] * x[28];
            y_reg[29] <= coef[29] * x[29];
            y_reg[30] <= coef[30] * x[30];
            y_reg[31] <= coef[31] * x[31];
            y_reg[32] <= coef[32] * x[32];
        
            y_0 <= y_reg[0] + y_reg[1] + y_reg[2] + y_reg[3] + y_reg[4];
            y_1 <= y_reg[5] + y_reg[6] + y_reg[7] + y_reg[8] + y_reg[9];
            y_2 <= y_reg[10] + y_reg[11] + y_reg[12] + y_reg[13] + y_reg[14];
            y_3 <= y_reg[15] + y_reg[16] + y_reg[17] + y_reg[18] + y_reg[19];
            y_4 <= y_reg[20] + y_reg[21] + y_reg[22] + y_reg[23] + y_reg[24];
            y_5 <= y_reg[25] + y_reg[26] + y_reg[27] + y_reg[28] + y_reg[29];
            y_6 <= y_reg[30] + y_reg[31] + y_reg[32];
            
            y <= y_0 + y_1 + y_2 + y_3 + y_4 +y_5 + y_6;

/*
			x[0] <= data_in;
			x[1] <= x[0];
			x[2] <= x[1];
			x[3] <= x[2];
			x[4] <= x[3];
			
			y_reg[0] <= coef[0] * x[0];
			y_reg[1] <= coef[1] * x[1];
			y_reg[2] <= coef[2] * x[2];
			y_reg[3] <= coef[3] * x[3];
			y_reg[4] <= coef[4] * x[4];
			
			y <= y_reg[0] + y_reg[1] + y_reg[2] + y_reg[3] + y_reg[4];
		
		*/
		/*
			for (i = 0; i< N; i = i+1)
			begin
				x[i+1] <= x[i];					
				y_reg[i] <= coef[i] * x[i];
			end
			y_reg[N] <= coef[N] * x[N];
		
			y = y_reg[0] + y_reg[1] + y_reg[2] + y_reg[3] + y_reg[4] + y_reg[5] + y_reg[6] + y_reg[7] + 
                y_reg[8] + y_reg[9] + y_reg[10] + y_reg[11] + y_reg[12] + y_reg[13] + y_reg[14] + y_reg[15] +
                y_reg[16] + y_reg[17] + y_reg[18] + y_reg[19] + y_reg[20] + y_reg[21] + y_reg[22] + y_reg[23] +
                y_reg[24] + y_reg[25] + y_reg[26] + y_reg[27] + y_reg[28] + y_reg[29] + y_reg[30] + y_reg[31] + y_reg[32];
        */
			data_valid_reg <= 1;
		
		end
		else
			data_valid_reg <= 0;
	end

end


assign data_out = (bypass == 0) ?  y >>> 16 : data_in; 
assign data_out_valid = (bypass == 0) ? data_valid_reg : data_in_valid;


endmodule