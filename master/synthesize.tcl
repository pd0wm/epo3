#*********************************************************
#  synthesize script for cell: vga                        *
#*********************************************************
set hdlin_vhdl_93 false
set hdlin_ff_always_async_set_reset true
set hdlin_ff_always_sync_set_reset true
set vhdlout_architecture_name "synthesised"
set vhdlout_use_packages {"ieee.std_logic_1164" "CellsLib.CellsLib_DECL_PACK"}
set company "ontwerp_practicum"
set designer "epo3-user"
set target_library  {"/data/public/common/software/opprog/synth_libs/g_digilib5_99.db"}
set link_library [list "*" "./ADB/vga_demux.ddc" "./ADB/vga_score_check.ddc" "./ADB/vga_score_trans.ddc" "./ADB/vga_counter_3bit.ddc" "./ADB/vga_np_check.ddc" "./ADB/vga_np_trans_reset.ddc" "./ADB/vga_counter_2bit.ddc" "./ADB/vga_np_trans.ddc" "./ADB/vga_counter_8bitset.ddc" "./ADB/vga_field_check.ddc" "./ADB/vga_field_trans_reset.ddc" "./ADB/vga_counter_4bit.ddc" "./ADB/vga_field_trans.ddc" "./ADB/vga_counter_8bitset.ddc" "./ADB/vga_read.ddc" "./ADB/vga_triggers.ddc" "./ADB/vga_sync.ddc" "./ADB/vga_counter.ddc" "./ADB/vga_counter_resets.ddc" "./ADB/vga_counter_10bit.ddc" "./ADB/vga_counter_8bit.ddc" "/data/public/common/software/opprog/synth_libs/g_digilib5_99.db" "/data/public/common/software/opprog/synth_libs/g_analib8_00.db" "/data/public/common/software/opprog/synth_libs/buffers.db"]
define_design_lib MY_LIB -path ./syn_work
define_design_lib CELLSLIB -path /data/public/common/software/opprog/synth_libs/CellsLib
read_file -format vhdl -work MY_LIB VHDL/params.vhd
read_file -format vhdl -work MY_LIB {VHDL/vga.vhd VHDL/vga_arch.vhd}
set_dont_touch {vga_demux vga_score_check vga_score_trans vga_np_check vga_np_trans_reset vga_np_trans vga_field_check vga_field_trans_reset vga_field_trans vga_read vga_triggers vga_sync vga_counter}
set_dont_touch {g_analib8_00/*}
# set_max_fanout 1.8 all_inputs() 
# set_max_area 1000 
set compile_preserve_subdesign_interfaces true
compile
ungroup -all -flat
report_area
report_fsm
write_file -f ddc vga -output ./ADB/vga.ddc
write_file -f vhdl vga -output ./VHDL/vga_SYNTH.vhd
quit


