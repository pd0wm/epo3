
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_field_trans_reset is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   component vga_counter_4bit
      port( clk, rst, rst_ext, en : in std_logic;  val : out std_logic_vector 
            (3 downto 0));
   end component;
   
   signal mem_addr_enable, counter_state_4_port, counter_state_3_port, 
      counter_state_2_port, counter_state_1_port, counter_state_0_port, N24, 
      N25, N26, N27, N28, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n28_port, 
      n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43
      , n44, n45, n46, n47, n48 : std_logic;

begin
   
   mem_addr_counter : vga_counter_4bit port map( clk => clk, rst => rst, 
                           rst_ext => end_frame_in, en => mem_addr_enable, 
                           val(3) => mem_addr_reset_out(3), val(2) => 
                           mem_addr_reset_out(2), val(1) => 
                           mem_addr_reset_out(1), val(0) => 
                           mem_addr_reset_out(0));
   counter_state_reg_0_inst : dfa11 port map( D => n10, CK => clk, R => rst, Q 
                           => counter_state_0_port);
   counter_state_reg_4_inst : dfa11 port map( D => n8, CK => clk, R => rst, Q 
                           => counter_state_4_port);
   counter_state_reg_1_inst : dfa11 port map( D => n6, CK => clk, R => rst, Q 
                           => counter_state_1_port);
   counter_state_reg_2_inst : dfa11 port map( D => n4, CK => clk, R => rst, Q 
                           => counter_state_2_port);
   counter_state_reg_3_inst : dfa11 port map( D => n2, CK => clk, R => rst, Q 
                           => counter_state_3_port);
   U3 : no210 port map( A => end_frame_in, B => n1, Y => n2);
   U4 : iv110 port map( A => N27, Y => n1);
   U5 : no210 port map( A => end_frame_in, B => n3, Y => n4);
   U6 : iv110 port map( A => N26, Y => n3);
   U7 : no210 port map( A => end_frame_in, B => n5, Y => n6);
   U8 : iv110 port map( A => N25, Y => n5);
   U9 : no210 port map( A => end_frame_in, B => n7, Y => n8);
   U10 : iv110 port map( A => N28, Y => n7);
   U11 : no210 port map( A => end_frame_in, B => n9, Y => n10);
   U12 : iv110 port map( A => N24, Y => n9);
   U36 : no310 port map( A => n28_port, B => n29, C => n30, Y => 
                           mem_addr_enable);
   U37 : iv110 port map( A => n31, Y => n30);
   U38 : na210 port map( A => n32, B => n33, Y => N28);
   U39 : na310 port map( A => n34, B => counter_state_3_port, C => n35, Y => 
                           n33);
   U40 : no210 port map( A => counter_state_4_port, B => n29, Y => n35);
   U41 : na210 port map( A => counter_state_4_port, B => n36, Y => n32);
   U42 : mu111 port map( A => n37, B => n36, S => counter_state_3_port, Y => 
                           N27);
   U43 : na210 port map( A => end_field_line_in, B => n38, Y => n36);
   U44 : no210 port map( A => n29, B => n39, Y => n37);
   U45 : mu111 port map( A => n40, B => n41, S => counter_state_2_port, Y => 
                           N26);
   U46 : iv110 port map( A => n42, Y => n41);
   U47 : no210 port map( A => n43, B => n44, Y => n42);
   U48 : no310 port map( A => n39, B => n45, C => n44, Y => n40);
   U49 : mu111 port map( A => n43, B => n46, S => n44, Y => N25);
   U50 : iv110 port map( A => counter_state_1_port, Y => n44);
   U51 : no210 port map( A => n45, B => n39, Y => n46);
   U52 : iv110 port map( A => counter_state_0_port, Y => n45);
   U53 : na210 port map( A => end_field_line_in, B => counter_state_0_port, Y 
                           => n43);
   U54 : mu111 port map( A => n34, B => n28_port, S => counter_state_0_port, Y 
                           => N24);
   U55 : iv110 port map( A => end_field_line_in, Y => n28_port);
   U56 : iv110 port map( A => n39, Y => n34);
   U57 : na210 port map( A => end_field_line_in, B => n47, Y => n39);
   U58 : na210 port map( A => n31, B => n38, Y => n47);
   U59 : iv110 port map( A => n29, Y => n38);
   U60 : na310 port map( A => counter_state_1_port, B => counter_state_0_port, 
                           C => counter_state_2_port, Y => n29);
   U61 : no210 port map( A => n48, B => counter_state_3_port, Y => n31);
   U62 : iv110 port map( A => counter_state_4_port, Y => n48);

end synthesised;



