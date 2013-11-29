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

	component mux5
		port(di : in  std_logic_vector(4 downto 0);
			 do : out std_logic;
			 s  : in  std_logic_vector(2 downto 0));
	end component mux5;

	component demux5
		port(di : in  std_logic;
			 do : out std_logic_vector(4 downto 0);
			 s  : in  std_logic_vector(2 downto 0));
	end component demux5;

	component sr_tower
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 do1, do2     : out std_logic;
			 we           : in  std_logic;
			 addr1, addr2 : in  std_logic_vector(4 downto 0));
	end component sr_tower;

	signal do1_i, do2_i, we_i : std_logic_vector(4 downto 0);
	signal do1_buf, do2_buf   : std_logic;
begin
	generate_tower : for i in 0 to 4 generate
		tower_mod : sr_tower
			port map(clk   => clk,
				     rst   => rst,
				     di    => di,
				     do1   => do1_i(i),
				     do2   => do2_i(i),
				     we    => we_i(i),
				     addr1 => addr1(4 downto 0),
				     addr2 => addr2(4 downto 0));
	end generate;

	mux5_do1 : mux5
		port map(di => do1_i,
			     do => do1_buf,
			     s  => addr1(7 downto 5));

	mux5_do2 : mux5
		port map(di => do2_i,
			     do => do2_buf,
			     s  => addr2(7 downto 5));

	demux5_we : demux5
		port map(di => we,
			     do => we_i,
			     s  => addr2(7 downto 5));

	dff_do1_buf : process(clk, rst)
	begin
		if (rst = '1') then
			do1 <= '0';
		elsif (clk'event and clk = '1') then
			do1 <= do1_buf;
		end if;
	end process;

	dff_do2_buf : process(clk, rst)
	begin
		if (rst = '1') then
			do2 <= '0';
		elsif (clk'event and clk = '1') then
			do2 <= do2_buf;
		end if;
	end process;

end architecture;


























