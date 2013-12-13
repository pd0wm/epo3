#*********************************************************
#  synthesize script for cell: timer                      *
#*********************************************************
set hdlin_vhdl_93 false
set hdlin_ff_always_async_set_reset true
set hdlin_ff_always_sync_set_reset true
set vhdlout_architecture_name "synthesised"
set vhdlout_use_packages {"ieee.std_logic_1164" "CellsLib.CellsLib_DECL_PACK"}
set company "ontwerp_practicum"
set designer "epo3-user"
set target_library  {"/data/public/common/software/opprog/synth_libs/g_digilib5_99.db"}
set link_library [list "*" "./ADB/timer_det.ddc" "./ADB/timer_counter.ddc" "/data/public/common/software/opprog/synth_libs/g_digilib5_99.db" "/data/public/common/software/opprog/synth_libs/g_analib8_00.db" "/data/public/common/software/opprog/synth_libs/buffers.db"]
define_design_lib MY_LIB -path ./syn_work
define_design_lib CELLSLIB -path /data/public/common/software/opprog/synth_libs/CellsLib
read_file -format vhdl -work MY_LIB VHDL/params.vhd
read_file -format vhdl -work MY_LIB VHDL/cs_shift_statetype.vhd
read_file -format vhdl -work MY_LIB VHDL/cs_shift_statetype.vhd
read_file -format vhdl -work MY_LIB {VHDL/timer.vhd VHDL/timer_arch.vhd}
set_dont_touch {timer_det timer_counter}
set_dont_touch {g_analib8_00/*}
# set_max_fanout 1.8 all_inputs() 
# set_max_area 1000 
set compile_preserve_subdesign_interfaces true
compile
ungroup -all -flat
report_area
report_fsm
write_file -f ddc timer -output ./ADB/timer.ddc
write_file -f vhdl timer -output ./VHDL/timer_SYNTH.vhd
quit


