library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_8b_arch of sr_8b is
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

	component dec2
		port(di : in  std_logic;
			 do : out std_logic_vector(1 downto 0);
			 s  : in  std_logic);
	end component dec2;
	
	component mp2
		port(di1 : in  std_logic;
			 di2 : in  std_logic;
			 do  : out std_logic;
			 s   : in  std_logic);
	end component mp2;

	signal d1,d2 : std_logic;
	signal we_i : std_logic_vector(1 downto 0);
	signal do_buf    : std_logic;
begin
	sr_4b_1 : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => d1,
			     we   => we_i(0),
			     addr => addr(1 downto 0));

	sr_4b_2 : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => d2,
			     we   => we_i(1),
			     addr => addr(1 downto 0));

	dec_we : dec2
		port map(di => we,
			     do => we_i,
			     s  => addr(2));
	mp4_do : mp2
		port map(di1 => d1,
			     di2 => d2,
			     do  => do_buf,
			     s   => addr(2));

	tri_do : tri
		port map(di => do_buf,
			     do => do,
			     e  => re);
end architecture;