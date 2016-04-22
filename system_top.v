// ***************************************************************************
// ***************************************************************************
// Copyright 2011(c) Analog Devices, Inc.
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//     - Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     - Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in
//       the documentation and/or other materials provided with the
//       distribution.
//     - Neither the name of Analog Devices, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//     - The use of this software may or may not infringe the patent rights
//       of one or more patent holders.  This license does not release you
//       from the requirement that you obtain separate licenses from these
//       patent holders to use this software.
//     - Use of the software either in source or binary form, must be run
//       on or directly connected to an Analog Devices Inc. component.
//
// THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED.
//
// IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, INTELLECTUAL PROPERTY
// RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (
    ddr_addr,
    ddr_ba,
    ddr_cas_n,
    ddr_ck_n,
    ddr_ck_p,
    ddr_cke,
    ddr_cs_n,
    ddr_dm,
    ddr_dq,
    ddr_dqs_n,
    ddr_dqs_p,
    ddr_odt,
    ddr_ras_n,
    ddr_reset_n,
    ddr_we_n,

    fixed_io_ddr_vrn,
    fixed_io_ddr_vrp,
    fixed_io_mio,
    fixed_io_ps_clk,
    fixed_io_ps_porb,
    fixed_io_ps_srstb,

    gpio_bd,

    hdmi_out_clk,
    hdmi_vsync,
    hdmi_hsync,
    hdmi_data_e,
    hdmi_data,

    i2s_mclk,
    i2s_bclk,
    i2s_lrclk,
    i2s_sdata_out,
    i2s_sdata_in,

    spdif,

    iic_scl,
    iic_sda,
    //iic_mux_scl, //Marcel
    //iic_mux_sda, //Marcel

    // otg_vbusoc, //Marcel

    adc_clk_in_n,
    adc_clk_in_p,
    adc_data_in_n,
    adc_data_in_p,
    adc_data_or_n,
    adc_data_or_p,
    spi9467_clk,
    spi9467_csn_adc,
    spi9467_csn_clk,
    spi9467_sdio,
	
								  dac_clk_in_p,			//ad9739a
								  dac_clk_in_n,			//ad9739a
								  dac_clk_out_p,		//ad9739a
								  dac_clk_out_n,		//ad9739a
								  dac_data_out_a_p,		//ad9739a
								  dac_data_out_a_n,		//ad9739a
								  dac_data_out_b_p,		//ad9739a
								  dac_data_out_b_n,		//ad9739a

								  spi9739_csn_clk,		//ad9739a
								  spi9739_csn_dac,		//ad9739a
								  spi9739_clk,			//ad9739a
								  spi9739_mosi,			//ad9739a
								  spi9739_miso			//ad9739a
	
	
);

inout  [14:0]   ddr_addr;
inout  [ 2:0]   ddr_ba;
inout           ddr_cas_n;
inout           ddr_ck_n;
inout           ddr_ck_p;
inout           ddr_cke;
inout           ddr_cs_n;
inout  [ 3:0]   ddr_dm;
inout  [31:0]   ddr_dq;
inout  [ 3:0]   ddr_dqs_n;
inout  [ 3:0]   ddr_dqs_p;
inout           ddr_odt;
inout           ddr_ras_n;
inout           ddr_reset_n;
inout           ddr_we_n;


inout           fixed_io_ddr_vrn;
inout           fixed_io_ddr_vrp;
inout   [53:0]  fixed_io_mio;
inout           fixed_io_ps_clk;
inout           fixed_io_ps_porb;
inout           fixed_io_ps_srstb;

inout   [15:0]  gpio_bd; //Marcel

output          hdmi_out_clk;
output          hdmi_vsync;
output          hdmi_hsync;
output          hdmi_data_e;
output  [15:0]  hdmi_data;

output          spdif;

output          i2s_mclk;
output          i2s_bclk;
output          i2s_lrclk;
output          i2s_sdata_out;
input           i2s_sdata_in;


inout           iic_scl;
inout           iic_sda;
//inout   [ 1:0]  iic_mux_scl;
//inout   [ 1:0]  iic_mux_sda;

//input           otg_vbusoc;

