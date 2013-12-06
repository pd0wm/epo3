configuration npg_structural_cfg of npg is
   for structural
      for all: npg_ff use configuration work.npg_ff_behaviour_cfg;
      end for;
      for all: npg_mux2_1 use configuration work.npg_mux2_1_behaviour_cfg;
      end for;
   end for;
end npg_structural_cfg;


