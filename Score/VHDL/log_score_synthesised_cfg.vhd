configuration log_score_synthesised_cfg of log_score is
   for synthesised
      for all: score use configuration work.score_synthesised_cfg;
      end for;
      for all: log use configuration work.log_synthesised_cfg;
      end for;
   end for;
end log_score_synthesised_cfg;


