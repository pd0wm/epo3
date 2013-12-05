configuration testbench_synth_cfg of testbench is
   for testbench_behaviour
      for all: clearandshift use configuration work.clearandshift_synthesised_cfg;
      end for;
   end for;
end testbench_synth_cfg;


