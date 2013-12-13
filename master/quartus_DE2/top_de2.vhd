-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 10.0 Build 262 08/18/2010 Service Pack 1 SJ Full Version"
-- CREATED		"Fri Dec 13 16:40:14 2013"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY top_de2 IS 
	PORT
	(
		clock_50mhz :  IN  STD_LOGIC;
		rst :  IN  STD_LOGIC;
		dbg_inputs :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		vga_sync :  OUT  STD_LOGIC;
		vga_clk :  OUT  STD_LOGIC;
		vga_blank :  OUT  STD_LOGIC;
		vga_hsync :  OUT  STD_LOGIC;
		vga_vsync :  OUT  STD_LOGIC;
		6mhz_clk :  OUT  STD_LOGIC;
		vga_b :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		vga_g :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		vga_r :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END top_de2;

ARCHITECTURE bdf_type OF top_de2 IS 

COMPONENT pre_vga_dac
	PORT(clk : IN STD_LOGIC;
		 r : IN STD_LOGIC;
		 g : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 vga_sync : OUT STD_LOGIC;
		 vga_clk : OUT STD_LOGIC;
		 vga_blank : OUT STD_LOGIC;
		 vga_b : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 vga_g : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 vga_r : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT gen6mhz
	PORT(clk50mhz : IN STD_LOGIC;
		 clk6mhz : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT npg
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 button_seed : IN STD_LOGIC;
		 new_number : IN STD_LOGIC;
		 output : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT cs_compare
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 start_in : IN STD_LOGIC;
		 ram_data_in : IN STD_LOGIC;
		 ready_out : OUT STD_LOGIC;
		 score_out : OUT STD_LOGIC;
		 ram_we : OUT STD_LOGIC;
		 ram_data_out : OUT STD_LOGIC;
		 ram_addr_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT log_score
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 increase : IN STD_LOGIC;
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT draw_score
	PORT(ds_clk : IN STD_LOGIC;
		 ds_rst : IN STD_LOGIC;
		 ds_draw : IN STD_LOGIC;
		 ds_input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ds_ready : OUT STD_LOGIC;
		 ds_write : OUT STD_LOGIC;
		 ds_data_out : OUT STD_LOGIC;
		 ds_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram_fix
	PORT(draw_erase_start : IN STD_LOGIC;
		 draw_score_draw : IN STD_LOGIC;
		 clear_shift_start : IN STD_LOGIC;
		 check_start : IN STD_LOGIC;
		 we : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT debounce
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 inv_inputs : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 random_seed : OUT STD_LOGIC;
		 output : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sr_if
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 di : IN STD_LOGIC;
		 we : IN STD_LOGIC;
		 addr1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 addr2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 do1 : OUT STD_LOGIC;
		 do2 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT vga
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 data : IN STD_LOGIC;
		 h_sync : OUT STD_LOGIC;
		 v_sync : OUT STD_LOGIC;
		 red : OUT STD_LOGIC;
		 green : OUT STD_LOGIC;
		 blue : OUT STD_LOGIC;
		 mem_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT timer
	PORT(clk : IN STD_LOGIC;
		 vga_clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 cnt_rst : IN STD_LOGIC;
		 time : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 ready : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT check_mask
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 lut_ready : IN STD_LOGIC;
		 lut_error : IN STD_LOGIC;
		 data_in : IN STD_LOGIC;
		 mask : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ready : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC;
		 lut_start : OUT STD_LOGIC;
		 write : OUT STD_LOGIC;
		 addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 mask_select : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT de_piece
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 draw_erase : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 lut_ready : IN STD_LOGIC;
		 data : INOUT STD_LOGIC;
		 mask : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ready : OUT STD_LOGIC;
		 lut_start : OUT STD_LOGIC;
		 write : OUT STD_LOGIC;
		 addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 mask_select : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT piece_lut
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 next_piece : IN STD_LOGIC;
		 check_start : IN STD_LOGIC;
		 draw_start : IN STD_LOGIC;
		 mask_select : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 piece_type : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 rom_data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 rot : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 x : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ready : OUT STD_LOGIC;
		 overflow : OUT STD_LOGIC;
		 mask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rom_addr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rom
	PORT(addr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controller
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 check_empty : IN STD_LOGIC;
		 check_ready : IN STD_LOGIC;
		 draw_erase_ready : IN STD_LOGIC;
		 clear_shift_ready : IN STD_LOGIC;
		 draw_score_ready : IN STD_LOGIC;
		 timer_1_done : IN STD_LOGIC;
		 inputs : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 next_piece : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 lut_next_piece : OUT STD_LOGIC;
		 new_piece : OUT STD_LOGIC;
		 check_start : OUT STD_LOGIC;
		 draw_erase_draw : OUT STD_LOGIC;
		 draw_erase_start : OUT STD_LOGIC;
		 clear_shift_start : OUT STD_LOGIC;
		 draw_score_draw : OUT STD_LOGIC;
		 timer_1_time : OUT STD_LOGIC;
		 timer_1_start : OUT STD_LOGIC;
		 timer_1_reset : OUT STD_LOGIC;
		 lut_piece_type : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 lut_rot : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 lut_x : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 lut_y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	gdfx_temp0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_71 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_73 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_74 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_75 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_76 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_77 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_79 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_80 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_62 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_65 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_69 :  STD_LOGIC_VECTOR(2 DOWNTO 0);


BEGIN 
vga_hsync <= SYNTHESIZED_WIRE_19;
vga_vsync <= SYNTHESIZED_WIRE_34;
6mhz_clk <= SYNTHESIZED_WIRE_70;



b2v_inst : pre_vga_dac
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 r => SYNTHESIZED_WIRE_1,
		 g => SYNTHESIZED_WIRE_2,
		 b => SYNTHESIZED_WIRE_3,
		 vga_sync => vga_sync,
		 vga_clk => vga_clk,
		 vga_blank => vga_blank,
		 vga_b => vga_b,
		 vga_g => vga_g,
		 vga_r => vga_r);


b2v_inst1 : gen6mhz
PORT MAP(clk50mhz => clock_50mhz,
		 clk6mhz => SYNTHESIZED_WIRE_70);


b2v_inst10 : npg
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 button_seed => SYNTHESIZED_WIRE_5,
		 new_number => SYNTHESIZED_WIRE_6,
		 output => SYNTHESIZED_WIRE_69);


b2v_inst11 : cs_compare
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 start_in => SYNTHESIZED_WIRE_71,
		 ram_data_in => SYNTHESIZED_WIRE_72,
		 ready_out => SYNTHESIZED_WIRE_65,
		 score_out => SYNTHESIZED_WIRE_11,
		 ram_we => SYNTHESIZED_WIRE_76,
		 ram_data_out => gdfx_temp0,
		 ram_addr_out => SYNTHESIZED_WIRE_77);


b2v_inst12 : log_score
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 increase => SYNTHESIZED_WIRE_11,
		 output => SYNTHESIZED_WIRE_14);


b2v_inst13 : draw_score
PORT MAP(ds_clk => SYNTHESIZED_WIRE_70,
		 ds_rst => rst,
		 ds_draw => SYNTHESIZED_WIRE_73,
		 ds_input => SYNTHESIZED_WIRE_14,
		 ds_ready => SYNTHESIZED_WIRE_66,
		 ds_write => SYNTHESIZED_WIRE_76,
		 ds_data_out => gdfx_temp0,
		 ds_addr => SYNTHESIZED_WIRE_77);


b2v_inst14 : ram_fix
PORT MAP(draw_erase_start => SYNTHESIZED_WIRE_74,
		 draw_score_draw => SYNTHESIZED_WIRE_73,
		 clear_shift_start => SYNTHESIZED_WIRE_71,
		 check_start => SYNTHESIZED_WIRE_75,
		 we => SYNTHESIZED_WIRE_76);


b2v_inst19 : debounce
PORT MAP(clk => SYNTHESIZED_WIRE_19,
		 rst => rst,
		 inv_inputs => dbg_inputs,
		 random_seed => SYNTHESIZED_WIRE_5,
		 output => SYNTHESIZED_WIRE_68);


b2v_inst2 : sr_if
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 di => gdfx_temp0,
		 we => SYNTHESIZED_WIRE_76,
		 addr1 => SYNTHESIZED_WIRE_77,
		 addr2 => SYNTHESIZED_WIRE_30,
		 do1 => SYNTHESIZED_WIRE_72,
		 do2 => SYNTHESIZED_WIRE_32);


b2v_inst3 : vga
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 data => SYNTHESIZED_WIRE_32,
		 h_sync => SYNTHESIZED_WIRE_19,
		 v_sync => SYNTHESIZED_WIRE_34,
		 red => SYNTHESIZED_WIRE_1,
		 green => SYNTHESIZED_WIRE_2,
		 blue => SYNTHESIZED_WIRE_3,
		 mem_addr => SYNTHESIZED_WIRE_30);


b2v_inst4 : timer
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 vga_clk => SYNTHESIZED_WIRE_34,
		 rst => rst,
		 cnt_rst => SYNTHESIZED_WIRE_35,
		 time => SYNTHESIZED_WIRE_36,
		 start => SYNTHESIZED_WIRE_37,
		 ready => SYNTHESIZED_WIRE_67);


