// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:fir_filter_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "fir_filter_wrapper,Vivado 2022.2" *)
(* CHECK_LICENSE_TYPE = "system_fir_filter_wrapper_0_0,fir_filter_wrapper,{}" *)
(* CORE_GENERATION_INFO = "system_fir_filter_wrapper_0_0,fir_filter_wrapper,{x_ipProduct=Vivado 2022.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fir_filter_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,b_low_pass_0=83,b_low_pass_1=118,b_low_pass_2=188,b_low_pass_3=306,b_low_pass_4=482,b_low_pass_5=724,b_low_pass_6=1031,b_low_pass_7=1400,b_low_pass_8=1820,b_low_pass_9=2272,b_low_pass_10=2737,b_low_pass_11=3189,b_low_pass_12=3604,b_low_pass_13=3957,b_low_pass_14=4227,b_low\
_pass_15=4395,b_low_pass_16=4453,b_low_pass_17=4395,b_low_pass_18=4227,b_low_pass_19=3957,b_low_pass_20=3604,b_low_pass_21=3189,b_low_pass_22=2737,b_low_pass_23=2272,b_low_pass_24=1820,b_low_pass_25=1400,b_low_pass_26=1031,b_low_pass_27=724,b_low_pass_28=482,b_low_pass_29=306,b_low_pass_30=188,b_low_pass_31=118,b_low_pass_32=83}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_fir_filter_wrapper_0_0 (
  clk,
  reset_n,
  enable,
  data_in,
  data_in_valid,
  data_out,
  data_out_valid
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_n RST" *)
input wire reset_n;
input wire enable;
input wire [31 : 0] data_in;
input wire data_in_valid;
output wire [31 : 0] data_out;
output wire data_out_valid;

  fir_filter_wrapper #(
    .b_low_pass_0(83),
    .b_low_pass_1(118),
    .b_low_pass_2(188),
    .b_low_pass_3(306),
    .b_low_pass_4(482),
    .b_low_pass_5(724),
    .b_low_pass_6(1031),
    .b_low_pass_7(1400),
    .b_low_pass_8(1820),
    .b_low_pass_9(2272),
    .b_low_pass_10(2737),
    .b_low_pass_11(3189),
    .b_low_pass_12(3604),
    .b_low_pass_13(3957),
    .b_low_pass_14(4227),
    .b_low_pass_15(4395),
    .b_low_pass_16(4453),
    .b_low_pass_17(4395),
    .b_low_pass_18(4227),
    .b_low_pass_19(3957),
    .b_low_pass_20(3604),
    .b_low_pass_21(3189),
    .b_low_pass_22(2737),
    .b_low_pass_23(2272),
    .b_low_pass_24(1820),
    .b_low_pass_25(1400),
    .b_low_pass_26(1031),
    .b_low_pass_27(724),
    .b_low_pass_28(482),
    .b_low_pass_29(306),
    .b_low_pass_30(188),
    .b_low_pass_31(118),
    .b_low_pass_32(83)
  ) inst (
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .data_in(data_in),
    .data_in_valid(data_in_valid),
    .data_out(data_out),
    .data_out_valid(data_out_valid)
  );
endmodule
