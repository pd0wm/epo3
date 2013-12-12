
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of npg is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component npg_ff
      port( clk, rst, d : in std_logic;  q : out std_logic);
   end component;
   
   component npg_mux2_1
      port( out1 : out std_logic;  sel, in1, in2 : in std_logic);
   end component;
   
   signal output_2_port, output_1_port, output_0_port, shift, button_xor_self, 
      s5, s6, s7, n2, n4, n5, n6 : std_logic;

begin
   output <= ( output_2_port, output_1_port, output_0_port );
   
   Button : npg_ff port map( clk => clk, rst => n2, d => button_xor_self, q => 
                           shift);
   M1 : npg_mux2_1 port map( out1 => s5, sel => shift, in1 => n4, in2 => 
                           output_2_port);
   L1 : npg_ff port map( clk => clk, rst => rst, d => s5, q => output_2_port);
   M2 : npg_mux2_1 port map( out1 => s6, sel => shift, in1 => output_2_port, 
                           in2 => output_1_port);
   L2 : npg_ff port map( clk => clk, rst => rst, d => s6, q => output_1_port);
   M3 : npg_mux2_1 port map( out1 => s7, sel => shift, in1 => output_1_port, 
                           in2 => output_0_port);
   L3 : npg_ff port map( clk => clk, rst => rst, d => s7, q => output_0_port);
   U6 : ex210 port map( A => n5, B => output_1_port, Y => n4);
   U7 : iv110 port map( A => output_0_port, Y => n5);
   U8 : iv110 port map( A => n6, Y => n2);
   U9 : no210 port map( A => new_number, B => rst, Y => n6);
   U10 : ex210 port map( A => shift, B => button_seed, Y => button_xor_self);

end synthesised;



