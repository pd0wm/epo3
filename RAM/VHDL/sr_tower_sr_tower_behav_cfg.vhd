configuration sr_tower_sr_tower_behav_cfg of sr_tower is
   for sr_tower_behav
      --for all: bit4 use configuration work.bit4_bit4_behav_cfg;
      --end for;
      for all: demux8_inv use configuration work.demux8_inv_demux8_inv_behav_cfg;
      end for;
      for all: dec8 use configuration work.dec8_dec8_behav_cfg;
      end for;
      for all: demux4_inv use configuration work.demux4_inv_demux4_inv_behav_cfg;
      end for;
   end for;
end sr_tower_sr_tower_behav_cfg;


