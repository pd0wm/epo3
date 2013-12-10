configuration rom_tb_extracted_cfg of rom_tb is
   for rom_tb_behaviour
      for all: rom use configuration work.rom_extracted_cfg;
      end for;
   end for;
end rom_tb_extracted_cfg;


