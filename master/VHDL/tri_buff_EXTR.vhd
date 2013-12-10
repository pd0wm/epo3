-- Generated by: xvhdl 2.49 31-Jul-2008
-- Date: 29-Nov-13 19:30:51
-- Path: /home/epo3-user/vhdl/draw_score_2/test

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY CellsLib;
USE CellsLib.CellsLib_DECL_PACK.all;

-- user directives added from .sls2vhdl


ARCHITECTURE extracted OF Tri_buff IS

  SIGNAL n3: STD_LOGIC;
  SIGNAL n4: STD_LOGIC;
  SIGNAL n6: STD_LOGIC;
  SIGNAL n7: STD_LOGIC;
  SIGNAL n1: STD_LOGIC;
  SIGNAL n8: STD_LOGIC;
  SIGNAL n5: STD_LOGIC;
  SIGNAL n2: STD_LOGIC;

  SIGNAL outp_int: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

  outp <= outp_int;


  outp_tri_6_inst: tinv10 PORT MAP (sel, n2, outp_int(6));
  outp_tri_0_inst: tinv10 PORT MAP (sel, n8, outp_int(0));
  outp_tri_2_inst: tinv10 PORT MAP (sel, n6, outp_int(2));
  outp_tri_1_inst: tinv10 PORT MAP (sel, n7, outp_int(1));
  outp_tri_4_inst: tinv10 PORT MAP (sel, n4, outp_int(4));
  outp_tri_5_inst: tinv10 PORT MAP (sel, n3, outp_int(5));
  outp_tri_7_inst: tinv10 PORT MAP (sel, n1, outp_int(7));
  outp_tri_3_inst: tinv10 PORT MAP (sel, n5, outp_int(3));
  U15: iv110 PORT MAP (inp(6), n2);
  U9: iv110 PORT MAP (inp(0), n8);
  U16: iv110 PORT MAP (inp(7), n1);
  U12: iv110 PORT MAP (inp(3), n5);
  U10: iv110 PORT MAP (inp(1), n7);
  U11: iv110 PORT MAP (inp(2), n6);
  U14: iv110 PORT MAP (inp(5), n3);
  U13: iv110 PORT MAP (inp(4), n4);

END extracted;



