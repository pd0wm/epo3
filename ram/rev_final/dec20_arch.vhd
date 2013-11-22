library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture dec20_arch of dec20 is
	signal s0     : std_logic;
	signal s1, s2 : std_logic_vector(1 downto 0);

	component dec4
		port(di : in  std_logic;
			 do : out std_logic_vector(3 downto 0);
			 s  : in  std_logic_vector(1 downto 0));
	end component dec4;

	component dec2
		port(di : in  std_logic;
			 do : out std_logic_vector(1 downto 0);
			 s  : in  std_logic);
	end component dec2;

	signal o1                 : std_logic_vector(1 downto 0);
	signal o2, o4, o5, o6, o7, o8 : std_logic_vector(3 downto 0);
begin
	s2 <= s(1 downto 0);
	s1 <= s(3 downto 2);
	s0 <= s(4);

	-- Layer 1
	L1_dec2 : dec2
		port map(di => di,
			     do => o1,
			     s  => s0);

	-- Layer 2
	L2_dec4 : dec4
		port map(di => o1(0),
			     do => o2,
			     s  => s1);

	-- Layer 3
	L3_dec4_1 : dec4
		port map(di => o2(0),
			     do => o4,
			     s  => s2);

	L3_dec4_2 : dec4
		port map(di => o2(1),
			     do => o5,
			     s  => s2);

	L3_dec4_3 : dec4
		port map(di => o2(2),
			     do => o6,
			     s  => s2);

	L3_dec4_4 : dec4
		port map(di => o2(3),
			     do => o7,
			     s  => s2);

	L3_dec4_5_alt : dec4
		port map(di => o1(1),
			     do => o8,
			     s  => s2);

	-- Output mapping
	do(3 downto 0)   <= o4;
	do(7 downto 4)   <= o5;
	do(11 downto 8)  <= o6;
	do(15 downto 12) <= o7;
	do(19 downto 16) <= o8;
end;