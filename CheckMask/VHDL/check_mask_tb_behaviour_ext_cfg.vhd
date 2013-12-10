configuration check_mask_tb_behaviour_ext_cfg of checkmask_tb is
   for check_mask_tb_behaviour
      for all: check_mask use configuration work.check_mask_extracted_cfg;
      end for;
   end for;
end check_mask_tb_behaviour_ext_cfg;


