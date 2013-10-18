library IEEE;
use IEEE.std_logic_1164.ALL;

Entity ff is
        port(
          out1 : out std_logic;
          sel, in1, in2 : in std_logic
        );
      end entity ff;