configuration piece_lut_piece_lut_behaviour_cfg of piece_lut is
   for piece_lut_behaviour
      for all: adder_x use configuration work.adder_x_behaviour_cfg;
      end for;
      for all: adder_y use configuration work.adder_y_behaviour_cfg;
      end for;
   end for;
end piece_lut_piece_lut_behaviour_cfg;


