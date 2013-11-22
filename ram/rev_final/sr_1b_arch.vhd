library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_1b_arch of sr_1b is
	component dff
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic);
	end component dff;
	
	component mp2
		port(di1 : in  std_logic;
			 di2 : in  std_logic;
			 do  : out std_logic;
			 s   : in  std_logic);
	end component mp2;

	signal d, d_new : std_logic;
begin
	mp2_d : mp2
		port map(di1 => d,
			     di2 => di,
			     do  => d_new,
			     s   => we);
			     
	ff: dff
		port map(clk => clk,
			     rst => rst,
			     di  => d_new,
			     do  => d);
	do <= d;
end;