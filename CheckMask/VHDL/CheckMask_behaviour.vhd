library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture checkmask_behaviour of checkmask is
	type typestate is (rust, startup, wait_for_ram, output);
	signal state, next_state : typestate;	
	
begin	
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if reset = '1' then
				state <= rust;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	process (state, reset, start)
	begin	
		case state is
			when rust =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';
				ram_out <= "ZZZZZZZZ";
				if (start = '1') then
					next_state <= startup;
				else
					next_state <= rust;
				end if;
			when startup =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';
				ram_out <= "ZZZZZZZZ";
			   next_state <= wait_for_ram;
			when wait_for_ram =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';
				ram_out <= ram_in;
			   next_state <= output;
			when output =>
			   write <= '0';
			   empty <= not data;
			   ready <= '1';
				ram_out <= ram_in;
			   next_state <= rust;       
		end case;
	end process;
end checkmask_behaviour;


