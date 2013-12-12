library ieee;
use ieee.std_logic_1164.all;

entity cs_compare_comb is
	port(
		state                                                                       : in  std_logic_vector(3 downto 0);
		state_next                                                                  : out std_logic_vector(3 downto 0);
		row_full, start_in, ram_data_in, shift_ready                                : in  std_logic;
		cnt_ram_addr                                                                : in  std_logic_vector(6 downto 0);
		tri_en, cnt_en, ready_out, shift_start, score_out, defset_en, row_full_next : out std_logic
	);
end entity;