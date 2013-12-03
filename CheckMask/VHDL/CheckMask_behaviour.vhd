library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture check_mask_behaviour of check_mask is
	type typestate is (rust, startup, wait_for_ram, output);
	signal state, next_state : typestate;	
	
begin	
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if rst = '1' then
				state <= rust;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	process (state, rst, start)
	begin	
		case state is
			when rust =>
			   write <= '0';
			   empty <= '0';
			   ready <= '0';
			   lut_start <= '0';
			   mask_select <= "ZZ";
			   addr <= mask;
				if (start = '1') then
					next_state <= startup;
				else
					next_state <= rust;
				end if;
			when startup =>
			   write <= '0';
			   empty <= '0';
			   ready <= '0';
			   lut_start <= '0';
			   mask_select <= "ZZ";
			   addr <= mask;
			   next_state <= wait_for_ram;
			when wait_for_ram =>
			   write <= '0';
			   empty <= '0';
			   ready <= '0';
			   lut_start <= '0';
			   mask_select <= "ZZ";
			   addr <= mask;
			   next_state <= output;
			when output =>
			   write <= '0';
			   empty <= not data_in;
			   ready <= '1';
			   lut_start <= '0';
			   mask_select <= "ZZ";
			   addr <= mask;
			   next_state <= rust;       
		end case;
	end process;
end check_mask_behaviour;




