library ieee;
use ieee.std_logic_1164.all;

architecture ram_fix_behav of ram_fix is
begin
	process(draw_erase_start, draw_score_draw, clear_shift_start, check_start)
	begin
		we <= '0';
		
		if (
			draw_erase_start = '1' or
			draw_score_draw = '1' or
			clear_shift_start = '1' or
			check_start = '1'
		) then
			we <= 'Z';
		end if;
	end process;
end ram_fix_behav;