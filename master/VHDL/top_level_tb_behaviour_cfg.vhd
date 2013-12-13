configuration top_level_tb_behaviour_cfg of top_level_tb is
   for behaviour
      for all: top_level use configuration work.top_level_structural_cfg;
      end for;
   end for;
end top_level_tb_behaviour_cfg;


