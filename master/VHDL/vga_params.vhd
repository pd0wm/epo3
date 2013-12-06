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
	constant field_start_x : integer := 16; -- 16
	constant field_start_y : integer := 48; -- 48
	constant field_width : integer := 48; -- 48
	constant field_height : integer := 384; -- 384
	constant field_block_width : integer := 6; -- 6
	constant field_block_height : integer := 24; -- 24
	
	constant field_counter_block_height_len : integer := 5; -- 5
	constant field_counter_block_width_len : integer := 3; -- 3
	
	-- Next piece
	constant np_start_x : integer := 108; -- 108
	constant np_start_y : integer := 48; -- 48
	constant np_width : integer := 24; -- 24
	constant np_height : integer := 96; -- 96
	constant np_block_width : integer := 6; -- 6
	constant np_block_height : integer := 24; --  24
	
	constant np_counter_block_height_len : integer := 5; -- 5
	constant np_counter_block_width_len : integer := 3; -- 3
	
	-- Score
	constant score_start_x : integer := 118; -- 108
	constant score_start_y : integer := 176; -- 48
	constant score_width : integer := 4; -- 24
	constant score_height : integer := 256; -- 96
	constant score_block_height : integer := 32; --  24
	
	constant score_counter_block_height_len : integer := 5; -- 5
	
	-- Resultant constants
	constant offset_x : integer := line_fp + line_pw + line_bp;
	constant offset_y : integer := frame_fp + frame_pw + frame_bp;
	
	constant total_width : integer := width + offset_x;
	constant total_height : integer := height + offset_y;
	
	-- Variables length
	constant pos_x_len : integer := 8; -- 8
	constant pos_y_len : integer := 10; -- 10
	
	constant mem_addr_len : integer := 8; -- 8
	
	
end vga_params;

package body vga_params is
end vga_params;








