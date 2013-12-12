
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_shift is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component cs_shift_comb
      port( state : in std_logic_vector (2 downto 0);  state_next : out 
            std_logic_vector (2 downto 0);  start_in, ram_data_in : in 
            std_logic;  cnt_ram_addr : in std_logic_vector (6 downto 0);  
            cnt_set, cnt_en, tri_en, tri_en_substr, ram_we, ready_out, 
            ram_data_out : out std_logic);
   end component;
   
   component cs_tri8
      port( i : in std_logic_vector (7 downto 0);  o : out std_logic_vector (7 
            downto 0);  e : in std_logic);
   end component;
   
   component cs_adder7
      port( i : in std_logic_vector (6 downto 0);  o : out std_logic_vector (6 
            downto 0));
   end component;
   
   component cs_7bcws
      port( clk, rst, en, set : in std_logic;  value : out std_logic_vector (6 
            downto 0);  data : in std_logic_vector (6 downto 0));
   end component;
   
   signal X_Logic0_port, cnt_ram_addr_uncompressed_6_port, 
      cnt_ram_addr_uncompressed_5_port, cnt_ram_addr_uncompressed_4_port, 
      cnt_ram_addr_uncompressed_3_port, cnt_ram_addr_uncompressed_2_port, 
      cnt_ram_addr_uncompressed_1_port, cnt_ram_addr_uncompressed_0_port, 
      tri_en, cnt_en, cnt_set, cnt_ram_addr_substr_6_port, 
      cnt_ram_addr_substr_5_port, cnt_ram_addr_substr_4_port, 
      cnt_ram_addr_substr_3_port, cnt_ram_addr_substr_2_port, 
      cnt_ram_addr_substr_1_port, cnt_ram_addr_substr_0_port, tri_en_substr, 
      state_2_port, state_1_port, state_0_port, state_next_2_port, 
      state_next_1_port, state_next_0_port, n1, n2 : std_logic;

begin
   
   tristate_8_bit_normal : cs_tri8 port map( i(7) => X_Logic0_port, i(6) => 
                           cnt_ram_addr_uncompressed_6_port, i(5) => 
                           cnt_ram_addr_uncompressed_5_port, i(4) => 
                           cnt_ram_addr_uncompressed_4_port, i(3) => 
                           cnt_ram_addr_uncompressed_3_port, i(2) => 
                           cnt_ram_addr_uncompressed_2_port, i(1) => 
                           cnt_ram_addr_uncompressed_1_port, i(0) => 
                           cnt_ram_addr_uncompressed_0_port, o(7) => 
                           ram_addr_out(7), o(6) => ram_addr_out(6), o(5) => 
                           ram_addr_out(5), o(4) => ram_addr_out(4), o(3) => 
                           ram_addr_out(3), o(2) => ram_addr_out(2), o(1) => 
                           ram_addr_out(1), o(0) => ram_addr_out(0), e => 
                           tri_en);
   counter_7_bit : cs_7bcws port map( clk => clk, rst => rst, en => cnt_en, set
                           => cnt_set, value(6) => 
                           cnt_ram_addr_uncompressed_6_port, value(5) => 
                           cnt_ram_addr_uncompressed_5_port, value(4) => 
                           cnt_ram_addr_uncompressed_4_port, value(3) => 
                           cnt_ram_addr_uncompressed_3_port, value(2) => 
                           cnt_ram_addr_uncompressed_2_port, value(1) => 
                           cnt_ram_addr_uncompressed_1_port, value(0) => 
                           cnt_ram_addr_uncompressed_0_port, data(6) => 
                           ram_addr_in(6), data(5) => ram_addr_in(5), data(4) 
                           => ram_addr_in(4), data(3) => ram_addr_in(3), 
                           data(2) => ram_addr_in(2), data(1) => ram_addr_in(1)
                           , data(0) => ram_addr_in(0));
   adder_7_bit : cs_adder7 port map( i(6) => cnt_ram_addr_uncompressed_6_port, 
                           i(5) => cnt_ram_addr_uncompressed_5_port, i(4) => 
                           cnt_ram_addr_uncompressed_4_port, i(3) => 
                           cnt_ram_addr_uncompressed_3_port, i(2) => 
                           cnt_ram_addr_uncompressed_2_port, i(1) => 
                           cnt_ram_addr_uncompressed_1_port, i(0) => 
                           cnt_ram_addr_uncompressed_0_port, o(6) => 
                           cnt_ram_addr_substr_6_port, o(5) => 
                           cnt_ram_addr_substr_5_port, o(4) => 
                           cnt_ram_addr_substr_4_port, o(3) => 
                           cnt_ram_addr_substr_3_port, o(2) => 
                           cnt_ram_addr_substr_2_port, o(1) => 
                           cnt_ram_addr_substr_1_port, o(0) => 
                           cnt_ram_addr_substr_0_port);
   tristate_8_bit_substr : cs_tri8 port map( i(7) => X_Logic0_port, i(6) => 
                           cnt_ram_addr_substr_6_port, i(5) => 
                           cnt_ram_addr_substr_5_port, i(4) => 
                           cnt_ram_addr_substr_4_port, i(3) => 
                           cnt_ram_addr_substr_3_port, i(2) => 
                           cnt_ram_addr_substr_2_port, i(1) => 
                           cnt_ram_addr_substr_1_port, i(0) => 
                           cnt_ram_addr_substr_0_port, o(7) => ram_addr_out(7),
                           o(6) => ram_addr_out(6), o(5) => ram_addr_out(5), 
                           o(4) => ram_addr_out(4), o(3) => ram_addr_out(3), 
                           o(2) => ram_addr_out(2), o(1) => ram_addr_out(1), 
                           o(0) => ram_addr_out(0), e => n2);
   comb : cs_shift_comb port map( state(2) => state_2_port, state(1) => 
                           state_1_port, state(0) => state_0_port, 
                           state_next(2) => state_next_2_port, state_next(1) =>
                           state_next_1_port, state_next(0) => 
                           state_next_0_port, start_in => start_in, ram_data_in
                           => ram_data_in, cnt_ram_addr(6) => 
                           cnt_ram_addr_uncompressed_6_port, cnt_ram_addr(5) =>
                           cnt_ram_addr_uncompressed_5_port, cnt_ram_addr(4) =>
                           cnt_ram_addr_uncompressed_4_port, cnt_ram_addr(3) =>
                           cnt_ram_addr_uncompressed_3_port, cnt_ram_addr(2) =>
                           cnt_ram_addr_uncompressed_2_port, cnt_ram_addr(1) =>
                           cnt_ram_addr_uncompressed_1_port, cnt_ram_addr(0) =>
                           cnt_ram_addr_uncompressed_0_port, cnt_set => cnt_set
                           , cnt_en => cnt_en, tri_en => tri_en, tri_en_substr 
                           => tri_en_substr, ram_we => ram_we, ready_out => 
                           ready_out, ram_data_out => ram_data_out);
   X_Logic0_port <= '0';
   state_reg_2_inst : dfr11 port map( D => state_next_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => state_next_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   U3 : iv110 port map( A => tri_en_substr, Y => n1);
   U4 : iv110 port map( A => n1, Y => n2);

end synthesised;



