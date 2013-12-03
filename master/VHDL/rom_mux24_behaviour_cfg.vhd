configuration rom_mux24_behaviour_cfg of rom_mux24 is
   for rom_mux24_behaviour
      for all: rom_mux2 use configuration work.rom_mux2_behaviour_cfg;
      end for;
   end for;
end rom_mux24_behaviour_cfg;


