library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp128_behav of sramdp128 is
	component sramdp32
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 rw_addr     : in  std_logic_vector(4 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 rw_re       : in  std_logic;
			 ro_addr     : in  std_logic_vector(4 downto 0);
			 ro_data_out : out std_logic;
			 ro_re       : in  std_logic);
	end component sramdp32;

	signal rw_we1, rw_we2, rw_we3, rw_we4 : std_logic;
	signal rw_re1, rw_re2, rw_re3, rw_re4 : std_logic;

	signal ro_re1, ro_re2, ro_re3, ro_re4 : std_logic;

begin
	sram1 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(6 downto 2),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we1,
			     rw_re       => rw_re1,
			     ro_addr     => ro_addr(6 downto 2),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re1);

	sram2 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(6 downto 2),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we2,
			     rw_re       => rw_re2,
			     ro_addr     => ro_addr(6 downto 2),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re2);

	sram3 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(6 downto 2),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we3,
			     rw_re       => rw_re3,
			     ro_addr     => ro_addr(6 downto 2),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re3);

	sram4 : sramdp32
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr(6 downto 2),
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we4,
			     rw_re       => rw_re4,
			     ro_addr     => ro_addr(6 downto 2),
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re4);

	process(ro_addr, rw_we, rw_data_in)
		variable ro_mod, rw_mod : integer range 0 to 3;
	begin
		ro_mod := to_integer(unsigned(ro_addr(1 downto 0)));
		rw_mod := to_integer(unsigned(rw_addr(1 downto 0)));

		-- RO interface
		ro_re1 <= '0';
		ro_re2 <= '0';
		ro_re3 <= '0';
		ro_re4 <= '0';
		case ro_mod is
			when 0 => ro_re1 <= '1';
			when 1 => ro_re2 <= '1';
			when 2 => ro_re3 <= '1';
			when 3 => ro_re4 <= '1';
		end case;

		-- R/W interface
		rw_we1 <= '0';
		rw_we2 <= '0';
		rw_we3 <= '0';
		rw_we4 <= '0';
		if (rw_we = '1') then
			case rw_mod is
				when 0 => rw_we1 <= '1';
				when 1 => rw_we2 <= '1';
				when 2 => rw_we3 <= '1';
				when 3 => rw_we4 <= '1';
			end case;
		end if;

		rw_re1 <= '0';
		rw_re2 <= '0';
		rw_re3 <= '0';
		rw_re4 <= '0';
		case rw_mod is
			when 0 => rw_re1 <= '1';
			when 1 => rw_re2 <= '1';
			when 2 => rw_re3 <= '1';
			when 3 => rw_re4 <= '1';
		end case;
	end process;
end sramdp128_behav;