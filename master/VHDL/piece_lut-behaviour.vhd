library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture piece_lut_behaviour of piece_lut is
	type typestate is (reset, calc_rom_addr_1, calc_rom_addr_2, wait_for_rom, cord_calc, cord_overflow, output);
	signal state, next_state          : typestate;
	signal cur_x_out, new_x_out       : std_logic_vector(3 downto 0);
	signal cur_y_out, new_y_out       : std_logic_vector(4 downto 0);
	signal prev_start                 : std_logic;
	signal new_overflow, cur_overflow : std_logic;
	signal new_ready, cur_ready       : std_logic;
	signal cur_mask, new_mask         : std_logic_vector(7 downto 0);
	signal cur_rom_addr, new_rom_addr : std_logic_vector(6 downto 0);

begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state <= reset;
			else
				cur_x_out    <= new_x_out;
				cur_y_out    <= new_y_out;
				state        <= next_state;
				cur_ready    <= new_ready;
				cur_overflow <= new_overflow;
				cur_mask     <= new_mask;
				prev_start   <= check_start or draw_start;

			end if;

			overflow <= cur_overflow;
			mask     <= cur_mask;
			ready    <= cur_ready;

		end if;
	end process;

	process(state, rst, prev_start, check_start, draw_start, rom_data, x, y, rot, piece_type, mask_select, next_piece, prev_start)
	begin
		case state is
			when reset =>
				if ((check_start or draw_start) = '1' and prev_start = '0') then
					next_state <= calc_rom_addr_1;
				else
					next_state <= reset;
				end if;

				new_ready    <= '0';
				new_overflow <= '0';
				new_x_out    <= (others => '0');
				new_y_out    <= (others => '0');
				new_rom_addr <= (others => '0');
				new_mask     <= (others => '0');

			when calc_rom_addr_1 =>
				new_ready    <= '0';
				new_overflow <= '0';
				new_x_out    <= cur_x_out;
				new_y_out    <= cur_x_out;

				new_ready    <= cur_ready;
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;

				next_state <= calc_rom_addr_2;

			when calc_rom_addr_2 =>
				new_rom_addr(6 downto 4) <= piece_type;
				new_rom_addr(3 downto 2) <= rot;
				new_rom_addr(1 downto 0) <= mask_select;

				new_mask(7)          <= next_piece;
				new_mask(6 downto 3) <= cur_y_out(3 downto 0);
				new_mask(2 downto 0) <= cur_x_out(2 downto 0);

				new_ready    <= cur_ready;
				new_overflow <= cur_overflow;
				new_x_out    <= cur_x_out;
				new_y_out    <= cur_y_out;

				next_state <= wait_for_rom;

			when wait_for_rom =>
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;
				new_ready    <= cur_ready;
				new_overflow <= cur_overflow;
				new_x_out    <= cur_x_out;
				new_y_out    <= cur_y_out;

				next_state <= cord_calc;

			when cord_calc =>
				new_ready    <= cur_ready;
				new_overflow <= cur_overflow;
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;

				new_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				new_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));

				next_state <= cord_overflow;
				
			when cord_overflow =>
				if (cur_x_out(3) = 1 or cur_y_out(4) = '1') then
					new_overflow <= '1';
				else
					new_overflow <= '0';
				end if;
				
				new_ready    <= '1';
				
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;
				new_x_out    <= cur_x_out;
				new_y_out    <= cur_y_out;
				
				next_state <= output;


			when output =>			
				if ((check_start or draw_start) = '1') then
					next_state <= output;
				else
					next_state <= reset;
				end if;
			
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;
				new_ready    <= cur_ready;
				new_overflow <= cur_overflow;
				new_x_out    <= cur_x_out;
				new_y_out    <= cur_y_out;
				
				
		end case;
	end process;
end piece_lut_behaviour;













