b2v_inst5 : check_mask
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 start => SYNTHESIZED_WIRE_75,
		 lut_ready => SYNTHESIZED_WIRE_78,
		 lut_error => SYNTHESIZED_WIRE_41,
		 data_in => SYNTHESIZED_WIRE_72,
		 mask => SYNTHESIZED_WIRE_79,
		 ready => SYNTHESIZED_WIRE_63,
		 empty => SYNTHESIZED_WIRE_62,
		 lut_start => SYNTHESIZED_WIRE_51,
		 write => SYNTHESIZED_WIRE_76,
		 addr => SYNTHESIZED_WIRE_77,
		 mask_select => SYNTHESIZED_WIRE_80);


b2v_inst6 : de_piece
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 draw_erase => SYNTHESIZED_WIRE_45,
		 start => SYNTHESIZED_WIRE_74,
		 lut_ready => SYNTHESIZED_WIRE_78,
		 data => gdfx_temp0,
		 mask => SYNTHESIZED_WIRE_79,
		 ready => SYNTHESIZED_WIRE_64,
		 lut_start => SYNTHESIZED_WIRE_52,
		 write => SYNTHESIZED_WIRE_76,
		 addr => SYNTHESIZED_WIRE_77,
		 mask_select => SYNTHESIZED_WIRE_80);


