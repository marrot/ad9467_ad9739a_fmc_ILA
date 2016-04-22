# load script
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

set project_name ad9467_ad9739a_fmc_zc702

adi_project_create $project_name

adi_project_files $project_name [list "../common/ad9467_spi.v" \
                                      "$ad_hdl_dir/library/common/ad_iobuf.v" \
                                      "system_top.v" \
                                      "system_constr.xdc" \
                                      "$ad_hdl_dir/projects/common/zc702/zc702_system_constr.xdc"]

set_property PROCESSING_ORDER EARLY [get_files $ad_hdl_dir/projects/common/zc702/zc702_system_constr.xdc]
set_property PROCESSING_ORDER EARLY [get_files system_constr.xdc]
									  
									  
adi_project_run $project_name