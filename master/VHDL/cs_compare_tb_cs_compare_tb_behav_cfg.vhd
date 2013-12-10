configuration cs_compare_tb_cs_compare_tb_behav_cfg of cs_compare_tb is
   for cs_compare_tb_behav
      for all: cs_compare use configuration work.cs_compare_cs_compare_behav_cfg;
      end for;
   end for;
end cs_compare_tb_cs_compare_tb_behav_cfg;


