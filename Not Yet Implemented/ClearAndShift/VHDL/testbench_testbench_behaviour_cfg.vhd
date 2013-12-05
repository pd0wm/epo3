configuration testbench_testbench_behaviour_cfg of testbench is
   for testbench_behaviour
      for all: clearandshift use configuration work.clearandshift_behaviour_cfg;
      end for;
   end for;
end testbench_testbench_behaviour_cfg;


