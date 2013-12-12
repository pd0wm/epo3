library ieee;
use ieee.std_logic_1164.all;

architecture cs_compare_comb_behav of cs_compare_comb is
begin
	process(state, row_full, start_in, cnt_ram_addr, ram_data_in, shift_ready)
	begin
		tri_en      <= '1';
		cnt_en      <= '0';
		ready_out   <= '0';
		shift_start <= '0';
		score_out   <= '0';
		defset_en   <= '1';

		state_next    <= state;
		row_full_next <= row_full;

		case state is
			when "0000" => -- lock
				-- High Z
				tri_en <= '0';
				defset_en <= '0';
			
				if (start_in = '1') then
					state_next <= "0001";
				end if;

			when "0001" => -- init
				row_full_next <= '1';
				state_next <= "0010";
			
			-- Row checking
			
			when "0010" => -- check row			
				cnt_en        <= '1';
				row_full_next <= row_full AND ram_data_in;
				
				if (cnt_ram_addr(2 downto 0) = "111") then
					state_next <= "0011";
				end if;
				
			when "0011" => -- check row last
				row_full_next <= row_full AND ram_data_in;
				state_next <= "0100";
				
			when "0100" => -- check row finish
				if (row_full = '1') then
					state_next <= "0101";
				else
					state_next <= "1000";
				end if;
			
			-- Row clearing
			
			when "0101" => -- trigger start
				shift_start <= '1';
				state_next <= "0110";

			when "0110" => -- trigger high Z
				-- High Z
				defset_en <= '0';
				tri_en <= '0';
			
				if (shift_ready = '1') then
					state_next <= "0111";
				end if;

			when "0111" => -- notify score
				score_out  <= '1';
				state_next <= "1000";
			
			-- Finishing
			
			when "1000" => -- check row done
				if (cnt_ram_addr = "0000000") then
					state_next <= "1001";
				else
					state_next <= "0001";
				end if;

			when others => -- (1001) ready
				ready_out  <= '1';
				state_next <= "0000";
		end case;
	end process;
end architecture;