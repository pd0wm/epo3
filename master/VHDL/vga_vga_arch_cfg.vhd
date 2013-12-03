configuration vga_vga_arch_cfg of vga is
   for vga_arch
      for all: vga_counter use configuration work.vga_counter_vga_counter_behav_cfg;
      end for;
      for all: vga_sync use configuration work.vga_sync_vga_sync_arch_cfg;
      end for;
      for all: vga_triggers use configuration work.vga_triggers_vga_triggers_arch_cfg;
      end for;
      for all: vga_read use configuration work.vga_read_vga_read_behav_cfg;
      end for;
      for all: vga_field_trans use configuration work.vga_field_trans_vga_field_trans_arch_cfg;
      end for;
      for all: vga_field_trans_reset use configuration work.vga_field_trans_reset_vga_field_trans_reset_arch_cfg;
      end for;
      for all: vga_field_check use configuration work.vga_field_check_vga_field_check_arch_cfg;
      end for;
      for all: vga_np_trans use configuration work.vga_np_trans_vga_np_trans_arch_cfg;
      end for;
      for all: vga_np_trans_reset use configuration work.vga_np_trans_reset_vga_np_trans_reset_arch_cfg;
      end for;
      for all: vga_np_check use configuration work.vga_np_check_vga_np_check_arch_cfg;
      end for;
      for all: vga_score_trans use configuration work.vga_score_trans_vga_score_trans_arch_cfg;
      end for;
      for all: vga_score_check use configuration work.vga_score_check_vga_score_check_arch_cfg;
      end for;
   end for;
end vga_vga_arch_cfg;


