library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture piece_lut_behaviour of piece_lut is
	type typestate is (rust, rom, wait_for_rom, x_calc, x_overflow, y_calc, y_overflow, output);
	signal state, next_state        : typestate;
	signal x_out                    : std_logic_vector(3 downto 0);
	signal y_out                    : std_logic_vector(4 downto 0);
	signal prev_start               : std_logic;
	signal next_overflow, overflow1 : std_logic;

begin
	overflow <= overflow1;
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state     <= rust;
				overflow1 <= '0';
			else
				state     <= next_state;
				overflow1 <= next_overflow;
			end if;
		end if;
	end process;

	process(state, rst, check_start, draw_start)
	begin
		rom_addr(6 downto 4) <= piece_type;
		rom_addr(3 downto 2) <= rot;
		rom_addr(1 downto 0) <= mask_select;
		mask(7)              <= next_piece;
		mask(6 downto 3)     <= y_out(3 downto 0);
		mask(2 downto 0)     <= x_out(2 downto 0);
		case state is
			when rust =>
				ready         <= '0';
				next_overflow <= '0';
				prev_start    <= check_start or draw_start;
				x_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				if ((check_start or draw_start) = '1' and prev_start = '0') then
					next_state <= rom;
					prev_start <= '1';
				else
					next_state <= rust;
				end if;
			when rom =>
				ready         <= '0';
				next_overflow <= '0';
				prev_start    <= check_start or draw_start;
				x_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				next_state    <= wait_for_rom;
			when wait_for_rom =>
				ready         <= '0';
				next_overflow <= '0';
				prev_start    <= check_start or draw_start;
				x_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				next_state    <= x_calc;
			when x_calc =>
				ready         <= '0';
				next_overflow <= '0';
				prev_start    <= check_start or draw_start;
				x_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				next_state    <= x_overflow;
			when x_overflow =>
				ready      <= '0';
				prev_start <= check_start or draw_start;
				x_out      <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out      <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				if (x_out(3) = '1') then
					next_state    <= output;
					next_overflow <= '1';
				else
					next_state    <= y_calc;
					next_overflow <= '0';
				end if;
			when y_calc =>
				ready         <= '0';
				next_overflow <= '0';
				prev_start    <= check_start or draw_start;
				x_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				next_state    <= y_overflow;
			when y_overflow =>
				ready      <= '0';
				prev_start <= check_start or draw_start;
				x_out      <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out      <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				next_state <= output;
				if (y_out(4) = '1') then
					next_overflow <= '1';
				else
					next_overflow <= '0';
				end if;
			when output =>
				ready         <= '1';
				next_overflow <= overflow1;
				prev_start    <= check_start or draw_start;
				x_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				y_out         <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				if ((check_start or draw_start) = '1') then
					next_state <= output;
				else
					next_state <= rust;
				end if;
		end case;
	end process;
end piece_lut_behaviour;













































