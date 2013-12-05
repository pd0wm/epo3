configuration draw_score_tb_syn_behaviour_cfg of draw_score_tb is
   for behaviour
      for all: draw_score use configuration work.draw_score_synthesised_cfg;
      end for;
   end for;
end draw_score_tb_syn_behaviour_cfg;


