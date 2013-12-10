configuration piece_lut_synthesised_cfg of piece_lut is
   for synthesised
      for all: adder_x use configuration work.adder_x_behaviour_cfg;
      end for;
      for all: adder_y use configuration work.adder_y_behaviour_cfg;
      end for;
   end for;
end piece_lut_synthesised_cfg;


