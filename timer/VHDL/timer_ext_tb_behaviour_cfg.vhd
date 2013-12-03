configuration timer_ext_tb_behaviour_cfg of timer_tb is
   for behaviour
      for all: timer use configuration work.timer_extracted_cfg;
      end for;
   end for;
end timer_ext_tb_behaviour_cfg;


