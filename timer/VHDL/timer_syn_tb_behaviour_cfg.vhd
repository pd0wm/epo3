configuration timer_syn_tb_behaviour_cfg of timer_tb is
   for behaviour
      for all: timer use configuration work.timer_synthesised_cfg;
      end for;
   end for;
end timer_syn_tb_behaviour_cfg;


