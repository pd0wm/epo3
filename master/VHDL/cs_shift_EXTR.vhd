-- Generated by: xvhdl 2.49 31-Jul-2008
-- Date: 12-Dec-13 11:34:10
-- Path: /home/epo3-user/Desktop/git/epo3/master/test

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY CellsLib;
USE CellsLib.CellsLib_DECL_PACK.all;

-- user directives added from .sls2vhdl


ARCHITECTURE extracted OF Cs_shift IS

  SIGNAL N_1, N_2, N_3, N_4, N_5, N_6, N_7, N_8: STD_LOGIC;
  SIGNAL N_9, N_10, N_11, N_12, N_13, N_14, N_15, N_16: STD_LOGIC;
  SIGNAL N_17, N_18, N_19, N_20, N_21, N_22, N_23, N_24: STD_LOGIC;
  SIGNAL N_25, N_26, N_27, N_28, N_29, N_30, N_31, N_32: STD_LOGIC;
  SIGNAL N_33, N_34, N_35, N_36, N_37, N_38, N_39, N_40: STD_LOGIC;
  SIGNAL N_41, N_42, N_43, N_44, N_45, N_46, N_47, N_48: STD_LOGIC;
  SIGNAL N_49, N_50, N_51, N_52, N_53, N_54, N_55, N_56: STD_LOGIC;
  SIGNAL N_57, N_58, N_59, N_60, N_61, N_62, N_63, N_64: STD_LOGIC;
  SIGNAL N_65, N_66, N_67, N_68, N_69, N_70, N_71, N_72: STD_LOGIC;
  SIGNAL N_73, N_74, N_75, N_76, N_77, N_78, N_79, N_80: STD_LOGIC;
  SIGNAL N_81, N_82, N_83, N_84, N_85, N_86, N_87, N_88: STD_LOGIC;
  SIGNAL N_89, N_90, N_91, N_92, N_93, N_94, N_95, N_96: STD_LOGIC;
  SIGNAL n1: STD_LOGIC;
  SIGNAL cnt_en: STD_LOGIC;
  SIGNAL cnt_set: STD_LOGIC;
  SIGNAL state_next_0_port: STD_LOGIC;
  SIGNAL state_next_1_port: STD_LOGIC;
  SIGNAL state_0_port: STD_LOGIC;
  SIGNAL state_next_2_port: STD_LOGIC;
  SIGNAL state_1_port: STD_LOGIC;
  SIGNAL tri_en_substr: STD_LOGIC;
  SIGNAL state_2_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_uncompressed_4_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_substr_4_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_substr_3_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_substr_6_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_substr_5_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_uncompressed_6_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_uncompressed_5_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_uncompressed_3_port: STD_LOGIC;
  SIGNAL n2: STD_LOGIC;
  SIGNAL tri_en: STD_LOGIC;
  SIGNAL cnt_ram_addr_uncompressed_0_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_substr_1_port: STD_LOGIC;
  SIGNAL cnt_ram_addr_substr_2_port: STD_LOGIC;

  SIGNAL ready_out_int: STD_LOGIC;
  SIGNAL ram_addr_out_int: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ram_we_int: STD_LOGIC;
  SIGNAL ram_data_out_int: STD_LOGIC;

  SIGNAL vss: STD_LOGIC;
