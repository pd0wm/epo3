
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of sr_tower is

   component demux4_inv
      port( di : in std_logic;  do : out std_logic_vector (3 downto 0);  s : in
            std_logic_vector (1 downto 0));
   end component;
   
   component dec8
      port( do : out std_logic_vector (7 downto 0);  s : in std_logic_vector (2
            downto 0));
   end component;
   
   component demux8_inv
      port( di : in std_logic;  do : out std_logic_vector (7 downto 0);  s : in
            std_logic_vector (2 downto 0));
   end component;
   
   component bit4
      port( do_2 : out std_logic;  addr1_1, addr1_2, addr2_1, addr2_2, we1, we2
            , we3, we4, we_com, re_1, re_2, clk, rst, di : in std_logic;  do_1 
            : out std_logic);
   end component;
   
   signal we_i_3_port, we_i_2_port, we_i_1_port, we_i_0_port, re_2_7_port, 
      re_2_6_port, re_2_5_port, re_2_4_port, re_2_3_port, re_2_2_port, 
      re_2_1_port, re_2_0_port, re_1_7_port, re_1_6_port, re_1_5_port, 
      re_1_4_port, re_1_3_port, re_1_2_port, re_1_1_port, re_1_0_port, 
      we_com_7_port, we_com_6_port, we_com_5_port, we_com_4_port, we_com_3_port
      , we_com_2_port, we_com_1_port, we_com_0_port : std_logic;

begin
   
   bit4_mod_0 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_0_port, re_1 => re_1_0_port, re_2 => 
                           re_2_0_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_1 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_1_port, re_1 => re_1_1_port, re_2 => 
                           re_2_1_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_2 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_2_port, re_1 => re_1_2_port, re_2 => 
                           re_2_2_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_3 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_3_port, re_1 => re_1_3_port, re_2 => 
                           re_2_3_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_4 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_4_port, re_1 => re_1_4_port, re_2 => 
                           re_2_4_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_5 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_5_port, re_1 => re_1_5_port, re_2 => 
                           re_2_5_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_6 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_6_port, re_1 => re_1_6_port, re_2 => 
                           re_2_6_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   bit4_mod_7 : bit4 port map( do_2 => do2, addr1_1 => addr1(0), addr1_2 => 
                           addr1(1), addr2_1 => addr2(0), addr2_2 => addr2(1), 
                           we1 => we_i_0_port, we2 => we_i_1_port, we3 => 
                           we_i_2_port, we4 => we_i_3_port, we_com => 
                           we_com_7_port, re_1 => re_1_7_port, re_2 => 
                           re_2_7_port, clk => clk, rst => rst, di => di, do_1 
                           => do1);
   demux8_inv_we_com : demux8_inv port map( di => we, do(7) => we_com_7_port, 
                           do(6) => we_com_6_port, do(5) => we_com_5_port, 
                           do(4) => we_com_4_port, do(3) => we_com_3_port, 
                           do(2) => we_com_2_port, do(1) => we_com_1_port, 
                           do(0) => we_com_0_port, s(2) => addr1(4), s(1) => 
                           addr1(3), s(0) => addr1(2));
   dec8_re_1 : dec8 port map( do(7) => re_1_7_port, do(6) => re_1_6_port, do(5)
                           => re_1_5_port, do(4) => re_1_4_port, do(3) => 
                           re_1_3_port, do(2) => re_1_2_port, do(1) => 
                           re_1_1_port, do(0) => re_1_0_port, s(2) => addr1(4),
                           s(1) => addr1(3), s(0) => addr1(2));
   dec8_re_2 : dec8 port map( do(7) => re_2_7_port, do(6) => re_2_6_port, do(5)
                           => re_2_5_port, do(4) => re_2_4_port, do(3) => 
                           re_2_3_port, do(2) => re_2_2_port, do(1) => 
                           re_2_1_port, do(0) => re_2_0_port, s(2) => addr2(4),
                           s(1) => addr2(3), s(0) => addr2(2));
   demux4_inv_we_i : demux4_inv port map( di => we, do(3) => we_i_3_port, do(2)
                           => we_i_2_port, do(1) => we_i_1_port, do(0) => 
                           we_i_0_port, s(1) => addr1(1), s(0) => addr1(0));

end synthesised;



