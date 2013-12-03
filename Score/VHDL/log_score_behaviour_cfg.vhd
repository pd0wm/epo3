configuration log_score_behaviour_cfg of log_score is
   for behaviour
      for all: score use configuration work.score_behaviour_cfg;
      end for;
      for all: log use configuration work.log_behaviour_cfg;
      end for;
   end for;
end log_score_behaviour_cfg;