BEGIN
  vss <= '0';

  ready_out <= ready_out_int;
  ram_addr_out <= ram_addr_out_int;
  ram_we <= ram_we_int;
  ram_data_out <= ram_data_out_int;


  counter_7_bit_U51: mu111 PORT MAP (N_6, N_3, cnt_ram_addr_uncompressed_3_port, N_18);
  counter_7_bit_U67: mu111 PORT MAP (N_26, N_29, cnt_ram_addr_uncompressed_6_port, N_17);
  counter_7_bit_U36: mu111 PORT MAP (N_39, cnt_en, N_40, N_47);
  counter_7_bit_U39: mu111 PORT MAP (N_43, N_37, cnt_ram_addr_substr_1_port, N_8);
  U4: iv110 PORT MAP (n1, n2);
  U3: iv110 PORT MAP (tri_en_substr, n1);
  comb_U50: iv110 PORT MAP (cnt_en, N_48);
  comb_U65: iv110 PORT MAP (N_57, N_54);
  comb_U47: iv110 PORT MAP (cnt_set, N_51);
  comb_U71: iv110 PORT MAP (state_0_port, N_56);
  comb_U73: iv110 PORT MAP (state_2_port, N_61);
  comb_U74: iv110 PORT MAP (state_1_port, N_60);
  comb_U62: iv110 PORT MAP (cnt_ram_addr_uncompressed_4_port, N_71);
  comb_U63: iv110 PORT MAP (cnt_ram_addr_uncompressed_3_port, N_66);
  comb_U46: iv110 PORT MAP (N_65, N_67);
  comb_U40: iv110 PORT MAP (N_68, state_next_2_port);
  comb_U57: iv110 PORT MAP (cnt_ram_addr_uncompressed_5_port, N_72);
  adder_7_bit_U14: iv110 PORT MAP (cnt_ram_addr_uncompressed_3_port, cnt_ram_addr_substr_3_port);
  adder_7_bit_U12: iv110 PORT MAP (N_96, N_86);
  tristate_8_bit_normal_U13: iv110 PORT MAP (cnt_ram_addr_uncompressed_4_port, N_94);
  tristate_8_bit_substr_U13: iv110 PORT MAP (cnt_ram_addr_substr_4_port, N_92);
  tristate_8_bit_normal_U9: iv110 PORT MAP (cnt_ram_addr_uncompressed_0_port, N_93);
  tristate_8_bit_substr_U9: iv110 PORT MAP (cnt_ram_addr_uncompressed_0_port, N_91);
  tristate_8_bit_normal_U14: iv110 PORT MAP (cnt_ram_addr_uncompressed_5_port, N_79);
  tristate_8_bit_substr_U14: iv110 PORT MAP (cnt_ram_addr_substr_5_port, N_77);
  tristate_8_bit_normal_U16: iv110 PORT MAP (vss, N_80);
  tristate_8_bit_substr_U16: iv110 PORT MAP (vss, N_78);
  tristate_8_bit_normal_U10: iv110 PORT MAP (cnt_ram_addr_substr_1_port, N_84);
  tristate_8_bit_substr_U10: iv110 PORT MAP (cnt_ram_addr_substr_1_port, N_82);
  tristate_8_bit_normal_U11: iv110 PORT MAP (cnt_ram_addr_substr_2_port, N_83);
  tristate_8_bit_substr_U11: iv110 PORT MAP (cnt_ram_addr_substr_2_port, N_81);
  tristate_8_bit_normal_U12: iv110 PORT MAP (cnt_ram_addr_uncompressed_3_port, N_90);
  tristate_8_bit_substr_U12: iv110 PORT MAP (cnt_ram_addr_substr_3_port, N_88);
  tristate_8_bit_normal_U15: iv110 PORT MAP (cnt_ram_addr_uncompressed_6_port, N_89);
  tristate_8_bit_substr_U15: iv110 PORT MAP (cnt_ram_addr_substr_6_port, N_87);
  counter_7_bit_U77: iv110 PORT MAP (N_41, N_27);
  counter_7_bit_U47: iv110 PORT MAP (cnt_ram_addr_uncompressed_0_port, N_40);
  counter_7_bit_U74: iv110 PORT MAP (cnt_en, N_38);
  counter_7_bit_U79: iv110 PORT MAP (cnt_ram_addr_uncompressed_5_port, N_22);
  counter_7_bit_U69: iv110 PORT MAP (N_25, N_35);
  counter_7_bit_U35: iv110 PORT MAP (N_47, N_16);
  adder_7_bit_U9: ex210 PORT MAP (cnt_ram_addr_uncompressed_5_port, N_96, cnt_ram_addr_substr_5_port);
  adder_7_bit_U7: ex210 PORT MAP (cnt_ram_addr_uncompressed_6_port, N_95, cnt_ram_addr_substr_6_port);
  comb_U67: na210 PORT MAP (N_52, N_49, cnt_en);
  comb_U68: na210 PORT MAP (state_2_port, N_57, N_49);
  comb_U49: na210 PORT MAP (start_in, N_57, N_50);
  comb_U39: na210 PORT MAP (state_0_port, N_60, N_55);
  comb_U64: na210 PORT MAP (N_57, N_61, N_53);
  comb_U51: na210 PORT MAP (N_65, N_70, N_62);
  comb_U55: na210 PORT MAP (cnt_ram_addr_substr_1_port, cnt_ram_addr_uncompressed_0_port, N_74);
  comb_U54: na210 PORT MAP (cnt_ram_addr_uncompressed_3_port, cnt_ram_addr_substr_2_port, N_73);
  adder_7_bit_U11: na210 PORT MAP (cnt_ram_addr_uncompressed_4_port, cnt_ram_addr_uncompressed_3_port, N_85);
  adder_7_bit_U10: na210 PORT MAP (N_86, N_85, cnt_ram_addr_substr_4_port);
  counter_7_bit_U55: na210 PORT MAP (cnt_ram_addr_uncompressed_4_port, N_11, N_12);
  counter_7_bit_U56: na210 PORT MAP (N_3, N_2, N_11);
  counter_7_bit_U49: na210 PORT MAP (N_18, N_20, N_21);
  counter_7_bit_U50: na210 PORT MAP (ram_addr_in(3), N_42, N_20);
  counter_7_bit_U42: na210 PORT MAP (cnt_ram_addr_substr_2_port, N_44, N_5);
  counter_7_bit_U52: na210 PORT MAP (N_41, cnt_en, N_6);
  counter_7_bit_U57: na210 PORT MAP (cnt_ram_addr_uncompressed_3_port, cnt_en, N_2);
  counter_7_bit_U48: na210 PORT MAP (ram_addr_in(2), N_42, N_4);
  counter_7_bit_U65: na210 PORT MAP (ram_addr_in(6), N_42, N_14);
  counter_7_bit_U54: na210 PORT MAP (N_30, cnt_en, N_15);
  counter_7_bit_U64: na210 PORT MAP (N_17, N_14, N_9);
  counter_7_bit_U38: na210 PORT MAP (ram_addr_in(1), N_42, N_19);
  counter_7_bit_U37: na210 PORT MAP (N_8, N_19, N_10);
  counter_7_bit_U63: na210 PORT MAP (cnt_ram_addr_uncompressed_5_port, N_35, N_36);
  counter_7_bit_U34: na210 PORT MAP (ram_addr_in(0), N_42, N_34);
  counter_7_bit_U62: na210 PORT MAP (ram_addr_in(5), N_42, N_32);
  counter_7_bit_U33: na210 PORT MAP (N_16, N_34, N_1);
  counter_7_bit_U40: na210 PORT MAP (cnt_en, N_40, N_43);
  counter_7_bit_U60: na210 PORT MAP (ram_addr_in(4), N_42, N_28);
  counter_7_bit_U43: na210 PORT MAP (N_37, N_46, N_44);
  counter_7_bit_U44: na210 PORT MAP (cnt_ram_addr_substr_1_port, cnt_en, N_46);
  comb_U48: na310 PORT MAP (N_62, N_48, N_50, state_next_0_port);
  comb_U70: na310 PORT MAP (N_56, N_61, state_1_port, N_52);
  comb_U38: na310 PORT MAP (N_52, N_61, N_55, tri_en);
  comb_U45: na310 PORT MAP (N_52, N_51, N_67, state_next_1_port);
  comb_U60: na310 PORT MAP (N_66, N_71, N_69, N_59);
  comb_U59: na310 PORT MAP (N_59, N_57, ram_data_in, N_58);
  comb_U52: na310 PORT MAP (N_76, cnt_ram_addr_uncompressed_6_port, N_75, N_70);
  counter_7_bit_U53: na310 PORT MAP (N_28, N_12, N_15, N_13);
  counter_7_bit_U41: na310 PORT MAP (N_4, N_5, N_6, N_7);
  counter_7_bit_U75: na310 PORT MAP (cnt_en, N_22, N_30, N_26);
  counter_7_bit_U61: na310 PORT MAP (N_36, N_26, N_32, N_31);
  comb_U66: no310 PORT MAP (state_1_port, state_2_port, N_56, cnt_set);
  comb_U43: no310 PORT MAP (N_56, state_2_port, N_60, tri_en_substr);
  comb_U58: no310 PORT MAP (N_56, state_1_port, N_61, N_65);
  comb_U41: no310 PORT MAP (N_63, tri_en_substr, N_64, N_68);
  counter_7_bit_U76: no310 PORT MAP (cnt_ram_addr_uncompressed_3_port, cnt_ram_addr_uncompressed_4_port, N_27, N_30);
  counter_7_bit_U78: no310 PORT MAP (cnt_ram_addr_substr_1_port, cnt_ram_addr_substr_2_port, cnt_ram_addr_uncompressed_0_port, N_41);
  comb_U42: no210 PORT MAP (N_61, N_54, N_64);
  comb_U69: no210 PORT MAP (state_1_port, state_0_port, N_57);
  comb_U44: no210 PORT MAP (N_67, N_70, N_63);
  comb_U72: no210 PORT MAP (N_60, N_61, ready_out_int);
  comb_U61: no210 PORT MAP (cnt_ram_addr_uncompressed_6_port, cnt_ram_addr_uncompressed_5_port, N_69);
  comb_U56: no210 PORT MAP (N_71, N_72, N_76);
  comb_U53: no210 PORT MAP (N_74, N_73, N_75);
  adder_7_bit_U13: no210 PORT MAP (cnt_ram_addr_uncompressed_4_port, cnt_ram_addr_uncompressed_3_port, N_96);
  adder_7_bit_U8: no210 PORT MAP (cnt_ram_addr_uncompressed_5_port, N_86, N_95);
  counter_7_bit_U59: no210 PORT MAP (N_38, N_41, N_45);
  counter_7_bit_U58: no210 PORT MAP (N_39, N_45, N_3);
  counter_7_bit_U73: no210 PORT MAP (N_38, N_22, N_24);
  counter_7_bit_U68: no210 PORT MAP (N_24, N_35, N_29);
  counter_7_bit_U70: no210 PORT MAP (N_39, N_23, N_25);
  counter_7_bit_U71: no210 PORT MAP (N_38, N_30, N_23);
  counter_7_bit_U46: no210 PORT MAP (N_38, N_40, N_33);
  counter_7_bit_U72: no210 PORT MAP (cnt_set, cnt_en, N_39);
  counter_7_bit_U45: no210 PORT MAP (N_39, N_33, N_37);
  counter_7_bit_U66: no210 PORT MAP (N_39, cnt_en, N_42);
  comb_ram_we_tri: tinv10 PORT MAP (N_53, N_54, ram_we_int);
  comb_ram_data_out_tri: tinv10 PORT MAP (N_53, N_58, ram_data_out_int);
  tristate_8_bit_normal_o_tri_7_inst: tinv10 PORT MAP (tri_en, N_80, ram_addr_out_int(7));
  tristate_8_bit_substr_o_tri_7_inst: tinv10 PORT MAP (n2, N_78, ram_addr_out_int(7));
  tristate_8_bit_normal_o_tri_5_inst: tinv10 PORT MAP (tri_en, N_79, ram_addr_out_int(5));
  tristate_8_bit_substr_o_tri_5_inst: tinv10 PORT MAP (n2, N_77, ram_addr_out_int(5));
  tristate_8_bit_normal_o_tri_1_inst: tinv10 PORT MAP (tri_en, N_84, ram_addr_out_int(1));
  tristate_8_bit_substr_o_tri_1_inst: tinv10 PORT MAP (n2, N_82, ram_addr_out_int(1));
  tristate_8_bit_normal_o_tri_2_inst: tinv10 PORT MAP (tri_en, N_83, ram_addr_out_int(2));
  tristate_8_bit_substr_o_tri_2_inst: tinv10 PORT MAP (n2, N_81, ram_addr_out_int(2));
  tristate_8_bit_normal_o_tri_6_inst: tinv10 PORT MAP (tri_en, N_89, ram_addr_out_int(6));
  tristate_8_bit_substr_o_tri_6_inst: tinv10 PORT MAP (n2, N_87, ram_addr_out_int(6));
  tristate_8_bit_normal_o_tri_3_inst: tinv10 PORT MAP (tri_en, N_90, ram_addr_out_int(3));
  tristate_8_bit_substr_o_tri_3_inst: tinv10 PORT MAP (n2, N_88, ram_addr_out_int(3));
  tristate_8_bit_normal_o_tri_4_inst: tinv10 PORT MAP (tri_en, N_94, ram_addr_out_int(4));
  tristate_8_bit_substr_o_tri_4_inst: tinv10 PORT MAP (n2, N_92, ram_addr_out_int(4));
  tristate_8_bit_normal_o_tri_0_inst: tinv10 PORT MAP (tri_en, N_93, ram_addr_out_int(0));
  tristate_8_bit_substr_o_tri_0_inst: tinv10 PORT MAP (n2, N_91, ram_addr_out_int(0));
  state_reg_2_inst: dfr11 PORT MAP (state_next_2_port, rst, clk, state_2_port);
  state_reg_0_inst: dfr11 PORT MAP (state_next_0_port, rst, clk, state_0_port);
  state_reg_1_inst: dfr11 PORT MAP (state_next_1_port, rst, clk, state_1_port);
  counter_7_bit_state_reg_0_inst: dfr11 PORT MAP (N_1, rst, clk, cnt_ram_addr_uncompressed_0_port);
  counter_7_bit_state_reg_2_inst: dfr11 PORT MAP (N_7, rst, clk, cnt_ram_addr_substr_2_port);
  counter_7_bit_state_reg_3_inst: dfr11 PORT MAP (N_21, rst, clk, cnt_ram_addr_uncompressed_3_port);
  counter_7_bit_state_reg_4_inst: dfr11 PORT MAP (N_13, rst, clk, cnt_ram_addr_uncompressed_4_port);
  counter_7_bit_state_reg_6_inst: dfr11 PORT MAP (N_9, rst, clk, cnt_ram_addr_uncompressed_6_port);
  counter_7_bit_state_reg_1_inst: dfr11 PORT MAP (N_10, rst, clk, cnt_ram_addr_substr_1_port);
  counter_7_bit_state_reg_5_inst: dfr11 PORT MAP (N_31, rst, clk, cnt_ram_addr_uncompressed_5_port);

END extracted;



