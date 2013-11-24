library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_16b_arch of sr_16b is
	component sr_4b
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 we       : in  std_logic;
			 addr     : in  std_logic_vector(1 downto 0));
	end component sr_4b;

	component tri
		port(di : in  std_logic;
			 do : out std_logic;
			 e  : in  std_logic);
	end component tri;

	component dec4
		port(di : in  std_logic;
			 do : out std_logic_vector(3 downto 0);
			 s  : in  std_logic_vector(1 downto 0));
	end component dec4;

	component mp4
		port(di : in  std_logic_vector(3 downto 0);
			 do : out std_logic;
			 s  : in  std_logic_vector(1 downto 0));
	end component mp4;

	signal d_i, we_i : std_logic_vector(3 downto 0);
	signal do_buf    : std_logic;
begin
	sr_4b_1 : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => d_i(0),
			     we   => we_i(0),
			     addr => addr(1 downto 0));

	sr_4b_2 : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => d_i(1),
			     we   => we_i(1),
			     addr => addr(1 downto 0));

	sr_4b_3 : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => d_i(2),
			     we   => we_i(2),
			     addr => addr(1 downto 0));

	sr_4b_4 : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => d_i(3),
			     we   => we_i(3),
			     addr => addr(1 downto 0));

	dec_we : dec4
		port map(di => we,
			     do => we_i,
			     s  => addr(3 downto 2));

	mp4_do : mp4
		port map(di => d_i,
			     do => do_buf,
			     s  => addr(3 downto 2));

	tri_do : tri
		port map(di => do_buf,
			     do => do,
			     e  => re);
end architecture;