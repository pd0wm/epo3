configuration vga_counter_vga_counter_behav_cfg of vga_counter is
   for vga_counter_behav
      for all: vga_counter_8bit use configuration work.vga_counter_8bit_vga_counter_8bit_behav_cfg;
      end for;
      for all: vga_counter_10bit use configuration work.vga_counter_10bit_vga_counter_10bit_behav_cfg;
      end for;
      for all: vga_counter_resets use configuration work.vga_counter_resets_vga_counter_resets_behav_cfg;
      end for;
   end for;
end vga_counter_vga_counter_behav_cfg;


