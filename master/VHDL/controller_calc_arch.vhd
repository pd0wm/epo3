library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_calc_arch of controller_calc is
begin
	process(old_x, old_y, old_rot, add_sub, rot, x, y)
	begin
			new_x   <= old_x;
			new_y   <= old_y;
			new_rot <= old_rot;
			if (rot = '1') then
				if (add_sub = '1') then
					new_rot <= std_logic_vector(unsigned(old_rot) + 1);
				else
					new_rot <= std_logic_vector(unsigned(old_rot) - 1);
				end if;
			elsif (x = '1') then
				if (add_sub = '1') then
					new_x <= std_logic_vector(unsigned(old_x) + 1);
				else
					new_x <= std_logic_vector(unsigned(old_x) - 1);
				end if;
			elsif (y = '1') then
				if (add_sub = '1') then
					new_y <= std_logic_vector(unsigned(old_y) + 1);
				else
					new_y <= std_logic_vector(unsigned(old_y) - 1);
				end if;
			end if;

	end process;

end;
