library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_160b_arch of sr_160b is
	component sr_16b
		port(clk, rst : in  std_logic;
			 we       : in  std_logic;
			 re       : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 addr     : in  std_logic_vector(3 downto 0));
	end component sr_16b;

	component dec10
		port(di : in  std_logic;
			 do : out std_logic_vector(9 downto 0);
			 s  : in  std_logic_vector(3 downto 0));
	end component dec10;

	component dff
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic);
	end component dff;

	signal re_i, we_i : std_logic_vector(9 downto 0);
	signal d          : std_logic;
begin
	gen_sr_16b : for i in 0 to 9 generate
		sr_16b_i : sr_16b
			port map(clk  => clk,
				     rst  => rst,
				     we   => we_i(i),
				     re   => re_i(i),
				     di   => di,
				     do   => d,
				     addr => addr(3 downto 0));
	end generate;

	dec10_we : dec10
		port map(di => we,
			     do => we_i,
			     s  => addr(7 downto 4));

	dec10_re : dec10
		port map(di => '1',
			     do => re_i,
			     s  => addr(7 downto 4));

	ff_do : dff
		port map(clk => clk,
			     rst => rst,
			     di  => d,
			     do  => do);
end;  
			  