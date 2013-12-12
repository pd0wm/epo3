configuration timer_timer_behav_cfg of timer is
   for timer_behav
      for all: timer_counter use configuration work.timer_counter_timer_counter_arch_cfg;
      end for;
      for all: timer_det use configuration work.timer_det_timer_det_arch_cfg;
      end for;
   end for;
end timer_timer_behav_cfg;


