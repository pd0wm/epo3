library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture depiece_simple_arch of depiece_simple is
	signal write_state : std_logic_vector(2 downto 0);
	signal next_write_state : std_logic_vector(2 downto 0);
begin

	L1 : process(write_state)
	begin
		case write_state is
			when "000" =>
				write    <= '1';
				addr     <= "0000001";
				data_out <= '1';
				next_write_state <= "001";
			when "001" =>
				write    <= '1';
				addr     <= "0000010";
				data_out <= '1';
				next_write_state <= "111";
			when others =>
				next_write_state <= "111";
				write    <= '0';
				addr     <= "0000000";
				data_out <= '0';
		end case;	
	end process;
	
	L2 : process(clk, rst)
	begin
		if (rst = '1') then				
				write_state <= "000";			
		elsif (clk'event and clk = '1') then
			write_state <= next_write_state;			
		end if;
	end process;
end;
