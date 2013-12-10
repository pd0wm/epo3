
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of piece_lut is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component adder_y
      port( y_in : in std_logic_vector (3 downto 0);  rom_in : in 
            std_logic_vector (1 downto 0);  y_out : out std_logic_vector (4 
            downto 0));
   end component;
   
   component adder_x
      port( x_in : in std_logic_vector (2 downto 0);  rom_in : in 
            std_logic_vector (1 downto 0);  x_out : out std_logic_vector (3 
            downto 0));
   end component;
   
   signal mask_7_port, mask_6_port, mask_5_port, mask_4_port, mask_3_port, 
      mask_2_port, mask_1_port, mask_0_port, ready_port, rom_addr_6_port, 
      rom_addr_5_port, rom_addr_4_port, rom_addr_3_port, rom_addr_2_port, 
      rom_addr_1_port, rom_addr_0_port, x_out_3_port, x_out_2_port, 
      x_out_1_port, x_out_0_port, y_out_4_port, y_out_3_port, y_out_2_port, 
      y_out_1_port, y_out_0_port, state_2_port, state_1_port, state_0_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, new_mask_7_port,
      new_mask_6_port, new_mask_5_port, new_mask_4_port, new_mask_3_port, 
      new_mask_2_port, new_mask_1_port, new_mask_0_port, new_rom_addr_6_port, 
      new_rom_addr_5_port, new_rom_addr_4_port, new_rom_addr_3_port, 
      new_rom_addr_2_port, new_rom_addr_1_port, new_rom_addr_0_port, n57, n58, 
      n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73
      , n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, 
      n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, 
      n102, n103, n104, n105, n106, n107, n108, n109 : std_logic;

