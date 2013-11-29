-- Generated by: xvhdl 2.49 31-Jul-2008
-- Date: 29-Nov-13 11:02:28
-- Path: /home/tqiu/Documents/CheckMask/test

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY CellsLib;
USE CellsLib.CellsLib_DECL_PACK.all;

-- user directives added from .sls2vhdl


ARCHITECTURE extracted OF Check_mask IS


  SIGNAL mask_select_int: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL ready_int: STD_LOGIC;
  SIGNAL empty_int: STD_LOGIC;
  SIGNAL write_int: STD_LOGIC;
  SIGNAL addr_int: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL data_out_int: STD_LOGIC;

  SIGNAL vss: STD_LOGIC;
BEGIN
  vss <= '0';

  mask_select <= mask_select_int;
  ready <= ready_int;
  empty <= empty_int;
  write <= write_int;
  addr <= addr_int;
  data_out <= data_out_int;

  write_int <= vss;

END extracted;


