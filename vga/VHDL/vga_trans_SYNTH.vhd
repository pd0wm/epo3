
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_trans is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
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
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal mem_addr_out_6_port, mem_addr_out_5_port, mem_addr_out_4_port, 
      mem_addr_out_3_port, mem_addr_out_2_port, mem_addr_out_1_port, 
      mem_addr_out_0_port, counter_state_1_port, counter_state_0_port, N19, n1,
      n2, n3, n4, n32, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, 
      n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60
      , n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, 
      n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89
      : std_logic;

begin
   mem_addr_out <= ( mem_addr_out_6_port, mem_addr_out_5_port, 
      mem_addr_out_4_port, mem_addr_out_3_port, mem_addr_out_2_port, 
      mem_addr_out_1_port, mem_addr_out_0_port );
   
   counter_state_reg_0_inst : dfa11 port map( D => n4, CK => clk, R => rst, Q 
                           => counter_state_0_port);
   counter_state_reg_1_inst : dfa11 port map( D => n2, CK => clk, R => rst, Q 
                           => counter_state_1_port);
   mem_addr_state_reg_6_inst : dfa11 port map( D => n35, CK => clk, R => rst, Q
                           => mem_addr_out_6_port);
   mem_addr_state_reg_0_inst : dfa11 port map( D => n41, CK => clk, R => rst, Q
                           => mem_addr_out_0_port);
   mem_addr_state_reg_1_inst : dfa11 port map( D => n40, CK => clk, R => rst, Q
                           => mem_addr_out_1_port);
   mem_addr_state_reg_2_inst : dfa11 port map( D => n39, CK => clk, R => rst, Q
                           => mem_addr_out_2_port);
   mem_addr_state_reg_3_inst : dfa11 port map( D => n38, CK => clk, R => rst, Q
                           => mem_addr_out_3_port);
   mem_addr_state_reg_4_inst : dfa11 port map( D => n37, CK => clk, R => rst, Q
                           => mem_addr_out_4_port);
   mem_addr_state_reg_5_inst : dfa11 port map( D => n36, CK => clk, R => rst, Q
                           => mem_addr_out_5_port);
   U3 : na210 port map( A => n89, B => n32, Y => n1);
   U4 : iv110 port map( A => n1, Y => n2);
   U5 : na210 port map( A => N19, B => n32, Y => n3);
   U6 : iv110 port map( A => n3, Y => n4);
   U45 : ex210 port map( A => n42, B => n43, Y => n89);
   U46 : na210 port map( A => in_field_in, B => counter_state_0_port, Y => n43)
                           ;
   U47 : iv110 port map( A => counter_state_1_port, Y => n42);
   U48 : na210 port map( A => n44, B => n45, Y => n41);
   U49 : na210 port map( A => mem_addr_reset_in(0), B => n46, Y => n45);
   U50 : mu111 port map( A => n47, B => n48, S => mem_addr_out_0_port, Y => n44
                           );
   U51 : na210 port map( A => n49, B => n50, Y => n40);
   U52 : na210 port map( A => mem_addr_reset_in(1), B => n46, Y => n50);
   U53 : mu111 port map( A => n51, B => n52, S => mem_addr_out_1_port, Y => n49
                           );
   U54 : na210 port map( A => n53, B => mem_addr_out_0_port, Y => n51);
   U55 : na210 port map( A => n54, B => n55, Y => n39);
   U56 : na210 port map( A => mem_addr_reset_in(2), B => n46, Y => n55);
   U57 : mu111 port map( A => n56, B => n57, S => mem_addr_out_2_port, Y => n54
                           );
   U58 : no210 port map( A => n58, B => n59, Y => n57);
   U59 : iv110 port map( A => n52, Y => n59);
   U60 : no210 port map( A => n60, B => n61, Y => n52);
   U61 : no210 port map( A => n47, B => mem_addr_out_0_port, Y => n61);
   U62 : iv110 port map( A => n48, Y => n60);
   U63 : no210 port map( A => mem_addr_out_1_port, B => n47, Y => n58);
   U64 : na310 port map( A => n53, B => mem_addr_out_0_port, C => 
                           mem_addr_out_1_port, Y => n56);
   U65 : na210 port map( A => n62, B => n63, Y => n38);
   U66 : na210 port map( A => mem_addr_reset_in(3), B => n46, Y => n63);
   U67 : mu111 port map( A => n64, B => n65, S => mem_addr_out_3_port, Y => n62
                           );
   U68 : iv110 port map( A => n66, Y => n65);
   U69 : na210 port map( A => n67, B => n53, Y => n64);
   U70 : na210 port map( A => n68, B => n69, Y => n37);
   U71 : na210 port map( A => mem_addr_reset_in(4), B => n46, Y => n69);
   U72 : mu111 port map( A => n70, B => n71, S => mem_addr_out_4_port, Y => n68
                           );
   U73 : no210 port map( A => n72, B => n66, Y => n71);
   U74 : na210 port map( A => n48, B => n73, Y => n66);
   U75 : na210 port map( A => n53, B => n74, Y => n73);
   U76 : no210 port map( A => mem_addr_out_3_port, B => n47, Y => n72);
   U77 : na310 port map( A => n67, B => n53, C => mem_addr_out_3_port, Y => n70
                           );
   U78 : na210 port map( A => n75, B => n76, Y => n36);
   U79 : na210 port map( A => mem_addr_reset_in(5), B => n46, Y => n76);
   U80 : mu111 port map( A => n77, B => n78, S => mem_addr_out_5_port, Y => n75
                           );
   U81 : iv110 port map( A => n79, Y => n78);
   U82 : na210 port map( A => n80, B => n53, Y => n77);
   U83 : na210 port map( A => n81, B => n82, Y => n35);
   U84 : na210 port map( A => mem_addr_reset_in(6), B => n46, Y => n82);
   U85 : iv110 port map( A => n32, Y => n46);
   U86 : mu111 port map( A => n83, B => n84, S => mem_addr_out_6_port, Y => n81
                           );
   U87 : no210 port map( A => n85, B => n79, Y => n84);
   U88 : na210 port map( A => n48, B => n86, Y => n79);
   U89 : na210 port map( A => n53, B => n87, Y => n86);
   U90 : no210 port map( A => mem_addr_out_5_port, B => n47, Y => n85);
   U91 : na310 port map( A => n80, B => n53, C => mem_addr_out_5_port, Y => n83
                           );
   U92 : iv110 port map( A => n47, Y => n53);
   U93 : na210 port map( A => n32, B => n48, Y => n47);
   U94 : na210 port map( A => n32, B => n88, Y => n48);
   U95 : na310 port map( A => in_field_in, B => counter_state_0_port, C => 
                           counter_state_1_port, Y => n88);
   U96 : iv110 port map( A => n87, Y => n80);
   U97 : na310 port map( A => mem_addr_out_3_port, B => n67, C => 
                           mem_addr_out_4_port, Y => n87);
   U98 : iv110 port map( A => n74, Y => n67);
   U99 : na310 port map( A => mem_addr_out_1_port, B => mem_addr_out_0_port, C 
                           => mem_addr_out_2_port, Y => n74);
   U100 : no210 port map( A => new_line_in, B => new_frame_in, Y => n32);
   U101 : ex210 port map( A => in_field_in, B => counter_state_0_port, Y => N19
                           );

end synthesised;



