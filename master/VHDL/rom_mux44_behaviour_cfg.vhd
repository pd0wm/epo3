configuration rom_mux44_behaviour_cfg of rom_mux44 is
   for rom_mux44_behaviour
      for all: rom_mux4 use configuration work.rom_mux4_behaviour_cfg;
      end for;
   end for;
end rom_mux44_behaviour_cfg;


