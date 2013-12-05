library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of draw_score_tb is

component draw_score is
	port(
		ds_clk      : in    std_logic;
		ds_rst      : in    std_logic;

		ds_draw     : in    std_logic;
		ds_ready    : out   std_logic;
		ds_input    : in    std_logic_vector(7 downto 0);

		ds_write 	 : out   std_logic;
		ds_addr  	 : out   std_logic_vector(7 downto 0);
		ds_data_out : out 	 std_logic
                
	);
end component;

signal ds_clk,ds_rst,ds_draw,ds_ready,ds_write,ds_data_out		: std_logic;
signal ds_input,ds_addr	: std_logic_vector (7 downto 0);
 		
begin

L1: draw_score port map (ds_clk	=>	ds_clk,	ds_rst	=>	ds_rst,	ds_draw => ds_draw, ds_ready => ds_ready, ds_input => ds_input, ds_write => ds_write, ds_addr=> ds_addr, ds_data_out => ds_data_out);

clock:	process 
	begin
	ds_clk <= '0';
	wait for 10 us;
	ds_clk <= '1';
	wait for 10 us;
	end process;	

lol:	process
 	begin
	ds_rst 	<= '1';
	ds_draw	<= '0';
	ds_input 	<= "00000000";
	
	wait for 20 us;
	ds_rst	<= '0';
	wait for 20 us;
	ds_draw	<= '1';
	ds_input	<= "10101100";
	wait for 20 us;
	ds_draw	<= '0';
	wait;
	end process;

end behaviour;




















