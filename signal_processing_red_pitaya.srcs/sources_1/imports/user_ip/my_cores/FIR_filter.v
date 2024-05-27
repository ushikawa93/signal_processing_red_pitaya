
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
integer i,j;
reg data_valid_reg;

reg signed [31:0] y_0,y_1,y_2,y_3,y_4,y_5,y_6,y_7,y_8,y_9,y_10,y_11,y_12,y_13,y_14,y_15,y_16;
reg signed [31:0] y,y_int_0,y_int_1,y_int_2,y_int_3,y_int_4,y_int_5;
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
		  for (i = 0; i< N; i = i+1)
		  begin
			x[i+1] <= x[i];					
			y_reg[i] <= coef[i] * x[i];
		  end
		  y_reg[N] <= coef[N] * x[N];
		  
	  
		  y_0 <= y_reg[0] + y_reg[1];  
          y_1 <= y_reg[2] + y_reg[3]; 
          y_2 <= y_reg[4] + y_reg[5];          
          y_3 <= y_reg[6] + y_reg[7];        
                    
          y_4 <= y_reg[8] + y_reg[9];
          y_5 <= y_reg[10] + y_reg[11];
          y_6 <= y_reg[12] + y_reg[13];
          y_7 <= y_reg[14] + y_reg[15];
            
          y_8 <= y_reg[16] + y_reg[17];
          y_9 <= y_reg[18] + y_reg[19];  
          y_10 <= y_reg[20] + y_reg[21];
          y_11 <= y_reg[22] + y_reg[23];
                
          y_12 <= y_reg[24] + y_reg[25];  
          y_13 <= y_reg[26] + y_reg[27];
          y_14 <= y_reg[28] + y_reg[29];
          y_15 <= y_reg[30] + y_reg[31];
          y_16 <= y_reg[32];
          
          y_int_0 <= y_0 + y_1 + y_2 + y_3;
          y_int_1 <= y_4 + y_5 + y_6 + y_7;
          y_int_2 <= y_8 + y_9 + y_10 + y_11;
          y_int_3 <= y_12 + y_13 + y_14 + y_15 + y_16;
                    
          
          y_int_4 <= y_int_0 + y_int_1;          
          y_int_5 <= y_int_2 + y_int_3;
		           
          y <= y_int_4 + y_int_5;
        
		  data_valid_reg <= 1;
		
		end
		else
		  data_valid_reg <= 0;
	end

end


assign data_out = (bypass == 0) ?  y >>> 16 : data_in; 
assign data_out_valid = (bypass == 0) ? data_valid_reg : data_in_valid;


endmodule