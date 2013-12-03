configuration sr_if_sr_if_behav_cfg of sr_if is
   for sr_if_behav
      --for all: sr_tower use configuration work.sr_tower_sr_tower_behav_cfg;
      --end for;
      for all: mux5 use configuration work.mux5_mux5_behav_cfg;
      end for;
      for all: demux5 use configuration work.demux5_demux5_behav_cfg;
      end for;
   end for;
end sr_if_sr_if_behav_cfg;


