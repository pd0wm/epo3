library IEEE;
use IEEE.std_logic_1164.ALL;

architecture piece_lut_tb_behaviour of piece_lut_tb is
	signal clk, rst, start_control, check_start, draw_start, ready, error, next_piece : std_logic;
	signal rot, mask_select                                                      : std_logic_vector(1 downto 0);
	signal y                                                                     : std_logic_vector(3 downto 0);
	signal x                                                                     : std_logic_vector(2 downto 0);
	signal rom_data                                                              : std_logic_vector(3 downto 0);
	signal piece_type                                                            : std_logic_vector(2 downto 0);
	signal rom_addr                                                              : std_logic_vector(6 downto 0);
	signal mask                                                                  : std_logic_vector(7 downto 0);

	component piece_lut
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 mask        : out std_logic_vector(7 downto 0);
			 mask_select : in  std_logic_vector(1 downto 0);
			 x           : in  std_logic_vector(2 downto 0);
			 y           : in  std_logic_vector(3 downto 0);
			 rot         : in  std_logic_vector(1 downto 0);
			 piece_type  : in  std_logic_vector(2 downto 0);
			 next_piece  : in  std_logic;
			 ready       : out std_logic;
			 overflow    : out std_logic;
			 check_start : in  std_logic;
			 draw_start  : in  std_logic;
			 rom_addr    : out std_logic_vector(6 downto 0);
			 rom_data    : in  std_logic_vector(3 downto 0));
	end component;
begin
	piece_lut_port : piece_lut port map(clk, rst, mask, mask_select, x, y, rot, piece_type, next_piece, ready, error, check_start, draw_start, rom_addr, rom_data);

	clk           <= '1' after 0 ns, '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	rst           <= '1' after 0 ns, '0' after 30 ns;
	rot           <= "01" after 0 ns;
	y             <= "1110" after 0 ns; --14
	x             <= "111" after 0 ns;  --7
	start_control <= '0' after 0 ns, '1' after 110 ns, '0' after 900 ns;

	check_start <=  '0' after 0 ns, 
					'1' after 110 ns,
					'0' after 350 ns,
					'1' after 510 ns,
					'0' after 750 ns,
					'1' after 1010 ns,
					'0' after 1250 ns,
					'1' after 1510 ns,
					'0' after 1750 ns;

	draw_start <= '0' after 0 ns;

	rom_data <= "0000" after 150 ns,     --  X...
				"0100" after 550 ns,    --  XX..
				"0101" after 1050 ns,    --  X...
				"1000" after 1550 ns;    --  .... 
		
	next_piece  <= '0' after 0 ns;
	
	mask_select <=  "01" after 0 ns, 
					"10" after 510 ns,
					"11" after 1010 ns,
					"00" after 1510 ns;
	piece_type  <= "011" after 0 ns;
end piece_lut_tb_behaviour;




































