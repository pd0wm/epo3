library ieee;
use ieee.std_logic_1164.all;

package vga_params is
	constant width : integer := 160; -- 160
	constant height : integer := 480; -- 480
	
	constant line_fp : integer := 4; -- 4
	constant line_pw : integer := 24; -- 24
	constant line_bp : integer := 12; -- 12
	
	constant frame_fp : integer := 20; -- 20
	constant frame_pw : integer := 2; -- 2
	constant frame_bp : integer := 33; -- 33
	
	-- Field
	constant field_start_x : integer := 64; -- 64
	constant field_start_y : integer := 112; -- 112
	constant field_width : integer := 32; -- 32
	constant field_height : integer := 256; -- 256
	constant field_block_width : integer := 4; -- 4
	constant field_block_height : integer := 16; -- 16
	
	-- Resultant constants
	constant offset_x : integer := line_fp + line_pw + line_bp;
	constant offset_y : integer := frame_fp + frame_pw + frame_bp;
	
	constant total_width : integer := width + offset_x;
	constant total_height : integer := height + offset_y;
	
	-- Variables length
	constant pos_x_len : integer := 8;
	constant pos_y_len : integer := 9;
	
	constant mem_addr_len : integer := 7;
	
	constant counter_block_height_len : integer := 4;
	constant counter_block_width_len : integer := 2;
end vga_params;

package body vga_params is
end vga_params;