library IEEE;
use IEEE.std_logic_1164.ALL;

entity bit4 is
   port (do_2:out std_logic;
         addr1_1:in std_logic;
         addr1_2:in std_logic;
         addr2_1:in std_logic;
         addr2_2:in std_logic;
         we1:in std_logic;
         we2:in std_logic;
         we3:in std_logic;
         we4:in std_logic;
         we_com:in std_logic;
         re_1:in std_logic;
         re_2:in std_logic;
         clk:in std_logic;
         rst:in std_logic;
         di:in std_logic;
         do_1:out std_logic);
end bit4;

