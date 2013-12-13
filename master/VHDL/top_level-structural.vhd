LIBRARY ieee;
USE ieee.std_logic_1164.all; 


ARCHITECTURE structural OF top_level IS 

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
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC_VECTOR(2 DOWNTO 0);


BEGIN 
vga_clk <= clk;
vga_hsync <= SYNTHESIZED_WIRE_7;
vga_vsync <= SYNTHESIZED_WIRE_18;



b2v_inst10 : npg
PORT MAP(clk => clk,
		 rst => rst,
		 button_seed => SYNTHESIZED_WIRE_0,
		 new_number => SYNTHESIZED_WIRE_1,
		 output => SYNTHESIZED_WIRE_49);


b2v_inst11 : cs_compare
PORT MAP(clk => clk,
		 rst => rst,
		 start_in => SYNTHESIZED_WIRE_2,
		 ram_data_in => SYNTHESIZED_WIRE_50,
		 ready_out => SYNTHESIZED_WIRE_45,
		 score_out => SYNTHESIZED_WIRE_4,
		 ram_we => SYNTHESIZED_WIRE_51,
		 ram_data_out => gdfx_temp0,
		 ram_addr_out => SYNTHESIZED_WIRE_52);


b2v_inst12 : log_score
PORT MAP(clk => clk,
		 rst => rst,
		 increase => SYNTHESIZED_WIRE_4,
		 output => SYNTHESIZED_WIRE_6);


b2v_inst13 : draw_score
PORT MAP(ds_clk => clk,
		 ds_rst => rst,
		 ds_draw => SYNTHESIZED_WIRE_5,
		 ds_input => SYNTHESIZED_WIRE_6,
		 ds_ready => SYNTHESIZED_WIRE_46,
		 ds_write => SYNTHESIZED_WIRE_51,
		 ds_data_out => gdfx_temp0,
		 ds_addr => SYNTHESIZED_WIRE_52);


b2v_inst19 : debounce
PORT MAP(clk => SYNTHESIZED_WIRE_7,
		 rst => rst,
		 inv_inputs => dbg_inputs,
		 random_seed => SYNTHESIZED_WIRE_0,
		 output => SYNTHESIZED_WIRE_48);


b2v_inst2 : sr_if
PORT MAP(clk => clk,
		 rst => rst,
		 di => gdfx_temp0,
		 we => SYNTHESIZED_WIRE_51,
		 addr1 => SYNTHESIZED_WIRE_52,
		 addr2 => SYNTHESIZED_WIRE_16,
		 do1 => SYNTHESIZED_WIRE_50,
		 do2 => SYNTHESIZED_WIRE_17);


b2v_inst3 : vga
PORT MAP(clk => clk,
		 rst => rst,
		 data => SYNTHESIZED_WIRE_17,
		 h_sync => SYNTHESIZED_WIRE_7,
		 v_sync => SYNTHESIZED_WIRE_18,
		 red => vga_r,
		 green => vga_g,
		 blue => vga_b,
		 mem_addr => SYNTHESIZED_WIRE_16);


b2v_inst4 : timer
PORT MAP(clk => clk,
		 vga_clk => SYNTHESIZED_WIRE_18,
		 rst => rst,
		 cnt_rst => SYNTHESIZED_WIRE_19,
		 time => SYNTHESIZED_WIRE_20,
		 start => SYNTHESIZED_WIRE_21,
		 ready => SYNTHESIZED_WIRE_47);


b2v_inst5 : check_mask
PORT MAP(clk => clk,
		 rst => rst,
		 start => SYNTHESIZED_WIRE_22,
		 lut_ready => SYNTHESIZED_WIRE_53,
		 lut_error => SYNTHESIZED_WIRE_24,
		 data_in => SYNTHESIZED_WIRE_50,
		 mask => SYNTHESIZED_WIRE_54,
		 ready => SYNTHESIZED_WIRE_43,
		 empty => SYNTHESIZED_WIRE_42,
		 lut_start => SYNTHESIZED_WIRE_32,
		 write => SYNTHESIZED_WIRE_51,
		 addr => SYNTHESIZED_WIRE_52,
		 mask_select => SYNTHESIZED_WIRE_55);


b2v_inst6 : de_piece
PORT MAP(clk => clk,
		 rst => rst,
		 draw_erase => SYNTHESIZED_WIRE_27,
		 start => SYNTHESIZED_WIRE_28,
		 lut_ready => SYNTHESIZED_WIRE_53,
		 data => gdfx_temp0,
		 mask => SYNTHESIZED_WIRE_54,
		 ready => SYNTHESIZED_WIRE_44,
		 lut_start => SYNTHESIZED_WIRE_33,
		 write => SYNTHESIZED_WIRE_51,
		 addr => SYNTHESIZED_WIRE_52,
		 mask_select => SYNTHESIZED_WIRE_55);


b2v_inst7 : piece_lut
PORT MAP(clk => clk,
		 rst => rst,
		 next_piece => SYNTHESIZED_WIRE_31,
		 check_start => SYNTHESIZED_WIRE_32,
		 draw_start => SYNTHESIZED_WIRE_33,
		 mask_select => SYNTHESIZED_WIRE_55,
		 piece_type => SYNTHESIZED_WIRE_36,
		 rom_data => SYNTHESIZED_WIRE_37,
		 rot => SYNTHESIZED_WIRE_38,
		 x => SYNTHESIZED_WIRE_39,
		 y => SYNTHESIZED_WIRE_40,
		 ready => SYNTHESIZED_WIRE_53,
		 overflow => SYNTHESIZED_WIRE_24,
		 mask => SYNTHESIZED_WIRE_54,
		 rom_addr => SYNTHESIZED_WIRE_41);


b2v_inst8 : rom
PORT MAP(addr => SYNTHESIZED_WIRE_41,
		 data => SYNTHESIZED_WIRE_37);


b2v_inst9 : controller
PORT MAP(clk => clk,
		 rst => rst,
		 check_empty => SYNTHESIZED_WIRE_42,
		 check_ready => SYNTHESIZED_WIRE_43,
		 draw_erase_ready => SYNTHESIZED_WIRE_44,
		 clear_shift_ready => SYNTHESIZED_WIRE_45,
		 draw_score_ready => SYNTHESIZED_WIRE_46,
		 timer_1_done => SYNTHESIZED_WIRE_47,
		 inputs => SYNTHESIZED_WIRE_48,
		 next_piece => SYNTHESIZED_WIRE_49,
		 lut_next_piece => SYNTHESIZED_WIRE_31,
		 new_piece => SYNTHESIZED_WIRE_1,
		 check_start => SYNTHESIZED_WIRE_22,
		 draw_erase_draw => SYNTHESIZED_WIRE_27,
		 draw_erase_start => SYNTHESIZED_WIRE_28,
		 clear_shift_start => SYNTHESIZED_WIRE_2,
		 draw_score_draw => SYNTHESIZED_WIRE_5,
		 timer_1_time => SYNTHESIZED_WIRE_20,
		 timer_1_start => SYNTHESIZED_WIRE_21,
		 timer_1_reset => SYNTHESIZED_WIRE_19,
		 lut_piece_type => SYNTHESIZED_WIRE_36,
		 lut_rot => SYNTHESIZED_WIRE_38,
		 lut_x => SYNTHESIZED_WIRE_39,
		 lut_y => SYNTHESIZED_WIRE_40);


END structural;




