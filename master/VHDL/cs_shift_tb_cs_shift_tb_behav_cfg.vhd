configuration cs_shift_tb_cs_shift_tb_behav_cfg of cs_shift_tb is
   for cs_shift_tb_behav
      for all: cs_shift use configuration work.cs_shift_cs_shift_behav_cfg;
      end for;
   end for;
end cs_shift_tb_cs_shift_tb_behav_cfg;


