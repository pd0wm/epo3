
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of timer is

   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component timer_det
      port( cnt_val : in std_logic_vector (4 downto 0);  time : in std_logic;  
            done : out std_logic);
   end component;
   
   component timer_counter
      port( clk, rst, rst2 : in std_logic;  value : out std_logic_vector (4 
            downto 0);  en : in std_logic);
   end component;
   
   signal cnt_val_4_port, cnt_val_3_port, cnt_val_2_port, cnt_val_1_port, 
      cnt_val_0_port, timer_done, state_next_2_port, state_next_1_port, 
      state_next_0_port, state_2_port, state_1_port, state_0_port, N18, n8, n23
      , n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, 
      n38, n39, n40, n41 : std_logic;

begin
   
   counter : timer_counter port map( clk => clk, rst => n8, rst2 => N18, 
                           value(4) => cnt_val_4_port, value(3) => 
                           cnt_val_3_port, value(2) => cnt_val_2_port, value(1)
                           => cnt_val_1_port, value(0) => cnt_val_0_port, en =>
                           n23);
   donecheck : timer_det port map( cnt_val(4) => cnt_val_4_port, cnt_val(3) => 
                           cnt_val_3_port, cnt_val(2) => cnt_val_2_port, 
                           cnt_val(1) => cnt_val_1_port, cnt_val(0) => 
                           cnt_val_0_port, time => time, done => timer_done);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => n8, CK => 
                           clk, Q => state_0_port);
   state_reg_2_inst : dfr11 port map( D => state_next_2_port, R => n8, CK => 
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => state_next_1_port, R => n8, CK => 
                           clk, Q => state_1_port);
   U30 : na310 port map( A => n24, B => n25, C => n26, Y => state_next_2_port);
   U31 : iv110 port map( A => n27, Y => n26);
   U32 : no210 port map( A => n28, B => n29, Y => n27);
   U33 : mu111 port map( A => state_2_port, B => n30, S => n31, Y => n28);
   U34 : na210 port map( A => n32, B => n33, Y => state_next_1_port);
   U35 : na310 port map( A => n34, B => n29, C => n35, Y => n33);
   U36 : mu111 port map( A => state_0_port, B => n36, S => state_2_port, Y => 
                           n35);
   U37 : no210 port map( A => timer_done, B => state_0_port, Y => n36);
   U38 : iv110 port map( A => vga_clk, Y => n29);
   U39 : na210 port map( A => n37, B => n31, Y => n32);
   U40 : na310 port map( A => n38, B => n24, C => n39, Y => state_next_0_port);
   U41 : na210 port map( A => start, B => N18, Y => n39);
   U42 : na310 port map( A => n40, B => n31, C => timer_done, Y => n24);
   U43 : iv110 port map( A => n30, Y => n40);
   U44 : na310 port map( A => n37, B => n31, C => vga_clk, Y => n38);
   U45 : no210 port map( A => n31, B => n30, Y => ready);
   U46 : na210 port map( A => state_2_port, B => n34, Y => n30);
   U47 : iv110 port map( A => state_0_port, Y => n31);
   U48 : iv110 port map( A => n41, Y => n8);
   U49 : no210 port map( A => cnt_rst, B => rst, Y => n41);
   U50 : iv110 port map( A => n25, Y => n23);
   U51 : na210 port map( A => state_0_port, B => n37, Y => n25);
   U52 : no210 port map( A => n34, B => state_2_port, Y => n37);
   U53 : iv110 port map( A => state_1_port, Y => n34);
   U54 : no310 port map( A => state_1_port, B => state_2_port, C => 
                           state_0_port, Y => N18);

end synthesised;



