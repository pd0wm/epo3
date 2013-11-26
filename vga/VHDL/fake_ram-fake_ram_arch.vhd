library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture fake_ram_arch of fake_ram is
begin
	process(clk, rst)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				ro_data_out <= '0';
			else
				case ro_addr is
					when std_logic_vector(to_unsigned(0),8) =>
						ro_data_out <= '1';
					when others => 
						ro_data_out <= '0';					
				end case;
			end if;
		end if;
	end process;
end;