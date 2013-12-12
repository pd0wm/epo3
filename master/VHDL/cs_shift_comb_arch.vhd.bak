library ieee;
use ieee.std_logic_1164.all;

architecture cs_shift_comb_behav of cs_shift_comb is
begin
	process(state, start_in, cnt_ram_addr)
	begin
		state_next <= state;

		cnt_set <= '0';
		cnt_en  <= '0';

		tri_en        <= '1';
		tri_en_substr <= '0';

		ram_we <= '0';
		ready_out <= '0';
		ram_data_out <= '0';

		case state is
			when "000" => -- lock
				-- High Z
				ram_we <= 'Z';
				ram_data_out <= 'Z';
				tri_en <= '0';
			
				if (start_in = '1') then
					state_next <= "001";
				end if;
			when "001" => -- init
				cnt_set    <= '1';
				state_next <= "010";
				
			when "010" => -- init_decrease
				cnt_en <= '1';
				state_next <= "011";

			when "011" => -- read
				tri_en <= '0';
				tri_en_substr <= '1';
				state_next    <= "100";
			when "100" => -- write
				if (cnt_ram_addr(6 downto 3) = "0000") then
					ram_data_out <= '0';
				else
					ram_data_out <= ram_data_in;
				end if;
				
				ram_we       <= '1';
				cnt_en       <= '1';
				state_next   <= "101";
				
			when "101" => -- check			
				if (cnt_ram_addr = "1111111") then
					state_next <= "110";
				else
					state_next <= "011";
				end if;

			when others => -- (110) ready		
				ready_out <= '1';
				state_next <= "000";
		end case;
	end process;
end architecture;