
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of sr_if is

   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   component demux5
      port( di : in std_logic;  do : out std_logic_vector (4 downto 0);  s : in
            std_logic_vector (2 downto 0));
   end component;
   
   component mux5
      port( di : in std_logic_vector (4 downto 0);  do : out std_logic;  s : in
            std_logic_vector (2 downto 0));
   end component;
   
   component sr_tower
      port( clk, rst, di : in std_logic;  do1, do2 : out std_logic;  we : in 
            std_logic;  addr1, addr2 : in std_logic_vector (4 downto 0));
   end component;
   
   signal we_i_4_port, we_i_3_port, we_i_2_port, we_i_1_port, we_i_0_port, 
      do2_i_4_port, do2_i_3_port, do2_i_2_port, do2_i_1_port, do2_i_0_port, 
      do1_i_4_port, do1_i_3_port, do1_i_2_port, do1_i_1_port, do1_i_0_port, 
      do1_buf, do2_buf, n1, n2, n3, n4, n5 : std_logic;

begin
   
   tower_mod_0 : sr_tower port map( clk => clk, rst => rst, di => di, do1 => 
                           do1_i_0_port, do2 => do2_i_0_port, we => n2, 
                           addr1(4) => addr1(4), addr1(3) => addr1(3), addr1(2)
                           => addr1(2), addr1(1) => addr1(1), addr1(0) => 
                           addr1(0), addr2(4) => addr2(4), addr2(3) => addr2(3)
                           , addr2(2) => addr2(2), addr2(1) => addr2(1), 
                           addr2(0) => addr2(0));
   tower_mod_1 : sr_tower port map( clk => clk, rst => rst, di => di, do1 => 
                           do1_i_1_port, do2 => do2_i_1_port, we => n3, 
                           addr1(4) => addr1(4), addr1(3) => addr1(3), addr1(2)
                           => addr1(2), addr1(1) => addr1(1), addr1(0) => 
                           addr1(0), addr2(4) => addr2(4), addr2(3) => addr2(3)
                           , addr2(2) => addr2(2), addr2(1) => addr2(1), 
                           addr2(0) => addr2(0));
   tower_mod_2 : sr_tower port map( clk => clk, rst => rst, di => di, do1 => 
                           do1_i_2_port, do2 => do2_i_2_port, we => n4, 
                           addr1(4) => addr1(4), addr1(3) => addr1(3), addr1(2)
                           => addr1(2), addr1(1) => addr1(1), addr1(0) => 
                           addr1(0), addr2(4) => addr2(4), addr2(3) => addr2(3)
                           , addr2(2) => addr2(2), addr2(1) => addr2(1), 
                           addr2(0) => addr2(0));
   tower_mod_3 : sr_tower port map( clk => clk, rst => rst, di => di, do1 => 
                           do1_i_3_port, do2 => do2_i_3_port, we => n5, 
                           addr1(4) => addr1(4), addr1(3) => addr1(3), addr1(2)
                           => addr1(2), addr1(1) => addr1(1), addr1(0) => 
                           addr1(0), addr2(4) => addr2(4), addr2(3) => addr2(3)
                           , addr2(2) => addr2(2), addr2(1) => addr2(1), 
                           addr2(0) => addr2(0));
   tower_mod_4 : sr_tower port map( clk => clk, rst => rst, di => di, do1 => 
                           do1_i_4_port, do2 => do2_i_4_port, we => n1, 
                           addr1(4) => addr1(4), addr1(3) => addr1(3), addr1(2)
                           => addr1(2), addr1(1) => addr1(1), addr1(0) => 
                           addr1(0), addr2(4) => addr2(4), addr2(3) => addr2(3)
                           , addr2(2) => addr2(2), addr2(1) => addr2(1), 
                           addr2(0) => addr2(0));
   mux5_do1 : mux5 port map( di(4) => do1_i_4_port, di(3) => do1_i_3_port, 
                           di(2) => do1_i_2_port, di(1) => do1_i_1_port, di(0) 
                           => do1_i_0_port, do => do1_buf, s(2) => addr1(7), 
                           s(1) => addr1(6), s(0) => addr1(5));
   mux5_do2 : mux5 port map( di(4) => do2_i_4_port, di(3) => do2_i_3_port, 
                           di(2) => do2_i_2_port, di(1) => do2_i_1_port, di(0) 
                           => do2_i_0_port, do => do2_buf, s(2) => addr2(7), 
                           s(1) => addr2(6), s(0) => addr2(5));
   demux5_we : demux5 port map( di => we, do(4) => we_i_4_port, do(3) => 
                           we_i_3_port, do(2) => we_i_2_port, do(1) => 
                           we_i_1_port, do(0) => we_i_0_port, s(2) => addr1(7),
                           s(1) => addr1(6), s(0) => addr1(5));
   do1_reg : dfa11 port map( D => do1_buf, CK => clk, R => rst, Q => do1);
   do2_reg : dfa11 port map( D => do2_buf, CK => clk, R => rst, Q => do2);
   U3 : buf40 port map( A => we_i_4_port, Y => n1);
   U4 : buf40 port map( A => we_i_0_port, Y => n2);
   U5 : buf40 port map( A => we_i_1_port, Y => n3);
   U6 : buf40 port map( A => we_i_2_port, Y => n4);
   U7 : buf40 port map( A => we_i_3_port, Y => n5);

end synthesised;



