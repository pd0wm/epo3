#*********************************************************
#  synthesize script for cell: log_score                  *
#*********************************************************
set hdlin_vhdl_93 false
set hdlin_ff_always_async_set_reset true
set hdlin_ff_always_sync_set_reset true
set vhdlout_architecture_name "synthesised"
set vhdlout_use_packages {"ieee.std_logic_1164" "CellsLib.CellsLib_DECL_PACK"}
set company "ontwerp_practicum"
set designer "rdmiedema"
set target_library  {"/data/public/common/software/opprog/synth_libs/g_digilib5_99.db"}
set link_library [list "*" "/tmp/rdmiedema/epo3/score/ADB/log.ddc" "/tmp/rdmiedema/epo3/score/ADB/score.ddc" "/data/public/common/software/opprog/synth_libs/g_digilib5_99.db" "/data/public/common/software/opprog/synth_libs/g_analib8_00.db" "/data/public/common/software/opprog/synth_libs/buffers.db"]
define_design_lib MY_LIB -path /tmp/rdmiedema/epo3/score/syn_work
define_design_lib CELLSLIB -path /data/public/common/software/opprog/synth_libs/CellsLib
read_file -format vhdl -work MY_LIB {/tmp/rdmiedema/epo3/score/VHDL/log_score.vhd /tmp/rdmiedema/epo3/score/VHDL/log_score-behaviour.vhd}
set_dont_touch {log score}
set_dont_touch {g_analib8_00/*}
# set_max_fanout 1.8 all_inputs() 
# set_max_area 1000 
set compile_preserve_subdesign_interfaces true
compile
ungroup -all -flat
report_area
report_fsm
write_file -f ddc log_score -output /tmp/rdmiedema/epo3/score/ADB/log_score.ddc
write_file -f vhdl log_score -output /tmp/rdmiedema/epo3/score/VHDL/log_score_SYNTH.vhd
quit


