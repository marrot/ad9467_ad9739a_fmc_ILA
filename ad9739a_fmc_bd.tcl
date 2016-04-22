
# dac interface

create_bd_port -dir I dac_clk_in_p
create_bd_port -dir I dac_clk_in_n
create_bd_port -dir O dac_clk_out_p
create_bd_port -dir O dac_clk_out_n
create_bd_port -dir O -from 13 -to 0 dac_data_out_a_p
create_bd_port -dir O -from 13 -to 0 dac_data_out_a_n
create_bd_port -dir O -from 13 -to 0 dac_data_out_b_p
create_bd_port -dir O -from 13 -to 0 dac_data_out_b_n

# dac peripherals

set axi_ad9739a [create_bd_cell -type ip -vlnv analog.com:user:axi_ad9739a:1.0 axi_ad9739a]

set axi_ad9739a_dma [create_bd_cell -type ip -vlnv analog.com:user:axi_dmac:1.0 axi_ad9739a_dma]
set_property -dict [list CONFIG.DMA_TYPE_SRC {0}] $axi_ad9739a_dma
set_property -dict [list CONFIG.DMA_TYPE_DEST {1}] $axi_ad9739a_dma
set_property -dict [list CONFIG.FIFO_SIZE {32}] $axi_ad9739a_dma
set_property -dict [list CONFIG.DMA_2D_TRANSFER {0}] $axi_ad9739a_dma
set_property -dict [list CONFIG.CYCLIC {0}] $axi_ad9739a_dma
set_property -dict [list CONFIG.AXI_SLICE_DEST {1}] $axi_ad9739a_dma
set_property -dict [list CONFIG.AXI_SLICE_SRC {1}]  $axi_ad9739a_dma
set_property -dict [list CONFIG.DMA_DATA_WIDTH_DEST {256}] $axi_ad9739a_dma
set_property -dict [list CONFIG.DMA_DATA_WIDTH_SRC {256}] $axi_ad9739a_dma
set_property -dict [list CONFIG.DMA_AXI_PROTOCOL_SRC {1}] $axi_ad9739a_dma

# connections (dac)

ad_connect  dac_clk_in_p axi_ad9739a/dac_clk_in_p
ad_connect  dac_clk_in_n axi_ad9739a/dac_clk_in_n
ad_connect  dac_clk_out_p axi_ad9739a/dac_clk_out_p
ad_connect  dac_clk_out_n axi_ad9739a/dac_clk_out_n
ad_connect  dac_data_out_a_p axi_ad9739a/dac_data_out_a_p
ad_connect  dac_data_out_a_n axi_ad9739a/dac_data_out_a_n
ad_connect  dac_data_out_b_p axi_ad9739a/dac_data_out_b_p
ad_connect  dac_data_out_b_n axi_ad9739a/dac_data_out_b_n


# interconnect (cpu)

ad_cpu_interconnect 0x74200000 axi_ad9739a
ad_cpu_interconnect 0x7c420000 axi_ad9739a_dma

# interconnect (mem/dac)

ad_mem_hp2_interconnect sys_200m_clk sys_ps7/S_AXI_HP2
ad_mem_hp2_interconnect sys_200m_clk axi_ad9739a_dma/m_src_axi
ad_connect  sys_cpu_resetn axi_ad9739a_dma/m_src_axi_aresetn

# interrupts

ad_cpu_interrupt ps-12 mb-12 axi_ad9739a_dma/irq

 # clocks and reset

ad_connect  axi_ad9739a/dac_div_clk axi_ad9739a_fifo/dac_clk
ad_connect  sys_cpu_clk axi_ad9739a_dma/m_axis_aclk
ad_connect  sys_cpu_clk axi_ad9739a_fifo/dma_clk
ad_connect  sys_cpu_reset axi_ad9739a_fifo/dma_rst
# fifo interface to the DAC

ad_connect  axi_ad9739a/dac_valid axi_ad9739a_fifo/dac_valid
ad_connect  axi_ad9739a/dac_ddata axi_ad9739a_fifo/dac_data

# AXI Streaming interface for the DMAC

ad_connect  axi_ad9739a_fifo/dma_xfer_req axi_ad9739a_dma/m_axis_xfer_req
ad_connect  axi_ad9739a_fifo/dma_ready axi_ad9739a_dma/m_axis_ready
ad_connect  axi_ad9739a_fifo/dma_data axi_ad9739a_dma/m_axis_data
ad_connect  axi_ad9739a_fifo/dma_valid axi_ad9739a_dma/m_axis_valid
ad_connect  axi_ad9739a_fifo/dma_xfer_last axi_ad9739a_dma/m_axis_last