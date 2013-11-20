library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

architecture sramdp32_behav of sramdp32 is
	component sramdp32_comb
		port(mem_in      : in  mem;
			 mem_out     : out mem;
			 rw_addr     : in  std_logic_vector(4 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 ro_addr     : in  std_logic_vector(4 downto 0);
			 ro_data_out : out std_logic);
	end component sramdp32_comb;

	component sramdp32_regs
		port(clk     : in  std_logic;
			 rst     : in  std_logic;
			 mem_in  : in  mem;
			 mem_out : out mem);
	end component sramdp32_regs;

	component sramdp32_tri
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 enable   : in  std_logic;
			 data_in  : in  std_logic;
			 data_out : out std_logic);
	end component sramdp32_tri;

	signal mem_state, mem_new : mem;
	signal ro_new   : std_logic;
	signal rw_new   : std_logic;
begin
	comb_logic : sramdp32_comb
		port map(mem_in      => mem_state,
			     mem_out     => mem_new,
			     rw_addr     => rw_addr,
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_new,
			     rw_we       => rw_we,
			     ro_addr     => ro_addr,
			     ro_data_out => ro_new);

	regs : sramdp32_regs
		port map(clk     => clk,
			     rst     => rst,
			     mem_in  => mem_new,
			     mem_out => mem_state);

	ro : sramdp32_tri
		port map(clk      => clk,
			     rst      => rst,
			     enable   => ro_re,
			     data_in  => ro_new,
			     data_out => ro_data_out);

	r2 : sramdp32_tri
		port map(clk      => clk,
			     rst      => rst,
			     enable   => rw_re,
			     data_in  => rw_new,
			     data_out => rw_data_out);

end;