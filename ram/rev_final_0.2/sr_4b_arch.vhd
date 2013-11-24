library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_4b_arch of sr_4b is
	component sr_1b
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 we       : in  std_logic);
	end component sr_1b;

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
begin
	sr_1b_1 : sr_1b
		port map(clk => clk,
			     rst => rst,
			     di  => di,
			     do  => d_i(0),
			     we  => we_i(0));

	sr_1b_2 : sr_1b
		port map(clk => clk,
			     rst => rst,
			     di  => di,
			     do  => d_i(1),
			     we  => we_i(1));

	sr_1b_3 : sr_1b
		port map(clk => clk,
			     rst => rst,
			     di  => di,
			     do  => d_i(2),
			     we  => we_i(2));

	sr_1b_4 : sr_1b
		port map(clk => clk,
			     rst => rst,
			     di  => di,
			     do  => d_i(3),
			     we  => we_i(3));

	dec4_we : dec4
		port map(di => we,
			     do => we_i,
			     s  => addr);

	mp4_do : mp4
		port map(di => d_i,
			     do => do,
			     s  => addr);
end;