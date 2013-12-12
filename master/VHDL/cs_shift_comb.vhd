library ieee;
use ieee.std_logic_1164.all;

entity cs_shift_comb is
	port(
		state                                                                   : in  std_logic_vector(2 downto 0);
		state_next                                                              : out std_logic_vector(2 downto 0);
		start_in, ram_data_in                                                   : in  std_logic;
		cnt_ram_addr                                                            : in  std_logic_vector(6 downto 0);
		cnt_set, cnt_en, tri_en, tri_en_substr, ram_we, ready_out, ram_data_out : out std_logic
	);
end entity;
