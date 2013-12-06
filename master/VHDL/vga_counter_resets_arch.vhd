library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_counter_resets_behav of vga_counter_resets is
begin
    
	resets : process(pos_x, pos_y)
	begin
		if (unsigned(pos_x) = total_width - 1) then
			if (unsigned(pos_y) = total_height - 1) then
				pos_x_reset <= '1';
				
				pos_y_reset <= '1';
				pos_y_enable <= '0';
			else
				pos_x_reset <= '1';
				
				pos_y_reset <= '0';
				pos_y_enable <= '1';
			end if;
		else
			pos_x_reset <= '0';
				
			pos_y_reset <= '0';
			pos_y_enable <= '0';
		end if;
	end process;
end;