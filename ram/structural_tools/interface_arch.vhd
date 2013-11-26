library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_if_behav of sr_if is
	component bit4
		port(clk, rst                           : in  std_logic;
			 we_com, we1, we2, we3, we4         : in  std_logic;
			 re_1, re_2                         : in  std_logic;
			 di                                 : in  std_logic;
			 do_1, do_2                         : out std_logic;
			 addr1_1, addr1_2, addr2_1, addr2_2 : in  std_logic);
	end component bit4;

	component demux40
		port(di : in  std_logic;
			 do : out std_logic_vector(39 downto 0);
			 s  : in  std_logic_vector(7 downto 0));
	end component demux40;

	signal we_com, re_1, re_2 : std_logic_vector(39 downto 0);
	signal we_i               : std_logic_vector(3 downto 0);
begin
	generate_bit4 : for i in 0 to 39 generate
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

	demux40_we_com : demux40
		port map(di => we,
			     do => we_com,
			     s  => addr1);

	demux40_re_1 : demux40
		port map(di => '1',
			     do => re_1,
			     s  => addr1
		);

	demux40_re_2 : demux40
		port map(di => '1',
			     do => re_2,
			     s  => addr2);

	demux4_we_i : process(addr1(1 downto 0), we)
		variable s : integer range 0 to 3;
	begin
		we_i <= (others => '0');
		s    := to_integer(unsigned(addr1(1 downto 0)));

		case s is
			when 0 => we_i(0) <= we;
			when 1 => we_i(1) <= we;
			when 2 => we_i(2) <= we;
			when 3 => we_i(3) <= we;
		end case;
	end process;

end architecture;