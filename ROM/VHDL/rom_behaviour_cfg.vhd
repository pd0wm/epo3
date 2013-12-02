configuration rom_behaviour_cfg of rom is
   for rom_behaviour
      for all: rom_mux44 use configuration work.rom_mux44_behaviour_cfg;
      end for;
      for all: rom_mux24 use configuration work.rom_mux24_behaviour_cfg;
      end for;
   end for;
end rom_behaviour_cfg;


