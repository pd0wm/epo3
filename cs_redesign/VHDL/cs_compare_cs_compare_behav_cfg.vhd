configuration cs_compare_cs_compare_behav_cfg of cs_compare is
   for cs_compare_behav
      for all: cs_7bc use configuration work.cs_7bc_cs_7bc_arch_cfg;
      end for;
      for all: cs_tri7 use configuration work.cs_tri7_cs_tri7_behav_cfg;
      end for;
   end for;
end cs_compare_cs_compare_behav_cfg;


