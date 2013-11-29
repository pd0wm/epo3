library IEEE;
use IEEE.std_logic_1164.ALL;

library CellsLib;
architecture bit4_behav of bit4 is
   component dfr11
      port (D:in std_logic;
            R:in std_logic;
            CK:in std_logic;
            Q:out std_logic);
   end component;
   component mu111
      port (A:in std_logic;
            B:in std_logic;
            S:in std_logic;
            Y:out std_logic);
   end component;
   component no210
      port (A:in std_logic;
            B:in std_logic;
            Y:out std_logic);
   end component;
   component mu210
      port (S1:in std_logic;
            S2:in std_logic;
            A:in std_logic;
            B:in std_logic;
            C:in std_logic;
            D:in std_logic;
            Y:out std_logic);
   end component;
   component tbuf10
      port (A:in std_logic;
            E:in std_logic;
            Y:out std_logic);
   end component;
   signal net_0: std_logic;
   signal net_1: std_logic;
   signal net_2: std_logic;
   signal net_3: std_logic;
   signal net_4: std_logic;
   signal net_5: std_logic;
   signal net_6: std_logic;
   signal net_7: std_logic;
   signal net_8: std_logic;
   signal net_9: std_logic;
   signal net_10: std_logic;
   signal net_11: std_logic;
   signal net_12: std_logic;
   signal net_13: std_logic;
   signal net_14: std_logic;
   signal net_15: std_logic;
begin
   do_2 <= net_1; 
   do_1 <= net_0; 
   dfr11_0 : dfr11 port map (D => net_8, R => rst, CK => clk, Q => net_2);
   mu111_1 : mu111 port map (A => net_2, B => di, S => net_12, Y => net_8);
   no210_2 : no210 port map (A => we1, B => we_com, Y => net_12);
   no210_3 : no210 port map (A => we3, B => we_com, Y => net_14);
   no210_4 : no210 port map (A => we2, B => we_com, Y => net_13);
   no210_5 : no210 port map (A => we4, B => we_com, Y => net_15);
   dfr11_6 : dfr11 port map (D => net_11, R => rst, CK => clk, Q => net_5);
   dfr11_7 : dfr11 port map (D => net_10, R => rst, CK => clk, Q => net_4);
   dfr11_8 : dfr11 port map (D => net_9, R => rst, CK => clk, Q => net_3);
   mu111_9 : mu111 port map (A => net_4, B => di, S => net_14, Y => net_10);
   mu111_10 : mu111 port map (A => net_3, B => di, S => net_13, Y => net_9);
   mu111_11 : mu111 port map (A => net_5, B => di, S => net_15, Y => net_11);
   mu210_12 : mu210 port map (S1 => addr1_1, S2 => addr1_2, A => net_2, 
                              B => net_3,C => net_4, D => net_5, Y => net_6);
   mu210_13 : mu210 port map (S1 => addr2_1, S2 => addr2_2, A => net_2, 
                              B => net_3,C => net_4, D => net_5, Y => net_7);
   tbuf10_14 : tbuf10 port map (A => net_6, E => re_1, Y => net_0);
   tbuf10_15 : tbuf10 port map (A => net_7, E => re_2, Y => net_1);
end bit4_behav;

