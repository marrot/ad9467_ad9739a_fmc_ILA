
source $ad_hdl_dir/projects/common/zc702/zc702_system_bd.tcl
source ../common/ad9467_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/sys_dmafifo.tcl
p_sys_dacfifo [current_bd_instance .] axi_ad9739a_fifo 256 10
source ../common/ad9739a_fmc_bd.tcl