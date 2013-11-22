library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp_behav of sramdp is
	component sramdp_comb
		port(mem_in      : in  std_logic_vector(7 downto 0);
			 mem_out     : out std_logic_vector(7 downto 0);
			 rw_addr     : in  std_logic_vector(2 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 ro_addr     : in  std_logic_vector(2 downto 0);
			 ro_data_out : out std_logic);
	end component sramdp_comb;

	component sramdp_regs
		port(clk     : in  std_logic;
			 rst     : in  std_logic;
			 mem_out : out std_logic_vector(7 downto 0);
			 mem_in  : in  std_logic_vector(7 downto 0));
	end component sramdp_regs;

	component sramdp_tri
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 enable   : in  std_logic;
			 data_in  : in  std_logic;
			 data_out : out std_logic);
	end component sramdp_tri;

	signal mem_state, mem_new : std_logic_vector(7 downto 0);

	signal ro_new : std_logic;
	signal rw_new : std_logic;
begin
	comb_logic : sramdp_comb
		port map(mem_in      => mem_state,
			     mem_out     => mem_new,
			     rw_addr     => rw_addr,
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_new,
			     rw_we       => rw_we,
			     ro_addr     => ro_addr,
			     ro_data_out => ro_new);
			     
	regs : sramdp_regs
		port map(clk     => clk,
			     rst     => rst,
			     mem_out => mem_state,
			     mem_in  => mem_new);

	ro_tri : sramdp_tri
		port map(clk      => clk,
			     rst      => rst,
			     enable   => ro_re,
			     data_in  => ro_new,
			     data_out => ro_data_out);

	rw_tri : sramdp_tri
		port map(clk      => clk,
			     rst      => rst,
			     enable   => rw_re,
			     data_in  => rw_new,
			     data_out => rw_data_out);

end;