
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of piece_lut is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal mask_6_port, mask_5_port, mask_4_port, mask_3_port, mask_2_port, 
      mask_1_port, mask_0_port, overflow_port, state_2_port, state_1_port, 
      state_0_port, next_state_2_port, next_state_1_port, next_state_0_port, 
      next_overflow, N42, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64
      , n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, 
      n79, n80, n81, n82, n83, n84, n85, n86 : std_logic;

begin
   mask <= ( next_piece, mask_6_port, mask_5_port, mask_4_port, mask_3_port, 
      mask_2_port, mask_1_port, mask_0_port );
   ready <= N42;
   overflow <= overflow_port;
   rom_addr <= ( piece_type(2), piece_type(1), piece_type(0), rot(1), rot(0), 
      mask_select(1), mask_select(0) );
   
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   overflow1_reg : dfr11 port map( D => next_overflow, R => rst, CK => clk, Q 
                           => overflow_port);
   U48 : na210 port map( A => n54, B => n55, Y => next_state_2_port);
   U49 : mu111 port map( A => state_1_port, B => n56, S => n57, Y => n54);
   U50 : na210 port map( A => state_1_port, B => state_0_port, Y => n56);
   U51 : na310 port map( A => n58, B => n59, C => n60, Y => next_state_1_port);
   U52 : ex210 port map( A => n61, B => state_1_port, Y => n60);
   U53 : iv110 port map( A => n62, Y => n59);
   U54 : na310 port map( A => n63, B => n64, C => x(2), Y => n58);
   U55 : na210 port map( A => n55, B => n65, Y => next_state_0_port);
   U56 : na210 port map( A => state_1_port, B => n61, Y => n65);
   U57 : iv110 port map( A => state_0_port, Y => n61);
   U58 : no210 port map( A => n62, B => n63, Y => n55);
   U59 : no210 port map( A => n66, B => n67, Y => n62);
   U60 : no210 port map( A => draw_start, B => check_start, Y => n66);
   U61 : na210 port map( A => n68, B => n69, Y => next_overflow);
   U62 : na210 port map( A => n70, B => n63, Y => n69);
   U63 : no210 port map( A => n57, B => state_0_port, Y => n63);
   U64 : iv110 port map( A => state_2_port, Y => n57);
   U65 : iv110 port map( A => n71, Y => n70);
   U66 : mu111 port map( A => n72, B => n73, S => state_1_port, Y => n71);
   U67 : na310 port map( A => y(3), B => n74, C => y(2), Y => n73);
   U68 : na210 port map( A => n64, B => x(2), Y => n72);
   U69 : na210 port map( A => overflow_port, B => N42, Y => n68);
   U70 : ex210 port map( A => n75, B => n76, Y => mask_6_port);
   U71 : na210 port map( A => y(2), B => n74, Y => n76);
   U72 : iv110 port map( A => y(3), Y => n75);
   U73 : ex210 port map( A => n74, B => y(2), Y => mask_5_port);
   U74 : na210 port map( A => n77, B => n78, Y => n74);
   U75 : na310 port map( A => rom_data(2), B => n79, C => y(0), Y => n78);
   U76 : na210 port map( A => rom_data(3), B => y(1), Y => n77);
   U77 : ex210 port map( A => n80, B => n79, Y => mask_4_port);
   U78 : ex210 port map( A => rom_data(3), B => y(1), Y => n79);
   U79 : iv110 port map( A => n81, Y => n80);
   U80 : na210 port map( A => rom_data(2), B => y(0), Y => n81);
   U81 : ex210 port map( A => y(0), B => rom_data(2), Y => mask_3_port);
   U82 : ex210 port map( A => n64, B => x(2), Y => mask_2_port);
   U83 : na210 port map( A => n82, B => n83, Y => n64);
   U84 : na310 port map( A => rom_data(0), B => n84, C => x(0), Y => n83);
   U85 : na210 port map( A => rom_data(1), B => x(1), Y => n82);
   U86 : ex210 port map( A => n85, B => n84, Y => mask_1_port);
   U87 : ex210 port map( A => rom_data(1), B => x(1), Y => n84);
   U88 : iv110 port map( A => n86, Y => n85);
   U89 : na210 port map( A => rom_data(0), B => x(0), Y => n86);
   U90 : ex210 port map( A => x(0), B => rom_data(0), Y => mask_0_port);
   U91 : iv110 port map( A => n67, Y => N42);
   U92 : na310 port map( A => state_0_port, B => state_2_port, C => 
                           state_1_port, Y => n67);

end synthesised;



