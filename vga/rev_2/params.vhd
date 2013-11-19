library ieee;
use ieee.std_logic_1164.all;

package vga2_params is
	constant width : integer := 30;
	constant height : integer := 30;
	
	constant line_fp : integer := 1;
	constant line_pw : integer := 1;
	constant line_bp : integer := 1;
	
	constant frame_fp : integer := 1;
	constant frame_pw : integer := 1;
	constant frame_bp : integer := 1;
	
	-- Field: blocks of 6x5
	constant field_start_x : integer := 0;
	constant field_start_y : integer := 0;
	constant field_width : integer := 8;
	constant field_height : integer := 16;
	constant field_block_width : integer := 2;
	constant field_block_height : integer := 1;
	
	constant offset_x : integer := line_fp + line_pw + line_bp;
	constant offset_y : integer := frame_fp + frame_pw + frame_bp;
	
	constant total_width : integer := width + offset_x;
	constant total_height : integer := height + offset_y;
	
	
end vga2_params;

package body vga2_params is
end vga2_params;