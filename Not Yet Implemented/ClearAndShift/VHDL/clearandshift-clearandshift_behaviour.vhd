library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture clearandshift_behaviour of clearandshift is
	type typestate is (rust, read_ram, compare, next_row, next_col, increase_score, shift_read, shift_wait, shift_write, shift_next_col, shift_next_row, clear_top_row, clear_top_row_next_col);
	signal state, next_state : typestate;
	signal row, n_row, shift_row, n_shift_row : std_logic_vector(3 downto 0);
	signal col, n_col, shift_col, n_shift_col : std_logic_vector(2 downto 0);
	signal n_ram_out, n_ram_out_enable, n_score, n_ready, n_ram_write, n_ram_write_enable, n_ram_addr_enable : std_logic;
	signal n_ram_addr : std_logic_vector(7 downto 0);
begin
	
	process (n_ram_out_enable, n_ram_out)
	begin
		if (n_ram_out_enable = '1') then
			ram_out <= n_ram_out;
		else
			ram_out <= 'Z';
		end if;
	end process;

	process (n_ram_write_enable, n_ram_write)
	begin
		if (n_ram_write_enable = '1') then
			ram_write <= n_ram_write;
		else
			ram_write <= 'Z';
		end if;
	end process;

	process (n_ram_addr_enable, n_ram_addr)
	begin
		if (n_ram_addr_enable = '1') then
			ram_addr <= n_ram_addr;
		else
			ram_addr <= "ZZZZZZZZ";
		end if;
	end process;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if reset = '1' then
				state <= rust;
				
				ready <= '1';
				ram_out <= 'Z';
				ram_addr <= "ZZZZZZZZ";
				ram_write <= 'Z';
				score <= '0';
				row <= "0000";
				col <= "000";
				shift_row <= "0000";
				shift_col <= "000";
			else
				state <= next_state;

				ready <= n_ready;
				score <= n_score;
				row <= n_row;
				col <= n_col;
				shift_row <= n_shift_row;
				shift_col <= n_shift_col;
			end if;
		end if;
	end process;

	process (state, reset, start)
		variable v_ram_addr, v_shift_read_addr, v_shift_write_addr : std_logic_vector(7 downto 0);
	begin
		v_ram_addr := '0' & row & col;
		v_shift_read_addr := '0' & std_logic_vector(unsigned(shift_row) - 1) & shift_col;
		v_shift_write_addr := '0' & shift_row & shift_col;

		case state is
			when rust =>
				n_ready <= '1';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= "00000000";
				n_ram_addr_enable <= '0';
				n_ram_write <= '0';
				n_ram_write_enable <= '0';
				n_score <= '0';
				n_row <= "0000";
				n_col <= "000";
				n_shift_row <= "0000";
				n_shift_col <= "000";
				
				if (start = '1') then
					next_state <= read_ram;
				else
					next_state <= rust;
				end if;
			when read_ram =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_ram_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= "0000";
				n_shift_col <= "000";
				
				next_state <= compare;
			when compare =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_ram_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= "0000";
				n_shift_col <= "000";
				
				if (ram_in = '1') then
					next_state <= next_col;
				else
					next_state <= next_row;
				end if;
			when next_row =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_ram_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_col <= "000";
				n_shift_row <= "0000";
				n_shift_col <= "000";
				
				if (row = "1111") then
					n_row <= row;
					next_state <= rust;
				else
					n_row <= std_logic_vector(unsigned(row) + 1);
					next_state <= read_ram;
				end if;
			when next_col =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_ram_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_shift_row <= "0000";
				n_shift_col <= "000";
				
				if (col = "111") then
					n_col <= "000";
					next_state <= increase_score;
				else
					n_col <= std_logic_vector(unsigned(col) + 1);
					next_state <= read_ram;
				end if;
			when increase_score =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_ram_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '1';
				n_row <= row;
				n_col <= col;
				n_shift_row <= row;
				n_shift_col <= "000";
				
				if (row = "0000") then
					next_state <= clear_top_row;
				else
					next_state <= shift_read;
				end if;
			when shift_read =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_shift_read_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= shift_row;
				n_shift_col <= shift_col;
				
				next_state <= shift_wait;
			when shift_wait =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_shift_read_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= shift_row;
				n_shift_col <= shift_col;
				
				next_state <= shift_write;
			when shift_write =>
				n_ready <= '0';
				n_ram_out <= ram_in;
				n_ram_out_enable <= '1';
				n_ram_addr <= v_shift_write_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '1';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= shift_row;
				n_shift_col <= shift_col;
				
				if (shift_row = "0000") then
					next_state <= clear_top_row;
				else
					if (shift_col = "111") then
						next_state <= shift_next_row;
					else
						next_state <= shift_next_col;
					end if;
				end if;
			when shift_next_col =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_shift_read_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= shift_row;
				n_shift_col <= std_logic_vector(unsigned(shift_col) + 1);
				
				next_state <= shift_read;
			when shift_next_row =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '0';
				n_ram_addr <= v_shift_read_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= std_logic_vector(unsigned(shift_row) - 1);
				n_shift_col <= "000";
				
				next_state <= shift_read;
			when clear_top_row =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '1';
				n_ram_addr <= v_shift_write_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '1';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= "0000";
				n_shift_col <= shift_col;
				
				if (shift_col = "111") then
					next_state <= next_row;
				else
					next_state <= clear_top_row_next_col;
				end if;
			when clear_top_row_next_col =>
				n_ready <= '0';
				n_ram_out <= '0';
				n_ram_out_enable <= '1';
				n_ram_addr <= v_shift_write_addr;
				n_ram_addr_enable <= '1';
				n_ram_write <= '0';
				n_ram_write_enable <= '1';
				n_score <= '0';
				n_row <= row;
				n_col <= col;
				n_shift_row <= "0000";
				n_shift_col <= std_logic_vector(unsigned(shift_col) + 1);
				
				next_state <= clear_top_row;
		end case;
	end process;
end clearandshift_behaviour;












