input           adc_clk_in_n;
input           adc_clk_in_p;
input  [ 7:0]   adc_data_in_n;
input  [ 7:0]   adc_data_in_p;
input           adc_data_or_n;
input           adc_data_or_p;
output          spi9467_clk;
output          spi9467_csn_adc;
output          spi9467_csn_clk;
inout           spi9467_sdio;

									  input           dac_clk_in_p; 		//ad9739a
									  input           dac_clk_in_n; 		//ad9739a
									  output          dac_clk_out_p; 		//ad9739a
									  output          dac_clk_out_n; 		//ad9739a
									  output  [13:0]  dac_data_out_a_p; 	//ad9739a
									  output  [13:0]  dac_data_out_a_n; 	//ad9739a
									  output  [13:0]  dac_data_out_b_p; 	//ad9739a
									  output  [13:0]  dac_data_out_b_n; 	//ad9739a

									  output          spi9739_csn_clk; 		//ad9739a
									  output          spi9739_csn_dac; 		//ad9739a
									  output          spi9739_clk; 			//ad9739a
									  output          spi9739_mosi; 		//ad9739a
									  input           spi9739_miso; 		//ad9739a

// internal signals
wire   [ 1:0]   spi9467_csn;
wire            spi9467_miso;
wire            spi9467_mosi;
wire    [63:0]  gpio_i;
wire    [63:0]  gpio_o;
wire    [63:0]  gpio_t;
wire    [ 1:0]  iic_mux_scl_i_s;
wire    [ 1:0]  iic_mux_scl_o_s;
wire            iic_mux_scl_t_s;
wire    [ 1:0]  iic_mux_sda_i_s;
wire    [ 1:0]  iic_mux_sda_o_s;
wire            iic_mux_sda_t_s;
									  wire    [ 2:0]  spi97390_csn;			//ad9739a
									  wire            spi97390_clk;			//ad9739a
									  wire            spi97390_mosi;		//ad9739a
									  wire            spi97390_miso;		//ad9739a
									  wire    [ 2:0]  spi97391_csn;			//ad9739a
									  wire            spi97391_clk;			//ad9739a
									  wire            spi97391_mosi;		//ad9739a
									  wire            spi97391_miso;		//ad9739a

// instantiations

  ad_iobuf #(.DATA_WIDTH(32)) i_iobuf_gpio (
    .dio_t ({gpio_t[31:0]}),
    .dio_i ({gpio_o[31:0]}),
    .dio_o ({gpio_i[31:0]}),
    .dio_p (gpio_bd));

   ad_iobuf #(.DATA_WIDTH(2)) i_iobuf_iic_scl (
    .dio_t ({iic_mux_scl_t_s,iic_mux_scl_t_s}),
    .dio_i (iic_mux_scl_o_s),
    .dio_o (iic_mux_scl_i_s),
    .dio_p (iic_mux_scl));

   ad_iobuf #(.DATA_WIDTH(2)) i_iobuf_iic_sda (
    .dio_t ({iic_mux_sda_t_s,iic_mux_sda_t_s}),
    .dio_i (iic_mux_sda_o_s),
    .dio_o (iic_mux_sda_i_s),
    .dio_p (iic_mux_sda));
	
										ad_iobuf #(.DATA_WIDTH(15)) i_iobuf_bd (//ad9739a
										.dio_t (gpio_t[14:0]),					//ad9739a
										.dio_i (gpio_o[14:0]),					//ad9739a
										.dio_o (gpio_i[14:0]),					//ad9739a
										.dio_p (gpio_bd));						//ad9739a

assign spi9467_csn_adc = spi9467_csn[0];
assign spi9467_csn_clk = spi9467_csn[1];

									  assign spi9739_csn_clk = spi97390_csn[0];	//ad9739a
									  assign spi9739_csn_dac = spi97390_csn[1];	//ad9739a
									  assign spi9739_clk = spi97390_clk;		//ad9739a
									  assign spi9739_mosi = spi97390_mosi;		//ad9739a
									  assign spi97390_miso = spi9739_miso;		//ad9739a

ad9467_spi9467 i_spi9467 (
    .spi9467_csn(spi9467_csn),
    .spi9467_clk(spi9467_clk),
    .spi9467_mosi(spi9467_mosi),
    .spi9467_miso(spi9467_miso),
    .spi9467_sdio(spi9467_sdio)
    );

