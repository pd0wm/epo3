
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_trans_reset is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal mem_addr_reset_out_6_port, mem_addr_reset_out_5_port, 
      mem_addr_reset_out_4_port, mem_addr_reset_out_3_port, 
      counter_state_3_port, counter_state_2_port, counter_state_1_port, 
      counter_state_0_port, N16, N17, N18, N19, N20, N21, N22, n9, n10, n11, 
      n12, n13, n14, n15, n16_port, n17_port, n18_port, n25, n26, n27, n28, n29
      , n30, n31, n32, n33, n34, n35, n36, n37 : std_logic;

begin
   mem_addr_reset_out <= ( mem_addr_reset_out_6_port, mem_addr_reset_out_5_port
      , mem_addr_reset_out_4_port, mem_addr_reset_out_3_port, N18, N17, N16 );
   
   counter_state_reg_0_inst : dfa11 port map( D => n26, CK => clk, R => rst, Q 
                           => counter_state_0_port);
   counter_state_reg_1_inst : dfa11 port map( D => n25, CK => clk, R => rst, Q 
                           => counter_state_1_port);
   mem_addr_state_reg_3_inst : dfa11 port map( D => n18_port, CK => clk, R => 
                           rst, Q => mem_addr_reset_out_3_port);
   mem_addr_state_reg_4_inst : dfa11 port map( D => n16_port, CK => clk, R => 
                           rst, Q => mem_addr_reset_out_4_port);
   mem_addr_state_reg_5_inst : dfa11 port map( D => n14, CK => clk, R => rst, Q
                           => mem_addr_reset_out_5_port);
   mem_addr_state_reg_6_inst : dfa11 port map( D => n12, CK => clk, R => rst, Q
                           => mem_addr_reset_out_6_port);
   counter_state_reg_2_inst : dfa11 port map( D => n10, CK => clk, R => rst, Q 
                           => counter_state_2_port);
   counter_state_reg_3_inst : dfa11 port map( D => n9, CK => clk, R => rst, Q 
                           => counter_state_3_port);
   U15 : no210 port map( A => end_frame_in, B => n11, Y => n12);
   U16 : iv110 port map( A => N22, Y => n11);
   U17 : no210 port map( A => end_frame_in, B => n13, Y => n14);
   U18 : iv110 port map( A => N21, Y => n13);
   U19 : no210 port map( A => end_frame_in, B => n15, Y => n16_port);
   U20 : iv110 port map( A => N20, Y => n15);
   U21 : no210 port map( A => end_frame_in, B => n17_port, Y => n18_port);
   U22 : iv110 port map( A => N19, Y => n17_port);
   N16 <= '0';
   N17 <= '0';
   N18 <= '0';
   U32 : iv110 port map( A => n27, Y => n9);
   U33 : ex210 port map( A => counter_state_3_port, B => n28, Y => n27);
   U34 : na210 port map( A => counter_state_2_port, B => n29, Y => n28);
   U35 : ex210 port map( A => end_field_line_in, B => counter_state_0_port, Y 
                           => n26);
   U36 : ex210 port map( A => n30, B => n31, Y => n25);
   U37 : ex210 port map( A => counter_state_2_port, B => n29, Y => n10);
   U38 : ex210 port map( A => mem_addr_reset_out_6_port, B => n32, Y => N22);
   U39 : no210 port map( A => n33, B => n34, Y => n32);
   U40 : ex210 port map( A => n34, B => n33, Y => N21);
   U41 : na210 port map( A => mem_addr_reset_out_4_port, B => n35, Y => n33);
   U42 : iv110 port map( A => mem_addr_reset_out_5_port, Y => n34);
   U43 : ex210 port map( A => mem_addr_reset_out_4_port, B => n35, Y => N20);
   U44 : no210 port map( A => n36, B => n37, Y => n35);
   U45 : ex210 port map( A => n36, B => n37, Y => N19);
   U46 : na310 port map( A => counter_state_2_port, B => n29, C => 
                           counter_state_3_port, Y => n37);
   U47 : no210 port map( A => n30, B => n31, Y => n29);
   U48 : na210 port map( A => end_field_line_in, B => counter_state_0_port, Y 
                           => n31);
   U49 : iv110 port map( A => counter_state_1_port, Y => n30);
   U50 : iv110 port map( A => mem_addr_reset_out_3_port, Y => n36);

end synthesised;



