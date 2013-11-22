library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp128_behav of sramdp128 is
	component sramdp32
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 rw_addr     : in  std_logic_vector(4 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 rw_re       : in  std_logic;
			 ro_addr     : in  std_logic_vector(4 downto 0);
			 ro_data_out : out std_logic;
			 ro_re       : in  std_logic);
	end component sramdp32;

	signal rw_we_i, ro_re_i, rw_re_i : std_logic_vector(0 to 4);

begin
	sram1 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 3),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(0),
			     rw_re       => rw_re_i(0),
			     ro_addr     => ro_addr(7 downto 3),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(0));

	sram2 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 3),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(1),
			     rw_re       => rw_re_i(1),
			     ro_addr     => ro_addr(7 downto 3),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(1));

	sram3 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 3),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(2),
			     rw_re       => rw_re_i(2),
			     ro_addr     => ro_addr(7 downto 3),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(2));

	sram4 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 3),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(3),
			     rw_re       => rw_re_i(3),
			     ro_addr     => ro_addr(7 downto 3),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(3));
			     
	sram5 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 3),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(4),
			     rw_re       => rw_re_i(4),
			     ro_addr     => ro_addr(7 downto 3),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(4));

	process(ro_addr, rw_we, rw_data_in)
		variable ro_mod, rw_mod : integer range 0 to 4;
	begin
		ro_mod := to_integer(unsigned(ro_addr(2 downto 0)));
		rw_mod := to_integer(unsigned(rw_addr(2 downto 0)));

		-- RO interface
		ro_re_i <= (others => '0');
		ro_re_i(ro_mod) <= '1';

		-- R/W interface
		rw_we_i <= (others => '0');
		rw_we_i(rw_mod) <= rw_we;

		rw_re_i <= (others => '0');
		rw_re_i(rw_mod) <= '1';
	end process;
end sramdp128_behav;