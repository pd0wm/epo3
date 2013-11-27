library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_tower_behav of sr_tower is
	component bit4
		port(clk, rst                           : in  std_logic;
			 we_com, we1, we2, we3, we4         : in  std_logic;
			 re_1, re_2                         : in  std_logic;
			 di                                 : in  std_logic;
			 do_1, do_2                         : out std_logic;
			 addr1_1, addr1_2, addr2_1, addr2_2 : in  std_logic);
	end component bit4;

	component demux8
		port(di : in  std_logic;
			 do : out std_logic_vector(7 downto 0);
			 s  : in  std_logic_vector(2 downto 0));
	end component demux8;
	
	component demux4
		port(di : in  std_logic;
			 do : out std_logic_vector(3 downto 0);
			 s  : in  std_logic_vector(1 downto 0));
	end component demux4;
	
	component dec8
		port(do : out std_logic_vector(7 downto 0);
			 s  : in  std_logic_vector(2 downto 0));
	end component dec8;

	signal we_com, re_1, re_2 : std_logic_vector(7 downto 0);
	signal we_i               : std_logic_vector(3 downto 0);
begin
	generate_bit4 : for i in 0 to 7 generate
		bit4_mod : bit4 port map(
				clk     => clk,
				rst     => rst,
				we_com  => we_com(i),
				we1     => we_i(0),
				we2     => we_i(1),
				we3     => we_i(2),
				we4     => we_i(3),
				re_1    => re_1(i),
				re_2    => re_2(i),
				di      => di,
				do_1    => do1,
				do_2    => do2,
				addr1_1 => addr1(0),
				addr1_2 => addr1(1),
				addr2_1 => addr2(0),
				addr2_2 => addr2(1)
			);
	end generate;
	
	demux8_we_com : demux8
		port map(di => di,
			     do => we_com,
			     s  => addr1(4 downto 2));

	dec8_re_1 : dec8
		port map(do => re_1,
			     s  => addr1(4 downto 2));

	dec8_re_2 : dec8
		port map(do => re_2,
			     s  => addr2(4 downto 2));

	demux4_we_i : demux4
		port map(di => we,
			     do => we_i,
			     s  => addr1(1 downto 0));

end architecture;


