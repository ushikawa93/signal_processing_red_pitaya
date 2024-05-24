
module fir_filter_wrapper(

    input clk,
	input reset_n,
	input enable,

    input signed [31:0] data_in,
	input data_in_valid,
	
	output signed [31:0] data_out,
	output data_out_valid


);

/*
 localparam [31:0] b_low_pass_0 = 32'd2309;
 localparam [31:0] b_low_pass_1 = 32'd15783;
 localparam [31:0] b_low_pass_2 = 32'd29349;
 localparam [31:0] b_low_pass_3 = 32'd15783;
 localparam [31:0] b_low_pass_4 = 32'd2309;
*/

 parameter b_low_pass_0 = 83;
 parameter b_low_pass_1 = 118;
 parameter b_low_pass_2 = 188;
 parameter b_low_pass_3 = 306;
 parameter b_low_pass_4 = 482;
 parameter b_low_pass_5 = 724;
 parameter b_low_pass_6 = 1031;
 parameter b_low_pass_7 = 1400;
 parameter b_low_pass_8 = 1820;
 parameter b_low_pass_9 = 2272;
 parameter b_low_pass_10 = 2737;
 parameter b_low_pass_11 = 3189;
 parameter b_low_pass_12 = 3604;
 parameter b_low_pass_13 = 3957;
 parameter b_low_pass_14 = 4227;
 parameter b_low_pass_15 = 4395;
 parameter b_low_pass_16 = 4453;
 parameter b_low_pass_17 = 4395;
 parameter b_low_pass_18 = 4227;
 parameter b_low_pass_19 = 3957;
 parameter b_low_pass_20 = 3604;
 parameter b_low_pass_21 = 3189;
 parameter b_low_pass_22 = 2737;
 parameter b_low_pass_23 = 2272;
 parameter b_low_pass_24 = 1820;
 parameter b_low_pass_25 = 1400;
 parameter b_low_pass_26 = 1031;
 parameter b_low_pass_27 = 724;
 parameter b_low_pass_28 = 482;
 parameter b_low_pass_29 = 306;
 parameter b_low_pass_30 = 188;
 parameter b_low_pass_31 = 118;
 parameter b_low_pass_32 = 83;


FIR_filter filtro_fir(

	.clk(clk),
	.reset_n(reset_n),
	.enable(enable),
	.bypass(0),
	
	.coef_0(b_low_pass_0),
    .coef_1(b_low_pass_1),
    .coef_2(b_low_pass_2),
    .coef_3(b_low_pass_3),
    .coef_4(b_low_pass_4),
    .coef_5(b_low_pass_5),
    .coef_6(b_low_pass_6),
    .coef_7(b_low_pass_7),
    .coef_8(b_low_pass_8),
    .coef_9(b_low_pass_9),
    .coef_10(b_low_pass_10),
    .coef_11(b_low_pass_11),
    .coef_12(b_low_pass_12),
    .coef_13(b_low_pass_13),
    .coef_14(b_low_pass_14),
    .coef_15(b_low_pass_15),
    .coef_16(b_low_pass_16),
    .coef_17(b_low_pass_17),
    .coef_18(b_low_pass_18),
    .coef_19(b_low_pass_19),
    .coef_20(b_low_pass_20),
    .coef_21(b_low_pass_21),
    .coef_22(b_low_pass_22),
    .coef_23(b_low_pass_23),
    .coef_24(b_low_pass_24),
    .coef_25(b_low_pass_25),
    .coef_26(b_low_pass_26),
    .coef_27(b_low_pass_27),
    .coef_28(b_low_pass_28),
    .coef_29(b_low_pass_29),
    .coef_30(b_low_pass_30),
    .coef_31(b_low_pass_31),
    .coef_32(b_low_pass_32),

	.data_in(data_in),
	.data_in_valid(data_in_valid),
	
	.data_out(data_out),
	.data_out_valid(data_out_valid)


);

endmodule
