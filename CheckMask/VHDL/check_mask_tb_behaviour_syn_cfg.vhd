configuration check_mask_tb_behaviour_syn_cfg of checkmask_tb is
   for check_mask_tb_behaviour
      for all: check_mask use configuration work.check_mask_synthesised_cfg;
      end for;
   end for;
end check_mask_tb_behaviour_syn_cfg;


