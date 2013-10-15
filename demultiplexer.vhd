library ieee;
use ieee.std_logic_1164.all;
entity demultiplexer is
	port(
		clk                   : in  std_logic;
		rst                   : in  std_logic;

		selector              : in  std_logic_vector(2 downto 0);

		in_draw_next          : in  std_logic_vector(2 downto 0);
		in_draw_erase_piece   : in  std_logic_vector(2 downto 0);
		in_clear_and_shift    : in  std_logic_vector(2 downto 0);
		in_score              : in  std_logic_vector(2 downto 0);
		data_out              : out std_logic_vector(2 downto 0);

		out_check_mask        : out std_logic_vector(2 downto 0);
		out_draw_erase_piece  : out std_logic_vector(2 downto 0);
		out_clear_and_shift   : out std_logic_vector(2 downto 0);
		data_in               : in  std_logic_vector(2 downto 0);

		addr_check_mask       : in  std_logic_vector(7 downto 0);
		addr_draw_next        : in  std_logic_vector(7 downto 0);
		addr_draw_erase_piece : in  std_logic_vector(7 downto 0);
		addr_clear_and_shift  : in  std_logic_vector(7 downto 0);
		addr_score            : in  std_logic_vector(7 downto 0);
		addr                  : out std_logic_vector(7 downto 0)
	);
end demultiplexer;

