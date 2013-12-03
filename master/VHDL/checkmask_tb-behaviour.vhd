library IEEE;
use IEEE.std_logic_1164.ALL;

architecture check_mask_tb_behaviour of checkmask_tb is
	signal clk, rst, ready, empty, start, write, data_in, lut_start, lut_ready, lut_error : std_logic;
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
                lut_start : out std_logic;
                lut_ready : in std_logic;
                lut_error : in std_logic;

                write : out std_logic;
                addr : out std_logic_vector(7 downto 0);
                data_in : in std_logic
        );
end component;
begin
	check_mask_port : check_mask port map(clk, rst, mask, mask_select, ready, empty, start, lut_start, lut_ready, lut_error, write, addr, data_in);
	
	clk <= '1' after 0 ns,
		   '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	rst <= '1' after 0 ns, '0' after 30 ns,
	       '0' after 950 ns, '0' after 970 ns,
	       '0' after 1950 ns, '0' after 1970 ns;
	start <= '0' after 0 ns,
	         '1' after 50 ns,
	         --'0' after 70 ns,
	         --'0' after 990 ns,
	         --'0' after 1010 ns,
	         '0' after 1990 ns;
	         --'0' after 2010 ns;
	lut_ready <=    '0' after 0 ns,
			'1' after 210 ns,
			'0' after 250 ns,
			'1' after 710 ns,
			'0' after 750 ns,
			'1' after 1210 ns,
			'0' after 1250 ns,
			'1' after 1710 ns,
			'0' after 1750 ns;
	lut_error <= 		'0' after 0 ns,
			'1' after 1210 ns,
			'0' after 1310 ns;
	mask <= "01101100" after 50 ns,
	          "00001111" after 990 ns,
	          "01100110" after 1990 ns;
	data_in <= '0' after 70 ns,
	        '0' after 1450 ns,
	        '0' after 1950 ns;
	
	
end check_mask_tb_behaviour;


































