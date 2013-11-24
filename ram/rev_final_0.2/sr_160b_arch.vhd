library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_160b_arch of sr_160b is
	component sr_8b
		port(clk, rst : in  std_logic;
			 we       : in  std_logic;
			 re       : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 addr     : in  std_logic_vector(2 downto 0));
	end component sr_8b;

	component dec20
		port(di : in  std_logic;
			 do : out std_logic_vector(19 downto 0);
			 s  : in  std_logic_vector(4 downto 0));
	end component dec20;

	component dff
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic);
	end component dff;

	signal re_i, we_i : std_logic_vector(19 downto 0);
	signal d          : std_logic;
begin
	gen_sr_8b : for i in 0 to 19 generate
		sr_8b_i : sr_8b
			port map(clk  => clk,
				     rst  => rst,
				     we   => we_i(i),
				     re   => re_i(i),
				     di   => di,
				     do   => d,
				     addr => addr(2 downto 0));
	end generate;

	dec20_re : dec20
		port map(di => '1',
			     do => re_i,
			     s  => addr(7 downto 3));

	dec20_we : dec20
		port map(di => we,
			     do => we_i,
			     s  => addr(7 downto 3));

	ff_do : dff
		port map(clk => clk,
			     rst => rst,
			     di  => d,
			     do  => do);
end;  
			  