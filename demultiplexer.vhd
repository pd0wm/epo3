library ieee;
use ieee.std_logic_1164.all;
entity demultiplexer is
	port(
		clk                            : in  std_logic;
		rst                            : in  std_logic;

		selector                       : in  std_logic_vector(3 downto 0);

		data_write_in_check_mask       : in  std_logic_vector(3 downto 0);
		data_write_in_draw_next        : in  std_logic_vector(3 downto 0);
		data_write_in_draw_erase_piece : in  std_logic_vector(3 downto 0);
		data_write_in_clear_and_shift  : in  std_logic_vector(3 downto 0);
		data_write_in_score            : in  std_logic_vector(3 downto 0);
		data_write_out                 : out std_logic_vector(3 downto 0);

		data_read_out_check_mask       : out std_logic_vector(3 downto 0);
		data_read_out_draw_next        : out std_logic_vector(3 downto 0);
		data_read_out_draw_erase_piece : out std_logic_vector(3 downto 0);
		data_read_out_clear_and_shift  : out std_logic_vector(3 downto 0);
		data_read_out_score            : out std_logic_vector(3 downto 0);
		data_read_in                   : out std_logic_vector(3 downto 0);

		addr_in_check_mask             : in  std_logic_vector(7 downto 0);
		addr_in_draw_next              : in  std_logic_vector(7 downto 0);
		addr_in_draw_erase_piece       : in  std_logic_vector(7 downto 0);
		addr_in_clear_and_shift        : in  std_logic_vector(7 downto 0);
		addr_in_score                  : in  std_logic_vector(7 downto 0);
		addr_out                       : out std_logic_vector(7 downto 0)
	);
end demultiplexer;

