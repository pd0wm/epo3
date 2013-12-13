#*********************************************************
#  synthesize script for cell: top_level                  *
#*********************************************************
set hdlin_vhdl_93 false
set hdlin_ff_always_async_set_reset true
set hdlin_ff_always_sync_set_reset true
set vhdlout_architecture_name "synthesised"
set vhdlout_use_packages {"ieee.std_logic_1164" "CellsLib.CellsLib_DECL_PACK"}
set company "ontwerp_practicum"
set designer "epo3-user"
set target_library  {"/data/public/common/software/opprog/synth_libs/g_digilib5_99.db"}
set link_library [list "*" "./ADB/controller.ddc" "./ADB/controller_move.ddc" "./ADB/controller_calc.ddc" "./ADB/rom.ddc" "./ADB/rom_mux24.ddc" "./ADB/rom_mux2.ddc" "./ADB/rom_mux44.ddc" "./ADB/rom_mux4.ddc" "./ADB/piece_lut.ddc" "./ADB/adder_y.ddc" "./ADB/adder_x.ddc" "./ADB/de_piece.ddc" "./ADB/check_mask.ddc" "./ADB/timer.ddc" "./ADB/timer_det.ddc" "./ADB/timer_counter.ddc" "./ADB/vga.ddc" "./ADB/vga_demux.ddc" "./ADB/vga_score_check.ddc" "./ADB/vga_score_trans.ddc" "./ADB/vga_counter_3bit.ddc" "./ADB/vga_np_check.ddc" "./ADB/vga_np_trans_reset.ddc" "./ADB/vga_counter_2bit.ddc" "./ADB/vga_np_trans.ddc" "./ADB/vga_counter_8bitset.ddc" "./ADB/vga_field_check.ddc" "./ADB/vga_field_trans_reset.ddc" "./ADB/vga_counter_4bit.ddc" "./ADB/vga_field_trans.ddc" "./ADB/vga_counter_8bitset.ddc" "./ADB/vga_read.ddc" "./ADB/vga_triggers.ddc" "./ADB/vga_sync.ddc" "./ADB/vga_counter.ddc" "./ADB/vga_counter_resets.ddc" "./ADB/vga_counter_10bit.ddc" "./ADB/vga_counter_8bit.ddc" "./ADB/sr_if.ddc" "./ADB/demux5.ddc" "./ADB/mux5.ddc" "./ADB/debounce.ddc" "./ADB/draw_score.ddc" "./ADB/log_score.ddc" "./ADB/log.ddc" "./ADB/score.ddc" "./ADB/cs_compare.ddc" "./ADB/cs_compare_comb.ddc" "./ADB/cs_defset2.ddc" "./ADB/cs_shift.ddc" "./ADB/cs_shift_comb.ddc" "./ADB/cs_adder7.ddc" "./ADB/cs_7bcws.ddc" "./ADB/cs_tri8.ddc" "./ADB/cs_tri8.ddc" "./ADB/cs_7bc.ddc" "./ADB/npg.ddc" "./ADB/npg_mux2_1.ddc" "./ADB/npg_ff.ddc" "/data/public/common/software/opprog/synth_libs/g_digilib5_99.db" "/data/public/common/software/opprog/synth_libs/g_analib8_00.db" "/data/public/common/software/opprog/synth_libs/buffers.db"]
define_design_lib MY_LIB -path ./syn_work
define_design_lib CELLSLIB -path /data/public/common/software/opprog/synth_libs/CellsLib
read_file -format vhdl -work MY_LIB VHDL/params.vhd
read_file -format vhdl -work MY_LIB VHDL/cs_shift_statetype.vhd
read_file -format vhdl -work MY_LIB VHDL/cs_shift_statetype.vhd
read_file -format vhdl -work MY_LIB {VHDL/top_level.vhd VHDL/top_level-structural.vhd}
set_dont_touch {controller rom piece_lut de_piece check_mask timer vga sr_if debounce draw_score log_score cs_compare npg}
set_dont_touch {g_analib8_00/*}
# set_max_fanout 1.8 all_inputs() 
# set_max_area 1000 
set compile_preserve_subdesign_interfaces true
compile
ungroup -all -flat
report_area
report_fsm
write_file -f ddc top_level -output ./ADB/top_level.ddc
write_file -f vhdl top_level -output ./VHDL/top_level_SYNTH.vhd
quit


