library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cs_compare_tb_old is
end entity;

architecture cs_compare_tb_behav of cs_compare_tb_old is
	component cs_compare
		port(clk, rst     : in  std_logic;
			 start_in     : in  std_logic;
			 ready_out    : out std_logic;
			 ram_addr_out : out std_logic_vector(6 downto 0);
			 data_in      : in  std_logic);
	end component cs_compare;

	signal clk, rst, start, ready, data : std_logic;
	signal ram_addr                     : std_logic_vector(6 downto 0);
begin
	clock : process
	begin
		clk <= '0';
		wait for 82 ns;
		clk <= '1';
		wait for 82 ns;
	end process;

	uut : cs_compare
		port map(clk          => clk,
			     rst          => rst,
			     start_in     => start,
			     ready_out    => ready,
			     ram_addr_out => ram_addr,
			     data_in      => data);

	stimulus : process
	begin
		rst <= '1';
		wait for 123 ns;
		rst <= '0';

		start <= '0';
		wait for 164 ns;
		
		start <= '1';
		wait for 164 ns;
		
		start <= '0';
		wait for 164 * 200 ns;
	end process;
	
	ram_sim : process (ram_addr)
		variable addr : integer;
	begin
		addr := to_integer(unsigned(ram_addr));
		
		if (
			(addr >= 0 and addr <= 7) or
			(addr >= 16 and addr <= 23)
		) then
			data <= '1';
		else
			data <= '0';
		end if;
	end process;

end architecture;