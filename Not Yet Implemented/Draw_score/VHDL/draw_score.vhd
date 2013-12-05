library ieee;
use ieee.std_logic_1164.all;
entity draw_score is
	port(
		ds_clk       : in    std_logic;
		ds_rst       : in    std_logic;

		ds_draw      : in    std_logic;
		ds_ready     : out   std_logic;
		ds_input     : in    std_logic_vector(7 downto 0);

		ds_write 	   : out   std_logic;
		ds_addr  	   : out   std_logic_vector(7 downto 0);
		ds_data_out 	: out 	 std_logic
                
	);
end draw_score;