system_wrapper i_system_wrapper (
    .ddr_addr(ddr_addr),
    .ddr_ba(ddr_ba),
    .ddr_cas_n(ddr_cas_n),
    .ddr_ck_n(ddr_ck_n),
    .ddr_ck_p(ddr_ck_p),
    .ddr_cke(ddr_cke),
    .ddr_cs_n(ddr_cs_n),
    .ddr_dm(ddr_dm),
    .ddr_dq(ddr_dq),
    .ddr_dqs_n(ddr_dqs_n),
    .ddr_dqs_p(ddr_dqs_p),
    .ddr_odt(ddr_odt),
    .ddr_ras_n(ddr_ras_n),
    .ddr_reset_n(ddr_reset_n),
    .ddr_we_n(ddr_we_n),
    .fixed_io_ddr_vrn (fixed_io_ddr_vrn),
    .fixed_io_ddr_vrp (fixed_io_ddr_vrp),
    .fixed_io_mio (fixed_io_mio),
    .fixed_io_ps_clk (fixed_io_ps_clk),
    .fixed_io_ps_porb (fixed_io_ps_porb),
    .fixed_io_ps_srstb (fixed_io_ps_srstb),
    .gpio_i (gpio_i),
    .gpio_o (gpio_o),
    .gpio_t (gpio_t),
    .hdmi_data (hdmi_data),
    .hdmi_data_e (hdmi_data_e),
    .hdmi_hsync (hdmi_hsync),
    .hdmi_out_clk (hdmi_out_clk),
    .hdmi_vsync (hdmi_vsync),
    // .i2s_bclk (i2s_bclk), //Marcel
    // .i2s_lrclk (i2s_lrclk), //Marcel
    // .i2s_mclk (i2s_mclk), //Marcel
    // .i2s_sdata_in (i2s_sdata_in), //Marcel
    // .i2s_sdata_out (i2s_sdata_out), //Marcel
//    .iic_fmc_scl_io (iic_scl), //Marcel
//    .iic_fmc_sda_io (iic_sda), //Marcel
//    .iic_mux_scl_i (iic_mux_scl_i_s), //Marcel
//    .iic_mux_scl_o (iic_mux_scl_o_s), //Marcel
//    .iic_mux_scl_t (iic_mux_scl_t_s), //Marcel
//    .iic_mux_sda_i (iic_mux_sda_i_s), //Marcel
//    .iic_mux_sda_o (iic_mux_sda_o_s), //Marcel
//    .iic_mux_sda_t (iic_mux_sda_t_s), //Marcel

    .iic_main_scl_io (iic_scl), //Marcel
    .iic_main_sda_io (iic_sda), //Marcel

	.ps_intr_00 (1'b0),
    .ps_intr_01 (1'b0),
    .ps_intr_02 (1'b0),
    .ps_intr_03 (1'b0),
    .ps_intr_04 (1'b0),
    .ps_intr_05 (1'b0),
    .ps_intr_06 (1'b0),
    .ps_intr_07 (1'b0),
    .ps_intr_08 (1'b0),
    .ps_intr_09 (1'b0),
    .ps_intr_10 (1'b0),
	
    //.ps_intr_12 (1'b0), //Roy
	
    // .otg_vbusoc (otg_vbusoc), //Marcel
    .spdif (spdif),
    .adc_clk_in_n(adc_clk_in_n),
    .adc_clk_in_p(adc_clk_in_p),
    .adc_data_in_n(adc_data_in_n),
    .adc_data_in_p(adc_data_in_p),
    .adc_data_or_n(adc_data_or_n),
    .adc_data_or_p(adc_data_or_p),
	
									.dac_clk_in_n (dac_clk_in_n),			//ad9739a
									.dac_clk_in_p (dac_clk_in_p),			//ad9739a
									.dac_clk_out_n (dac_clk_out_n),			//ad9739a
									.dac_clk_out_p (dac_clk_out_p),			//ad9739a
									.dac_data_out_a_n (dac_data_out_a_n),	//ad9739a
									.dac_data_out_a_p (dac_data_out_a_p),	//ad9739a
									.dac_data_out_b_n (dac_data_out_b_n),	//ad9739a
									.dac_data_out_b_p (dac_data_out_b_p),	//ad9739a
	
    .spi1_clk_i(1'b0),
    .spi1_clk_o(spi9467_clk),
    .spi1_csn_i(1'b1),
    .spi1_csn_0_o(spi9467_csn[0]),
    .spi1_csn_1_o(spi9467_csn[1]),
    .spi1_sdi_i(spi9467_miso),
    .spi1_sdo_i(1'b0),
    .spi1_sdo_o(spi9467_mosi),
	
									.spi0_clk_i (spi97390_clk),	//ad9739a
									.spi0_clk_o (spi97390_clk),	//ad9739a
									.spi0_csn_0_o (spi97390_csn[0]),	//ad9739a
									.spi0_csn_1_o (spi97390_csn[1]),	//ad9739a
									.spi0_csn_2_o (spi97390_csn[2]),	//ad9739a
									.spi0_csn_i (1'b1),	//ad9739a
									.spi0_sdi_i (spi97390_miso),	//ad9739a
									.spi0_sdo_i (spi97390_mosi),	//ad9739a
									.spi0_sdo_o (spi97390_mosi)	//ad9739a
	);

endmodule

// ***************************************************************************
// ***************************************************************************
