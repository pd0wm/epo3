
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of log_score is

   component log
      port( log_in : in std_logic_vector (7 downto 0);  log_out : out 
            std_logic_vector (7 downto 0));
   end component;
   
   component score
      port( clk, rst, increase : in std_logic;  output : out std_logic_vector 
            (7 downto 0));
   end component;
   
   signal score_to_log_7_port, score_to_log_6_port, score_to_log_5_port, 
      score_to_log_4_port, score_to_log_3_port, score_to_log_2_port, 
      score_to_log_1_port, score_to_log_0_port : std_logic;

begin
   
   L1 : score port map( clk => clk, rst => rst, increase => increase, output(7)
                           => score_to_log_7_port, output(6) => 
                           score_to_log_6_port, output(5) => 
                           score_to_log_5_port, output(4) => 
                           score_to_log_4_port, output(3) => 
                           score_to_log_3_port, output(2) => 
                           score_to_log_2_port, output(1) => 
                           score_to_log_1_port, output(0) => 
                           score_to_log_0_port);
   L2 : log port map( log_in(7) => score_to_log_7_port, log_in(6) => 
                           score_to_log_6_port, log_in(5) => 
                           score_to_log_5_port, log_in(4) => 
                           score_to_log_4_port, log_in(3) => 
                           score_to_log_3_port, log_in(2) => 
                           score_to_log_2_port, log_in(1) => 
                           score_to_log_1_port, log_in(0) => 
                           score_to_log_0_port, log_out(7) => output(7), 
                           log_out(6) => output(6), log_out(5) => output(5), 
                           log_out(4) => output(4), log_out(3) => output(3), 
                           log_out(2) => output(2), log_out(1) => output(1), 
                           log_out(0) => output(0));

end synthesised;