begin
   mask <= ( mask_7_port, mask_6_port, mask_5_port, mask_4_port, mask_3_port, 
      mask_2_port, mask_1_port, mask_0_port );
   ready <= ready_port;
   rom_addr <= ( rom_addr_6_port, rom_addr_5_port, rom_addr_4_port, 
      rom_addr_3_port, rom_addr_2_port, rom_addr_1_port, rom_addr_0_port );
   
   lbl_adder_x : adder_x port map( x_in(2) => x(2), x_in(1) => x(1), x_in(0) =>
                           x(0), rom_in(1) => rom_data(1), rom_in(0) => 
                           rom_data(0), x_out(3) => x_out_3_port, x_out(2) => 
                           x_out_2_port, x_out(1) => x_out_1_port, x_out(0) => 
                           x_out_0_port);
   lbl_adder_y : adder_y port map( y_in(3) => y(3), y_in(2) => y(2), y_in(1) =>
                           y(1), y_in(0) => y(0), rom_in(1) => rom_data(3), 
                           rom_in(0) => rom_data(2), y_out(4) => y_out_4_port, 
                           y_out(3) => y_out_3_port, y_out(2) => y_out_2_port, 
                           y_out(1) => y_out_1_port, y_out(0) => y_out_0_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   cur_rom_addr_reg_6_inst : dfr11 port map( D => new_rom_addr_6_port, R => rst
                           , CK => clk, Q => rom_addr_6_port);
   cur_rom_addr_reg_5_inst : dfr11 port map( D => new_rom_addr_5_port, R => rst
                           , CK => clk, Q => rom_addr_5_port);
   cur_rom_addr_reg_4_inst : dfr11 port map( D => new_rom_addr_4_port, R => rst
                           , CK => clk, Q => rom_addr_4_port);
   cur_rom_addr_reg_3_inst : dfr11 port map( D => new_rom_addr_3_port, R => rst
                           , CK => clk, Q => rom_addr_3_port);
   cur_rom_addr_reg_2_inst : dfr11 port map( D => new_rom_addr_2_port, R => rst
                           , CK => clk, Q => rom_addr_2_port);
   cur_rom_addr_reg_1_inst : dfr11 port map( D => new_rom_addr_1_port, R => rst
                           , CK => clk, Q => rom_addr_1_port);
   cur_rom_addr_reg_0_inst : dfr11 port map( D => new_rom_addr_0_port, R => rst
                           , CK => clk, Q => rom_addr_0_port);
   cur_mask_reg_7_inst : dfr11 port map( D => new_mask_7_port, R => rst, CK => 
                           clk, Q => mask_7_port);
   cur_mask_reg_6_inst : dfr11 port map( D => new_mask_6_port, R => rst, CK => 
                           clk, Q => mask_6_port);
   cur_mask_reg_5_inst : dfr11 port map( D => new_mask_5_port, R => rst, CK => 
                           clk, Q => mask_5_port);
   cur_mask_reg_4_inst : dfr11 port map( D => new_mask_4_port, R => rst, CK => 
                           clk, Q => mask_4_port);
   cur_mask_reg_3_inst : dfr11 port map( D => new_mask_3_port, R => rst, CK => 
                           clk, Q => mask_3_port);
   cur_mask_reg_2_inst : dfr11 port map( D => new_mask_2_port, R => rst, CK => 
                           clk, Q => mask_2_port);
   cur_mask_reg_1_inst : dfr11 port map( D => new_mask_1_port, R => rst, CK => 
                           clk, Q => mask_1_port);
   cur_mask_reg_0_inst : dfr11 port map( D => new_mask_0_port, R => rst, CK => 
                           clk, Q => mask_0_port);
   U78 : no310 port map( A => n57, B => state_0_port, C => n58, Y => overflow);
   U79 : mu111 port map( A => n59, B => n60, S => n57, Y => next_state_2_port);
   U80 : no210 port map( A => n58, B => n61, Y => n60);
   U81 : na210 port map( A => n62, B => state_1_port, Y => n59);
   U82 : iv110 port map( A => n63, Y => next_state_1_port);
   U83 : no310 port map( A => n64, B => ready_port, C => n65, Y => n63);
   U84 : na310 port map( A => n66, B => n67, C => n68, Y => next_state_0_port);
   U85 : na210 port map( A => ready_port, B => state_0_port, Y => n68);
   U86 : no310 port map( A => n58, B => n62, C => n57, Y => ready_port);
   U87 : iv110 port map( A => n69, Y => n66);
   U88 : no210 port map( A => n70, B => state_1_port, Y => n69);
   U89 : no210 port map( A => n71, B => n72, Y => n70);
   U90 : no210 port map( A => n57, B => n73, Y => n72);
   U91 : no210 port map( A => n61, B => n74, Y => n73);
   U92 : no210 port map( A => y_out_4_port, B => x_out_3_port, Y => n74);
   U93 : no210 port map( A => n62, B => state_0_port, Y => n71);
   U94 : no210 port map( A => draw_start, B => check_start, Y => n62);
   U95 : na210 port map( A => n75, B => n76, Y => new_rom_addr_6_port);
   U96 : na210 port map( A => rom_addr_6_port, B => n77, Y => n76);
   U97 : na210 port map( A => piece_type(2), B => n64, Y => n75);
   U98 : na210 port map( A => n78, B => n79, Y => new_rom_addr_5_port);
   U99 : na210 port map( A => rom_addr_5_port, B => n77, Y => n79);
   U100 : na210 port map( A => piece_type(1), B => n64, Y => n78);
   U101 : na210 port map( A => n80, B => n81, Y => new_rom_addr_4_port);
   U102 : na210 port map( A => rom_addr_4_port, B => n77, Y => n81);
   U103 : na210 port map( A => piece_type(0), B => n64, Y => n80);
   U104 : na210 port map( A => n82, B => n83, Y => new_rom_addr_3_port);
   U105 : na210 port map( A => rom_addr_3_port, B => n77, Y => n83);
   U106 : na210 port map( A => rot(1), B => n64, Y => n82);
   U107 : na210 port map( A => n84, B => n85, Y => new_rom_addr_2_port);
   U108 : na210 port map( A => rom_addr_2_port, B => n77, Y => n85);
   U109 : na210 port map( A => rot(0), B => n64, Y => n84);
   U110 : na210 port map( A => n86, B => n87, Y => new_rom_addr_1_port);
   U111 : na210 port map( A => rom_addr_1_port, B => n77, Y => n87);
   U112 : na210 port map( A => mask_select(1), B => n64, Y => n86);
   U113 : na210 port map( A => n88, B => n89, Y => new_rom_addr_0_port);
   U114 : na210 port map( A => rom_addr_0_port, B => n77, Y => n89);
   U115 : na210 port map( A => n90, B => n91, Y => n77);
   U116 : na210 port map( A => mask_select(0), B => n64, Y => n88);
   U117 : na210 port map( A => n92, B => n93, Y => new_mask_7_port);
   U118 : na210 port map( A => mask_7_port, B => n94, Y => n93);
   U119 : na210 port map( A => next_piece, B => n95, Y => n92);
   U120 : na210 port map( A => n96, B => n97, Y => new_mask_6_port);
   U121 : na210 port map( A => mask_6_port, B => n94, Y => n97);
   U122 : na210 port map( A => y_out_3_port, B => n95, Y => n96);
   U123 : na210 port map( A => n98, B => n99, Y => new_mask_5_port);
   U124 : na210 port map( A => mask_5_port, B => n94, Y => n99);
   U125 : na210 port map( A => y_out_2_port, B => n95, Y => n98);
   U126 : na210 port map( A => n100, B => n101, Y => new_mask_4_port);
   U127 : na210 port map( A => mask_4_port, B => n94, Y => n101);
   U128 : na210 port map( A => y_out_1_port, B => n95, Y => n100);
   U129 : na210 port map( A => n102, B => n103, Y => new_mask_3_port);
   U130 : na210 port map( A => mask_3_port, B => n94, Y => n103);
   U131 : na210 port map( A => y_out_0_port, B => n95, Y => n102);
   U132 : na210 port map( A => n104, B => n105, Y => new_mask_2_port);
   U133 : na210 port map( A => mask_2_port, B => n94, Y => n105);
   U134 : na210 port map( A => x_out_2_port, B => n95, Y => n104);
   U135 : na210 port map( A => n106, B => n107, Y => new_mask_1_port);
   U136 : na210 port map( A => mask_1_port, B => n94, Y => n107);
   U137 : na210 port map( A => x_out_1_port, B => n95, Y => n106);
   U138 : na210 port map( A => n108, B => n109, Y => new_mask_0_port);
   U139 : na210 port map( A => mask_0_port, B => n94, Y => n109);
   U140 : na210 port map( A => n90, B => n67, Y => n94);
   U141 : iv110 port map( A => n64, Y => n67);
   U142 : no310 port map( A => state_0_port, B => state_2_port, C => n58, Y => 
                           n64);
   U143 : iv110 port map( A => state_1_port, Y => n58);
   U144 : mu111 port map( A => n65, B => n61, S => n57, Y => n90);
   U145 : iv110 port map( A => state_2_port, Y => n57);
   U146 : na210 port map( A => x_out_0_port, B => n95, Y => n108);
   U147 : iv110 port map( A => n91, Y => n95);
   U148 : na210 port map( A => n65, B => state_2_port, Y => n91);
   U149 : no210 port map( A => n61, B => state_1_port, Y => n65);
   U150 : iv110 port map( A => state_0_port, Y => n61);

end synthesised;



