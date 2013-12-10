library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mux2_1 is
begin
process(sel, in1, in2) is
  begin
    case sel is
    when '0' => 
      out1<= in1;
    when '1' =>
      out1<= in2;
    when others =>
      out1<= in1;
   end case;
 end process;
 end behaviour;
      