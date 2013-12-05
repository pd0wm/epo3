configuration testbench_extracted_cfg of testbench is
   for testbench_behaviour
      for all: clearandshift use configuration work.clearandshift_extracted_cfg;
      end for;
   end for;
end testbench_extracted_cfg;


