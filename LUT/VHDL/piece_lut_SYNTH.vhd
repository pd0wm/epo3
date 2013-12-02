
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
   
   signal lut_mask_6_port, lut_mask_5_port, lut_mask_4_port, lut_mask_3_port, 
      lut_mask_2_port, lut_mask_0_port, lut_state_2_port, lut_state_1_port, 
      lut_state_0_port, lut_next_state_2_port, lut_next_state_1_port, 
      lut_next_state_0_port, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, 
      n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71
      , n72, n73, n74, n75, n76, n77, n78, n79, n80, lut_mask_1_port : 
      std_logic;

begin
   lut_mask <= ( lut_next_piece, lut_mask_6_port, lut_mask_5_port, 
      lut_mask_4_port, lut_mask_3_port, lut_mask_2_port, lut_mask_1_port, 
      lut_mask_0_port );
   lut_rom_addr <= ( lut_piece_type(2), lut_piece_type(1), lut_piece_type(0), 
      lut_rot(1), lut_rot(0), lut_mask_select(1), lut_mask_select(0) );
   
   lut_state_reg_0_inst : dfr11 port map( D => lut_next_state_0_port, R => 
                           lut_rst, CK => lut_clk, Q => lut_state_0_port);
   lut_state_reg_1_inst : dfr11 port map( D => lut_next_state_1_port, R => 
                           lut_rst, CK => lut_clk, Q => lut_state_1_port);
   lut_state_reg_2_inst : dfr11 port map( D => lut_next_state_2_port, R => 
                           lut_rst, CK => lut_clk, Q => lut_state_2_port);
   U40 : iv110 port map( A => n47, Y => lut_mask_1_port);
   U41 : ex210 port map( A => n48, B => n49, Y => n47);
   U42 : na210 port map( A => lut_rom_data(0), B => lut_x(0), Y => n48);
   U43 : na310 port map( A => n50, B => n51, C => n52, Y => 
                           lut_next_state_2_port);
   U44 : na210 port map( A => lut_state_0_port, B => n53, Y => n52);
   U45 : ex210 port map( A => n54, B => n55, Y => n53);
   U46 : na210 port map( A => n56, B => n57, Y => lut_next_state_1_port);
   U47 : na210 port map( A => lut_state_0_port, B => n55, Y => n57);
   U48 : na210 port map( A => n56, B => n58, Y => lut_next_state_0_port);
   U49 : na210 port map( A => n59, B => n60, Y => n58);
   U50 : na210 port map( A => n50, B => n61, Y => n59);
   U51 : na210 port map( A => lut_start, B => n54, Y => n61);
   U52 : na310 port map( A => n62, B => n55, C => lut_state_2_port, Y => n50);
   U53 : na210 port map( A => lut_x(2), B => n63, Y => n62);
   U54 : iv110 port map( A => n64, Y => n56);
   U55 : na210 port map( A => n51, B => n65, Y => n64);
   U56 : na310 port map( A => n60, B => n54, C => lut_state_1_port, Y => n65);
   U57 : na310 port map( A => n66, B => n60, C => n67, Y => n51);
   U58 : no210 port map( A => n55, B => n54, Y => n67);
   U59 : iv110 port map( A => n68, Y => lut_mask_6_port);
   U60 : ex210 port map( A => lut_y(3), B => n69, Y => n68);
   U61 : na210 port map( A => lut_y(2), B => n70, Y => n69);
   U62 : ex210 port map( A => n70, B => lut_y(2), Y => lut_mask_5_port);
   U63 : iv110 port map( A => n71, Y => lut_mask_4_port);
   U64 : ex210 port map( A => n72, B => n73, Y => n71);
   U65 : na210 port map( A => lut_rom_data(2), B => lut_y(0), Y => n72);
   U66 : ex210 port map( A => lut_y(0), B => lut_rom_data(2), Y => 
                           lut_mask_3_port);
   U67 : ex210 port map( A => n63, B => lut_x(2), Y => lut_mask_2_port);
   U68 : ex210 port map( A => lut_x(0), B => lut_rom_data(0), Y => 
                           lut_mask_0_port);
   U69 : no310 port map( A => n74, B => n54, C => n75, Y => lut_error_side);
   U70 : iv110 port map( A => lut_x(2), Y => n75);
   U71 : na310 port map( A => n60, B => n55, C => n63, Y => n74);
   U72 : na210 port map( A => n76, B => n77, Y => n63);
   U73 : na310 port map( A => lut_rom_data(0), B => n49, C => lut_x(0), Y => 
                           n77);
   U74 : ex210 port map( A => lut_rom_data(1), B => lut_x(1), Y => n49);
   U75 : na210 port map( A => lut_rom_data(1), B => lut_x(1), Y => n76);
   U76 : no310 port map( A => n78, B => n54, C => n66, Y => lut_error_bot);
   U77 : na310 port map( A => lut_y(2), B => n70, C => lut_y(3), Y => n66);
   U78 : na210 port map( A => n79, B => n80, Y => n70);
   U79 : na310 port map( A => lut_rom_data(2), B => n73, C => lut_y(0), Y => 
                           n80);
   U80 : ex210 port map( A => lut_rom_data(3), B => lut_y(1), Y => n73);
   U81 : na210 port map( A => lut_rom_data(3), B => lut_y(1), Y => n79);
   U82 : na210 port map( A => lut_state_1_port, B => n60, Y => n78);
   U83 : no310 port map( A => n60, B => n55, C => n54, Y => lut_ready);
   U84 : iv110 port map( A => lut_state_2_port, Y => n54);
   U85 : iv110 port map( A => lut_state_1_port, Y => n55);
   U86 : iv110 port map( A => lut_state_0_port, Y => n60);

end synthesised;



