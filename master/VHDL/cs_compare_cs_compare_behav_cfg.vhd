configuration cs_compare_cs_compare_behav_cfg of cs_compare is
   for cs_compare_behav
      for all: cs_7bc use configuration work.cs_7bc_cs_7bc_behav_cfg;
      end for;
      for all: cs_tri8 use configuration work.cs_tri8_cs_tri8_behav_cfg;
      end for;
      for all: cs_shift use configuration work.cs_shift_cs_shift_behav_cfg;
      end for;
      for all: cs_defset2 use configuration work.cs_defset2_cs_defset2_behav_cfg;
      end for;
   end for;
end cs_compare_cs_compare_behav_cfg;


