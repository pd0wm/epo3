configuration cs_shift_cs_shift_behav_cfg of cs_shift is
   for cs_shift_behav
      for all: cs_tri8 use configuration work.cs_tri8_cs_tri8_behav_cfg;
      end for;
      for all: cs_7bcws use configuration work.cs_7bcws_cs_7bcws_behav_cfg;
      end for;
      for all: cs_adder7 use configuration work.cs_adder7_cs_addr7_behav_cfg;
      end for;
      for all: cs_shift_comb use configuration work.cs_shift_comb_cs_shift_comb_behav_cfg;
      end for;
   end for;
end cs_shift_cs_shift_behav_cfg;


