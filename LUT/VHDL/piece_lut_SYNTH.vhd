
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of piece_lut is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal mask_6_port, mask_5_port, mask_4_port, mask_3_port, mask_2_port, 
      mask_0_port, state_2_port, state_1_port, state_0_port, next_state_2_port,
      next_state_1_port, next_state_0_port, n47, n48, n49, n50, n51, n52, n53, 
      n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68
      , n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, mask_1_port
      : std_logic;

begin
   mask <= ( next_piece, mask_6_port, mask_5_port, mask_4_port, mask_3_port, 
      mask_2_port, mask_1_port, mask_0_port );
   rom_addr <= ( piece_type(2), piece_type(1), piece_type(0), rot(1), rot(0), 
      mask_select(1), mask_select(0) );
   
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   U40 : na310 port map( A => n47, B => n48, C => n49, Y => next_state_2_port);
   U41 : na210 port map( A => state_0_port, B => n50, Y => n49);
   U42 : ex210 port map( A => n51, B => n52, Y => n50);
   U43 : na210 port map( A => n53, B => n54, Y => next_state_1_port);
   U44 : na210 port map( A => state_0_port, B => n52, Y => n54);
   U45 : na210 port map( A => n53, B => n55, Y => next_state_0_port);
   U46 : na210 port map( A => n56, B => n57, Y => n55);
   U47 : na210 port map( A => n47, B => n58, Y => n56);
   U48 : na210 port map( A => start, B => n51, Y => n58);
   U49 : na310 port map( A => n59, B => n52, C => state_2_port, Y => n47);
   U50 : na210 port map( A => x(2), B => n60, Y => n59);
   U51 : iv110 port map( A => n61, Y => n53);
   U52 : na210 port map( A => n48, B => n62, Y => n61);
   U53 : na310 port map( A => n57, B => n51, C => state_1_port, Y => n62);
   U54 : na310 port map( A => n63, B => n57, C => n64, Y => n48);
   U55 : no210 port map( A => n52, B => n51, Y => n64);
   U56 : iv110 port map( A => n65, Y => mask_1_port);
   U57 : ex210 port map( A => n66, B => n67, Y => n65);
   U58 : na210 port map( A => rom_data(0), B => x(0), Y => n66);
   U59 : iv110 port map( A => n68, Y => mask_6_port);
   U60 : ex210 port map( A => y(3), B => n69, Y => n68);
   U61 : na210 port map( A => y(2), B => n70, Y => n69);
   U62 : ex210 port map( A => n70, B => y(2), Y => mask_5_port);
   U63 : iv110 port map( A => n71, Y => mask_4_port);
   U64 : ex210 port map( A => n72, B => n73, Y => n71);
   U65 : na210 port map( A => rom_data(2), B => y(0), Y => n72);
   U66 : ex210 port map( A => y(0), B => rom_data(2), Y => mask_3_port);
   U67 : ex210 port map( A => n60, B => x(2), Y => mask_2_port);
   U68 : ex210 port map( A => x(0), B => rom_data(0), Y => mask_0_port);
   U69 : no310 port map( A => n74, B => n51, C => n75, Y => error_side);
   U70 : iv110 port map( A => x(2), Y => n75);
   U71 : na310 port map( A => n57, B => n52, C => n60, Y => n74);
   U72 : na210 port map( A => n76, B => n77, Y => n60);
   U73 : na310 port map( A => rom_data(0), B => n67, C => x(0), Y => n77);
   U74 : ex210 port map( A => rom_data(1), B => x(1), Y => n67);
   U75 : na210 port map( A => rom_data(1), B => x(1), Y => n76);
   U76 : no310 port map( A => n78, B => n51, C => n63, Y => error_bot);
   U77 : na310 port map( A => y(2), B => n70, C => y(3), Y => n63);
   U78 : na210 port map( A => n79, B => n80, Y => n70);
   U79 : na310 port map( A => rom_data(2), B => n73, C => y(0), Y => n80);
   U80 : ex210 port map( A => rom_data(3), B => y(1), Y => n73);
   U81 : na210 port map( A => rom_data(3), B => y(1), Y => n79);
   U82 : na210 port map( A => state_1_port, B => n57, Y => n78);
   U83 : no310 port map( A => n57, B => n52, C => n51, Y => ready);
   U84 : iv110 port map( A => state_2_port, Y => n51);
   U85 : iv110 port map( A => state_1_port, Y => n52);
   U86 : iv110 port map( A => state_0_port, Y => n57);

end synthesised;



