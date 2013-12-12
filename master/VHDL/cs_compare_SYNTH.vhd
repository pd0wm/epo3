
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_compare is

   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component cs_compare_comb
      port( state : in std_logic_vector (3 downto 0);  state_next : out 
            std_logic_vector (3 downto 0);  row_full, start_in, ram_data_in, 
            shift_ready : in std_logic;  cnt_ram_addr : in std_logic_vector (6 
            downto 0);  tri_en, cnt_en, ready_out, shift_start, score_out, 
            defset_en, row_full_next : out std_logic);
   end component;
   
   component cs_defset2
      port( en : in std_logic;  out1, out2 : out std_logic);
   end component;
   
   component cs_shift
      port( clk, rst, start_in : in std_logic;  ready_out : out std_logic;  
            ram_addr_in : in std_logic_vector (6 downto 0);  ram_addr_out : out
            std_logic_vector (7 downto 0);  ram_we : out std_logic;  
            ram_data_in : in std_logic;  ram_data_out : out std_logic);
   end component;
   
   component cs_tri8
      port( i : in std_logic_vector (7 downto 0);  o : out std_logic_vector (7 
            downto 0);  e : in std_logic);
   end component;
   
   component cs_7bc
      port( clk, rst, en : in std_logic;  value : out std_logic_vector (6 
            downto 0));
   end component;
   
   signal X_Logic0_port, cnt_en, cnt_ram_addr_6_port, cnt_ram_addr_5_port, 
      cnt_ram_addr_4_port, cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
      cnt_ram_addr_1_port, cnt_ram_addr_0_port, tri_en, shift_start, 
      shift_ready, defset_en, state_3_port, state_2_port, state_1_port, 
      state_0_port, state_next_3_port, state_next_2_port, state_next_1_port, 
      state_next_0_port, row_full, row_full_next : std_logic;

begin
   
   counter_7_bit : cs_7bc port map( clk => clk, rst => rst, en => cnt_en, 
                           value(6) => cnt_ram_addr_6_port, value(5) => 
                           cnt_ram_addr_5_port, value(4) => cnt_ram_addr_4_port
                           , value(3) => cnt_ram_addr_3_port, value(2) => 
                           cnt_ram_addr_2_port, value(1) => cnt_ram_addr_1_port
                           , value(0) => cnt_ram_addr_0_port);
   tristate_8_bit : cs_tri8 port map( i(7) => X_Logic0_port, i(6) => 
                           cnt_ram_addr_6_port, i(5) => cnt_ram_addr_5_port, 
                           i(4) => cnt_ram_addr_4_port, i(3) => 
                           cnt_ram_addr_3_port, i(2) => cnt_ram_addr_2_port, 
                           i(1) => cnt_ram_addr_1_port, i(0) => 
                           cnt_ram_addr_0_port, o(7) => ram_addr_out(7), o(6) 
                           => ram_addr_out(6), o(5) => ram_addr_out(5), o(4) =>
                           ram_addr_out(4), o(3) => ram_addr_out(3), o(2) => 
                           ram_addr_out(2), o(1) => ram_addr_out(1), o(0) => 
                           ram_addr_out(0), e => tri_en);
   shift : cs_shift port map( clk => clk, rst => rst, start_in => shift_start, 
                           ready_out => shift_ready, ram_addr_in(6) => 
                           cnt_ram_addr_6_port, ram_addr_in(5) => 
                           cnt_ram_addr_5_port, ram_addr_in(4) => 
                           cnt_ram_addr_4_port, ram_addr_in(3) => 
                           cnt_ram_addr_3_port, ram_addr_in(2) => 
                           cnt_ram_addr_2_port, ram_addr_in(1) => 
                           cnt_ram_addr_1_port, ram_addr_in(0) => 
                           cnt_ram_addr_0_port, ram_addr_out(7) => 
                           ram_addr_out(7), ram_addr_out(6) => ram_addr_out(6),
                           ram_addr_out(5) => ram_addr_out(5), ram_addr_out(4) 
                           => ram_addr_out(4), ram_addr_out(3) => 
                           ram_addr_out(3), ram_addr_out(2) => ram_addr_out(2),
                           ram_addr_out(1) => ram_addr_out(1), ram_addr_out(0) 
                           => ram_addr_out(0), ram_we => ram_we, ram_data_in =>
                           ram_data_in, ram_data_out => ram_data_out);
   defset : cs_defset2 port map( en => defset_en, out1 => ram_we, out2 => 
                           ram_data_out);
   comb : cs_compare_comb port map( state(3) => state_3_port, state(2) => 
                           state_2_port, state(1) => state_1_port, state(0) => 
                           state_0_port, state_next(3) => state_next_3_port, 
                           state_next(2) => state_next_2_port, state_next(1) =>
                           state_next_1_port, state_next(0) => 
                           state_next_0_port, row_full => row_full, start_in =>
                           start_in, ram_data_in => ram_data_in, shift_ready =>
                           shift_ready, cnt_ram_addr(6) => cnt_ram_addr_6_port,
                           cnt_ram_addr(5) => cnt_ram_addr_5_port, 
                           cnt_ram_addr(4) => cnt_ram_addr_4_port, 
                           cnt_ram_addr(3) => cnt_ram_addr_3_port, 
                           cnt_ram_addr(2) => cnt_ram_addr_2_port, 
                           cnt_ram_addr(1) => cnt_ram_addr_1_port, 
                           cnt_ram_addr(0) => cnt_ram_addr_0_port, tri_en => 
                           tri_en, cnt_en => cnt_en, ready_out => ready_out, 
                           shift_start => shift_start, score_out => score_out, 
                           defset_en => defset_en, row_full_next => 
                           row_full_next);
   X_Logic0_port <= '0';
   row_full_reg : dfr11 port map( D => row_full_next, R => rst, CK => clk, Q =>
                           row_full);
   state_reg_3_inst : dfr11 port map( D => state_next_3_port, R => rst, CK => 
                           clk, Q => state_3_port);
   state_reg_2_inst : dfr11 port map( D => state_next_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => state_next_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => rst, CK => 
                           clk, Q => state_0_port);

end synthesised;



