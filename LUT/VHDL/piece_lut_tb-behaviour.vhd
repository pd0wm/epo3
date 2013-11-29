library IEEE;
use IEEE.std_logic_1164.ALL;

architecture piece_lut_tb_behaviour of piece_lut_tb is
	signal clk, rst, start, ready, error_side, error_bot, next_piece : std_logic;
	signal rot, mask_select : std_logic_vector(1 downto 0);
	signal y : std_logic_vector(3 downto 0);
	signal x : std_logic_vector(2 downto 0);
	signal rom_data : std_logic_vector(3 downto 0);
	signal piece_type : std_logic_vector(2 downto 0);
	signal rom_addr : std_logic_vector(6 downto 0);
	signal mask : std_logic_vector(7 downto 0);

	component piece_lut is
   	port(clk				:IN		 std_logic;
		 rst		  	:IN		 std_logic;
		 start     	:IN    std_logic;
         rot       	:IN    std_logic_vector(1 downto 0);
         y         	:IN    std_logic_vector(3 downto 0);
         x         	:IN    std_logic_vector(2 downto 0);
         piece_type    	:IN    std_logic_vector(2 downto 0);
         rom_data    	:IN    std_logic_vector(3 downto 0);
	 mask_select      :IN    std_logic_vector(1 downto 0);
		 rom_addr		 	:OUT		 std_logic_vector(6 downto 0);
	 next_piece  :in    std_logic;
         ready     	:OUT   std_logic;
         error_side	:OUT   std_logic;
         error_bot 	:OUT   std_logic;
         mask			    	:OUT   std_logic_vector(7 downto 0));
	end component;
begin
	piece_lut_port : piece_lut port map(clk, rst, start, rot, y, x, piece_type, rom_data, mask_select, rom_addr, next_piece, ready, error_side, error_bot, mask);

	clk <= '1' after 0 ns,
		   '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	rst <= '1' after 0 ns, '0' after 30 ns;
	rot <= "01" after 0 ns;
	y <= "1010" after 0 ns; --10
	x <= "110"	after 0 ns;  --6
	start <= '0' after 0 ns, 
	         '1' after 110 ns, 
	         '0' after 130 ns,
	         '1' after 310 ns,
	         '0' after 330 ns,
	         '1' after 510 ns,
	         '0' after 530 ns,
	         '1' after 710 ns,
	         '0' after 730 ns;
	rom_data <= --"0000" after 0 ns,
	          "1000" after 00 ns,
	          "1001" after 350 ns,
	          "1010" after 550 ns,
	          "1011" after 750 ns;
	next_piece <= '0' after 0 ns;
	mask_select <= --"00" after 0 ns,
		 "01" after 00 ns,
		 "10" after 290 ns,
		 "11" after 490 ns,
		 "00" after 690 ns;
	piece_type <= "011" after 0 ns;
end piece_lut_tb_behaviour;
























