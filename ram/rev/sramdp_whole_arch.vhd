library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp_whole_behav of sramdp_whole is
	component sramdp
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 rw_addr     : in  std_logic_vector(2 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 rw_re       : in  std_logic;
			 ro_addr     : in  std_logic_vector(2 downto 0);
			 ro_data_out : out std_logic;
			 ro_re       : in  std_logic);
	end component sramdp;
	
	component sramdp_whole_mp
		port(rw_we_i, ro_re_i, rw_re_i : out std_logic_vector(5 downto 0);
			 rw_subaddr                   : in  std_logic_vector(4 downto 0);
			 rw_we                     : in  std_logic;
			 ro_subaddr                   : in  std_logic_vector(4 downto 0));
	end component sramdp_whole_mp;

	signal rw_we_i, ro_re_i, rw_re_i : std_logic_vector(5 downto 0);

begin
	sram1 : sramdp
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 5),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(0),
			     rw_re       => rw_re_i(0),
			     ro_addr     => ro_addr(7 downto 5),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(0));

	sram2 : sramdp
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 5),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(1),
			     rw_re       => rw_re_i(1),
			     ro_addr     => ro_addr(7 downto 5),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(1));

	sram3 : sramdp
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 5),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(2),
			     rw_re       => rw_re_i(2),
			     ro_addr     => ro_addr(7 downto 5),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(2));

	sram4 : sramdp
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 5),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(3),
			     rw_re       => rw_re_i(3),
			     ro_addr     => ro_addr(7 downto 5),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(3));
			     
	sram5 : sramdp
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(7 downto 5),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we_i(4),
			     rw_re       => rw_re_i(4),
			     ro_addr     => ro_addr(7 downto 5),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re_i(4));
			     
	multiplexer: sramdp_whole_mp
		port map(rw_we_i => rw_we_i,
			     ro_re_i => ro_re_i,
			     rw_re_i => rw_re_i,
			     rw_subaddr => rw_addr(4 downto 0),
			     rw_we   => rw_we,
			     ro_subaddr => ro_addr(4 downto 0));
end sramdp_whole_behav;