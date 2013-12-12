
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_field_trans is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   component vga_counter_8bitset
      port( clk, rst, rst_ext, en, set : in std_logic;  di : in 
            std_logic_vector (7 downto 0);  val : out std_logic_vector (7 
            downto 0));
   end component;
   
   signal X_Logic0_port, mem_addr_enable, counter_state_2_port, 
      counter_state_1_port, counter_state_0_port, N16, N17, N18, n1, n2, n3, n4
      , n5, n6, n9, n11, n18_port, n19, n20, n21, n22 : std_logic;

begin
   
   mem_addr_counter : vga_counter_8bitset port map( clk => clk, rst => rst, 
                           rst_ext => X_Logic0_port, en => mem_addr_enable, set
                           => n9, di(7) => X_Logic0_port, di(6) => 
                           mem_addr_reset_in(3), di(5) => mem_addr_reset_in(2),
                           di(4) => mem_addr_reset_in(1), di(3) => 
                           mem_addr_reset_in(0), di(2) => X_Logic0_port, di(1) 
                           => X_Logic0_port, di(0) => X_Logic0_port, val(7) => 
                           mem_addr_out(7), val(6) => mem_addr_out(6), val(5) 
                           => mem_addr_out(5), val(4) => mem_addr_out(4), 
                           val(3) => mem_addr_out(3), val(2) => mem_addr_out(2)
                           , val(1) => mem_addr_out(1), val(0) => 
                           mem_addr_out(0));
   X_Logic0_port <= '0';
   counter_state_reg_0_inst : dfa11 port map( D => n6, CK => clk, R => rst, Q 
                           => counter_state_0_port);
   counter_state_reg_1_inst : dfa11 port map( D => n4, CK => clk, R => rst, Q 
                           => counter_state_1_port);
   counter_state_reg_2_inst : dfa11 port map( D => n2, CK => clk, R => rst, Q 
                           => counter_state_2_port);
   U3 : na210 port map( A => N18, B => n11, Y => n1);
   U4 : iv110 port map( A => n1, Y => n2);
   U5 : na210 port map( A => N17, B => n11, Y => n3);
   U6 : iv110 port map( A => n3, Y => n4);
   U7 : na210 port map( A => N16, B => n11, Y => n5);
   U8 : iv110 port map( A => n5, Y => n6);
   U24 : iv110 port map( A => n11, Y => n9);
   U25 : no210 port map( A => new_frame_in, B => new_line_in, Y => n11);
   U26 : no310 port map( A => n18_port, B => counter_state_1_port, C => n19, Y 
                           => mem_addr_enable);
   U27 : iv110 port map( A => counter_state_2_port, Y => n18_port);
   U28 : mu111 port map( A => n20, B => n19, S => counter_state_2_port, Y => 
                           N18);
   U29 : no210 port map( A => n19, B => n21, Y => n20);
   U30 : iv110 port map( A => counter_state_1_port, Y => n21);
   U31 : mu111 port map( A => n22, B => n19, S => counter_state_1_port, Y => 
                           N17);
   U32 : no210 port map( A => counter_state_2_port, B => n19, Y => n22);
   U33 : na210 port map( A => in_field_in, B => counter_state_0_port, Y => n19)
                           ;
   U34 : ex210 port map( A => in_field_in, B => counter_state_0_port, Y => N16)
                           ;

end synthesised;



