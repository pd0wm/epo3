library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture timer_det_arch of timer_det is
begin
	process (cnt_val, time)
	begin
		if (
			(unsigned(cnt_val) = 30 and time = '1') or
			(unsigned(cnt_val) = 3 and time = '0')
		) then
			done <= '1';
		else
			done <= '0';
		end if;
	end process;
end timer_det_arch;