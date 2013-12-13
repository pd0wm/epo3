configuration top_level2_top_level2_struc_cfg of top_level2 is
   for top_level2_struc
      for all: debounce use configuration work.debounce_behaviour_cfg;
      end for;
      for all: npg use configuration work.npg_structural_cfg;
      end for;
      for all: timer use configuration work.timer_timer_behav_cfg;
      end for;
      for all: controller use configuration work.controller_controller_arch_cfg;
      end for;
      for all: sr_if use configuration work.sr_if_sr_if_behav_cfg;
      end for;
      for all: ram_fix use configuration work.ram_fix_ram_fix_behav_cfg;
      end for;
      for all: vga use configuration work.vga_vga_arch_cfg;
      end for;
      for all: check_mask use configuration work.check_mask_check_mask_behaviour_cfg;
      end for;
      for all: de_piece use configuration work.de_piece_behaviour_cfg;
      end for;
      for all: piece_lut use configuration work.piece_lut_piece_lut_behaviour_cfg;
      end for;
      for all: rom use configuration work.rom_behaviour_cfg;
      end for;
      for all: cs_compare use configuration work.cs_compare_cs_compare_behav_cfg;
      end for;
      for all: log_score use configuration work.log_score_behaviour_cfg;
      end for;
      for all: draw_score use configuration work.draw_score_behaviour_cfg;
      end for;
   end for;
end top_level2_top_level2_struc_cfg;