b2v_inst7 : piece_lut
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 next_piece => SYNTHESIZED_WIRE_50,
		 check_start => SYNTHESIZED_WIRE_51,
		 draw_start => SYNTHESIZED_WIRE_52,
		 mask_select => SYNTHESIZED_WIRE_80,
		 piece_type => SYNTHESIZED_WIRE_55,
		 rom_data => SYNTHESIZED_WIRE_56,
		 rot => SYNTHESIZED_WIRE_57,
		 x => SYNTHESIZED_WIRE_58,
		 y => SYNTHESIZED_WIRE_59,
		 ready => SYNTHESIZED_WIRE_78,
		 overflow => SYNTHESIZED_WIRE_41,
		 mask => SYNTHESIZED_WIRE_79,
		 rom_addr => SYNTHESIZED_WIRE_60);


b2v_inst8 : rom
PORT MAP(addr => SYNTHESIZED_WIRE_60,
		 data => SYNTHESIZED_WIRE_56);


b2v_inst9 : controller
PORT MAP(clk => SYNTHESIZED_WIRE_70,
		 rst => rst,
		 check_empty => SYNTHESIZED_WIRE_62,
		 check_ready => SYNTHESIZED_WIRE_63,
		 draw_erase_ready => SYNTHESIZED_WIRE_64,
		 clear_shift_ready => SYNTHESIZED_WIRE_65,
		 draw_score_ready => SYNTHESIZED_WIRE_66,
		 timer_1_done => SYNTHESIZED_WIRE_67,
		 inputs => SYNTHESIZED_WIRE_68,
		 next_piece => SYNTHESIZED_WIRE_69,
		 lut_next_piece => SYNTHESIZED_WIRE_50,
		 new_piece => SYNTHESIZED_WIRE_6,
		 check_start => SYNTHESIZED_WIRE_75,
		 draw_erase_draw => SYNTHESIZED_WIRE_45,
		 draw_erase_start => SYNTHESIZED_WIRE_74,
		 clear_shift_start => SYNTHESIZED_WIRE_71,
		 draw_score_draw => SYNTHESIZED_WIRE_73,
		 timer_1_time => SYNTHESIZED_WIRE_36,
		 timer_1_start => SYNTHESIZED_WIRE_37,
		 timer_1_reset => SYNTHESIZED_WIRE_35,
		 lut_piece_type => SYNTHESIZED_WIRE_55,
		 lut_rot => SYNTHESIZED_WIRE_57,
		 lut_x => SYNTHESIZED_WIRE_58,
		 lut_y => SYNTHESIZED_WIRE_59);


END bdf_type;