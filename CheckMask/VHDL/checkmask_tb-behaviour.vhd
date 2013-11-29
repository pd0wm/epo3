library IEEE;
use IEEE.std_logic_1164.ALL;

architecture check_mask_tb_behaviour of checkmask_tb is
	signal clk, rst, ready, empty, start, write, data_in, data_out : std_logic;
	signal mask_select : std_logic_vector(1 downto 0);
	signal addr, mask : std_logic_vector(7 downto 0);

	 component check_mask is
        port(
                clk : in std_logic;
                rst : in std_logic;

                mask : in std_logic_vector(7 downto 0);
                mask_select : out std_logic_vector(1 downto 0);

                ready : out std_logic;
                empty : out std_logic;

                start : in std_logic;

                write : out std_logic;
                addr : out std_logic_vector(7 downto 0);
                data_in : in std_logic;
		data_out : out std_logic
        );
end component;
begin
	check_mask_port : check_mask port map(clk, rst, mask, mask_select, ready, empty, start, write, addr, data_in, data_out);
	
	clk <= '1' after 0 ns,
		   '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	rst <= '1' after 0 ns, '0' after 30 ns,
	       '0' after 950 ns, '0' after 970 ns,
	       '0' after 1950 ns, '0' after 1970 ns;
	start <= '0' after 0 ns,
	         '1' after 50 ns,
	         '0' after 970 ns,
	         '1' after 990 ns,
	         '0' after 1910 ns,
	         '1' after 1990 ns,
	         '0' after 2910 ns;
	mask <= "01101100" after 50 ns,
	          "00001111" after 990 ns,
	          "01100110" after 1990 ns;
	data_in <= '0' after 70 ns,
	        '1' after 950 ns,
	        '0' after 1950 ns;
	
	
end check_mask_tb_behaviour;

































