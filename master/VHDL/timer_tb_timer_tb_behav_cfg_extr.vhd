configuration timer_tb_timer_tb_behav_cfg_extr of timer_tb is
   for timer_tb_behav
      for all: timer use configuration work.timer_extracted_cfg;
      end for;
   end for;
end timer_tb_timer_tb_behav_cfg_extr;


