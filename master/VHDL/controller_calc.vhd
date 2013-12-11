library ieee;
use ieee.std_logic_1164.all;
entity controller_calc is
	port(
		old_x              : in  std_logic_vector(2 downto 0);
		old_y              : in  std_logic_vector(3 downto 0);
		old_rot            : in  std_logic_vector(1 downto 0);

		new_x              : out std_logic_vector(2 downto 0);
		new_y              : out std_logic_vector(3 downto 0);
		new_rot            : out std_logic_vector(1 downto 0);

		add_sub, rot, x, y : in  std_logic
	);
end controller_calc;



