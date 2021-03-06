library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cs_shift_tb is
end entity;

architecture cs_shift_tb_behav of cs_shift_tb is
	component cs_shift
		port(clk, rst     : in  std_logic;
			 start_in     : in  std_logic;
			 ready_out    : out std_logic;
			 ram_addr_in  : in  std_logic_vector(6 downto 0);
			 ram_addr_out : out std_logic_vector(7 downto 0);
			 ram_we       : out std_logic;
			 ram_data_in  : in  std_logic;
			 ram_data_out : out std_logic);
	end component cs_shift;

	signal clk, rst, start, ready, data_in, data_out, we : std_logic;
	signal ram_addr_in                         : std_logic_vector(6 downto 0);
	signal ram_addr : std_logic_vector(7 downto 0);
	
	signal ram_mem : std_logic_vector(255 downto 0);
begin
	clock : process
	begin
		clk <= '1';
		wait for 82 ns;
		clk <= '0';
		wait for 82 ns;
	end process;

	uut : cs_shift
		port map(clk          => clk,
			     rst          => rst,
			     start_in     => start,
			     ready_out    => ready,
			     ram_addr_in  => ram_addr_in,
			     ram_addr_out => ram_addr,
			     ram_we       => we,
			     ram_data_in  => data_out,
			     ram_data_out => data_in);

	stimulus : process
	begin
		rst <= '1';
		wait for 287 ns;
		rst <= '0';

		start <= '0';
		ram_addr_in <= std_logic_vector(to_unsigned(3*8, 7));
		wait for 164 ns;

		start <= '1';
		wait for 164 ns;

		start <= '0';
		wait for 164 * 200 ns;
	end process;

	ram_sim : process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				ram_mem <= (others => '0');
				
				ram_mem(7 downto 0) <= (others => '1');
				ram_mem(14) <= '1';
				ram_mem(23 downto 16) <= (others => '1');
			else
				if (we = '1') then
					ram_mem(to_integer(unsigned(ram_addr))) <= data_in;
				end if;
				
				data_out <= ram_mem(to_integer(unsigned(ram_addr)));
			end if;
		end if;
	end process;

end architecture;