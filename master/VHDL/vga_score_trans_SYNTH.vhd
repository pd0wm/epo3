
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_score_trans is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   component vga_counter_3bit
      port( clk, rst, rst_ext, en : in std_logic;  val : out std_logic_vector 
            (2 downto 0));
   end component;
   
   signal X_Logic1_port, X_Logic0_port, mem_addr_out_2_port, 
      mem_addr_out_1_port, mem_addr_out_0_port, mem_addr_enable, 
      counter_state_4_port, counter_state_3_port, counter_state_2_port, 
      counter_state_1_port, counter_state_0_port, N19, N20, N21, N22, N23, n1, 
      n2, n3, n4, n5, n6, n7, n8, n9, n10, n27, n28, n29, n30, n31, n32, n33, 
      n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45 : std_logic;

begin
   mem_addr_out <= ( X_Logic1_port, X_Logic0_port, X_Logic0_port, X_Logic1_port
      , X_Logic0_port, mem_addr_out_2_port, mem_addr_out_1_port, 
      mem_addr_out_0_port );
   
   mem_addr_counter : vga_counter_3bit port map( clk => clk, rst => rst, 
                           rst_ext => end_frame_in, en => mem_addr_enable, 
                           val(2) => mem_addr_out_2_port, val(1) => 
                           mem_addr_out_1_port, val(0) => mem_addr_out_0_port);
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   counter_state_reg_0_inst : dfa11 port map( D => n10, CK => clk, R => rst, Q 
                           => counter_state_0_port);
   counter_state_reg_1_inst : dfa11 port map( D => n8, CK => clk, R => rst, Q 
                           => counter_state_1_port);
   counter_state_reg_2_inst : dfa11 port map( D => n6, CK => clk, R => rst, Q 
                           => counter_state_2_port);
   counter_state_reg_3_inst : dfa11 port map( D => n4, CK => clk, R => rst, Q 
                           => counter_state_3_port);
   counter_state_reg_4_inst : dfa11 port map( D => n2, CK => clk, R => rst, Q 
                           => counter_state_4_port);
   U3 : no210 port map( A => end_frame_in, B => n1, Y => n2);
   U4 : iv110 port map( A => N23, Y => n1);
   U5 : no210 port map( A => end_frame_in, B => n3, Y => n4);
   U6 : iv110 port map( A => N22, Y => n3);
   U7 : no210 port map( A => end_frame_in, B => n5, Y => n6);
   U8 : iv110 port map( A => N21, Y => n5);
   U9 : no210 port map( A => end_frame_in, B => n7, Y => n8);
   U10 : iv110 port map( A => N20, Y => n7);
   U11 : no210 port map( A => end_frame_in, B => n9, Y => n10);
   U12 : iv110 port map( A => N19, Y => n9);
   U35 : no210 port map( A => n27, B => n28, Y => mem_addr_enable);
   U36 : na210 port map( A => n29, B => n30, Y => N23);
   U37 : na310 port map( A => counter_state_3_port, B => n31, C => n32, Y => 
                           n30);
   U38 : na210 port map( A => counter_state_4_port, B => n33, Y => n29);
   U39 : iv110 port map( A => n34, Y => n33);
   U40 : no210 port map( A => n35, B => n32, Y => n34);
   U41 : mu111 port map( A => n36, B => n35, S => counter_state_3_port, Y => 
                           N22);
   U42 : na210 port map( A => end_score_line_in, B => n31, Y => n35);
   U43 : no210 port map( A => n37, B => n38, Y => n36);
   U44 : mu111 port map( A => n39, B => n40, S => counter_state_2_port, Y => 
                           N21);
   U45 : iv110 port map( A => n41, Y => n40);
   U46 : no210 port map( A => n42, B => n43, Y => n41);
   U47 : no310 port map( A => n38, B => n44, C => n43, Y => n39);
   U48 : mu111 port map( A => n42, B => n45, S => n43, Y => N20);
   U49 : iv110 port map( A => counter_state_1_port, Y => n43);
   U50 : no210 port map( A => n44, B => n38, Y => n45);
   U51 : iv110 port map( A => counter_state_0_port, Y => n44);
   U52 : na210 port map( A => end_score_line_in, B => counter_state_0_port, Y 
                           => n42);
   U53 : mu111 port map( A => n32, B => n28, S => counter_state_0_port, Y => 
                           N19);
   U54 : iv110 port map( A => end_score_line_in, Y => n28);
   U55 : iv110 port map( A => n38, Y => n32);
   U56 : na210 port map( A => end_score_line_in, B => n27, Y => n38);
   U57 : na310 port map( A => counter_state_3_port, B => n31, C => 
                           counter_state_4_port, Y => n27);
   U58 : iv110 port map( A => n37, Y => n31);
   U59 : na310 port map( A => counter_state_1_port, B => counter_state_0_port, 
                           C => counter_state_2_port, Y => n37);

end synthesised;



