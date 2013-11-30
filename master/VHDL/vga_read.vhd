library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_read is
	port(
		clk         : in  std_logic;
		rst         : in  std_logic;

		in_field_in : in  std_logic;
		in_np_in    : in  std_logic;
		data_in     : in  std_logic;

		h_sync_in   : in  std_logic;
		v_sync_in   : in  std_logic;

		h_sync_out  : out std_logic;
		v_sync_out  : out std_logic;

		red_out     : out std_logic;
		green_out   : out std_logic;
		blue_out    : out std_logic
	);
end entity;