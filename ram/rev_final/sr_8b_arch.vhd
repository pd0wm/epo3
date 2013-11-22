library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_8b_arch of sr_8b is
	component sr_4b
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 we           : in  std_logic;
			 do1, do2     : out std_logic;
			 addr1, addr2 : in  std_logic_vector(1 downto 0));
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

	signal d1, d2, dm, we_i : std_logic_vector(1 downto 0);
begin
	gen_sr_4b : for i in 0 to 1 generate
		sr_4b_mod : sr_4b port map(
				clk   => clk,
				rst   => rst,
				di    => di,
				we    => we_i(i),
				do1   => d1(i),
				do2   => d2(i),
				addr1 => addr1(1 downto 0),
				addr2 => addr2(1 downto 0)
			);
	end generate;

	mp2_1 : mp2
		port map(di1 => d1(0),
			     di2 => d2(0),
			     do  => dm(0),
			     s   => addr1(2));

	mp2_2 : mp2
		port map(di1 => d1(1),
			     di2 => d2(1),
			     do  => dm(1),
			     s   => addr2(2));

	tri_1 : tri port map(
			di => dm(0),
			do => do1,
			e  => e1
		);

	tri_2 : tri port map(
			di => dm(1),
			do => do2,
			e  => e2
		);

	dec2_we : dec2
		port map(di => we,
			     do => we_i,
			     s  => addr1(2));
end architecture;