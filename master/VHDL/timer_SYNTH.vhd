
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
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
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
      cnt_val_0_port, timer_done, state_next_1_port, state_next_0_port, 
      state_2_port, state_1_port, state_0_port, N17, n1, n8, ready_port, n29, 
      n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44
      , n45, n46, n47, n48, n49, n50, n51, n52, n53 : std_logic;

begin
   ready <= ready_port;
   
   counter : timer_counter port map( clk => clk, rst => n8, rst2 => N17, 
                           value(4) => cnt_val_4_port, value(3) => 
                           cnt_val_3_port, value(2) => cnt_val_2_port, value(1)
                           => cnt_val_1_port, value(0) => cnt_val_0_port, en =>
                           n29);
   donecheck : timer_det port map( cnt_val(4) => cnt_val_4_port, cnt_val(3) => 
                           cnt_val_3_port, cnt_val(2) => cnt_val_2_port, 
                           cnt_val(1) => cnt_val_1_port, cnt_val(0) => 
                           cnt_val_0_port, time => time, done => timer_done);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => n8, CK => 
                           clk, Q => state_0_port);
   state_reg_2_inst : dfr11 port map( D => n1, R => n8, CK => clk, Q => 
                           state_2_port);
   state_reg_1_inst : dfr11 port map( D => state_next_1_port, R => n8, CK => 
                           clk, Q => state_1_port);
   U35 : na210 port map( A => n30, B => n31, Y => state_next_1_port);
   U36 : na210 port map( A => n32, B => n33, Y => n31);
   U37 : na210 port map( A => n34, B => n35, Y => n32);
   U38 : na310 port map( A => n36, B => n37, C => state_0_port, Y => n35);
   U39 : iv110 port map( A => state_1_port, Y => n36);
   U40 : na210 port map( A => n38, B => n39, Y => n34);
   U41 : iv110 port map( A => timer_done, Y => n39);
   U42 : na210 port map( A => n40, B => n41, Y => n30);
   U43 : na310 port map( A => n42, B => n43, C => n44, Y => state_next_0_port);
   U44 : mu111 port map( A => n45, B => n46, S => n41, Y => n44);
   U45 : na210 port map( A => vga_clk, B => n40, Y => n46);
   U46 : iv110 port map( A => n47, Y => n40);
   U47 : na210 port map( A => start, B => N17, Y => n42);
   U48 : iv110 port map( A => n48, Y => n8);
   U49 : no210 port map( A => cnt_rst, B => rst, Y => n48);
   U50 : na310 port map( A => n45, B => n43, C => n49, Y => n1);
   U51 : no210 port map( A => n29, B => n50, Y => n49);
   U52 : no310 port map( A => n33, B => state_2_port, C => n41, Y => n50);
   U53 : iv110 port map( A => vga_clk, Y => n33);
   U54 : no210 port map( A => n47, B => n41, Y => n29);
   U55 : na210 port map( A => state_1_port, B => n37, Y => n47);
   U56 : na210 port map( A => timer_done, B => n38, Y => n43);
   U57 : iv110 port map( A => n51, Y => n45);
   U58 : na210 port map( A => n52, B => n53, Y => n51);
   U59 : na210 port map( A => vga_clk, B => n38, Y => n53);
   U60 : no310 port map( A => state_0_port, B => state_1_port, C => n37, Y => 
                           n38);
   U61 : na210 port map( A => ready_port, B => start, Y => n52);
   U62 : no310 port map( A => n41, B => state_1_port, C => n37, Y => ready_port
                           );
   U63 : iv110 port map( A => state_2_port, Y => n37);
   U64 : iv110 port map( A => state_0_port, Y => n41);
   U65 : no310 port map( A => state_1_port, B => state_2_port, C => 
                           state_0_port, Y => N17);

end synthesised;



