library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_counter_behav of vga_counter is
	signal pos_x : std_logic_vector(pos_x_len-1 downto 0);
	signal pos_y : std_logic_vector(pos_y_len-1 downto 0);
	
	signal pos_x_reset : std_logic;
	signal pos_y_reset, pos_y_enable : std_logic;
	
	component vga_counter_8bit
		port(clk     : in  std_logic;
			 rst     : in  std_logic;
			 rst_ext : in  std_logic;
			 en      : in  std_logic;
			 val     : out std_logic_vector(7 downto 0));
	end component vga_counter_8bit;
	
	component vga_counter_10bit
		port(clk     : in  std_logic;
			 rst     : in  std_logic;
			 rst_ext : in  std_logic;
			 en      : in  std_logic;
			 val     : out std_logic_vector(9 downto 0));
	end component vga_counter_10bit;
	
	component vga_counter_resets
		port(pos_x_reset  : out std_logic;
			 pos_y_reset  : out std_logic;
			 pos_y_enable : out std_logic;
			 pos_x        : in  std_logic_vector(pos_x_len - 1 downto 0);
			 pos_y        : in  std_logic_vector(pos_y_len - 1 downto 0));
	end component vga_counter_resets;
begin
	pos_x_out <= pos_x;
	pos_y_out <= pos_y;

	pos_x_counter : vga_counter_8bit
		port map(clk     => clk,
			     rst     => rst,
			     rst_ext => pos_x_reset,
			     en      => '1',
			     val     => pos_x);
			     
			     
	pos_y_counter : vga_counter_10bit
		port map(
			clk     => clk,
			rst     => rst,
			rst_ext => pos_y_reset,
			en      => pos_y_enable,
			val     => pos_y
		);
			     
	resets : vga_counter_resets
		port map(pos_x_reset  => pos_x_reset,
			     pos_y_reset  => pos_y_reset,
			     pos_y_enable => pos_y_enable,
			     pos_x        => pos_x,
			     pos_y        => pos_y);
end;


