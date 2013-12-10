library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture piece_lut_behaviour of piece_lut is
component adder_x is
   port(x_in  :in    std_logic_vector(2 downto 0);
        rom_in:in    std_logic_vector(1 downto 0);
        x_out :out   std_logic_vector(3 downto 0));
end component;
component adder_y is
   port(y_in  :in    std_logic_vector(3 downto 0);
        rom_in:in    std_logic_vector(1 downto 0);
        y_out :out   std_logic_vector(4 downto 0));
end component;


	type typestate is (reset, calc_rom_addr_1, calc_rom_addr_2, wait_for_rom, cord_calc, cord_overflow, output1, output2);
	signal state, next_state          : typestate;
	signal cur_rom_addr, new_rom_addr : std_logic_vector(6 downto 0);
	signal cur_mask, new_mask         : std_logic_vector(7 downto 0);
	signal x_out                      : std_logic_vector(3 downto 0);
	signal y_out                      : std_logic_vector(4 downto 0);
	--signal new_overflow, cur_overflow : std_logic;
--signal prev_start                 : std_logic;
--signal cur_x_out, new_x_out       : std_logic_vector(3 downto 0);
--signal cur_y_out, new_y_out       : std_logic_vector(4 downto 0);
--signal new_ready, cur_ready       : std_logic;
--signal new_change, cur_change : std_logic;

begin

	lbl_adder_x: adder_x port map(x, rom_data(1 downto 0), x_out);
	lbl_adder_y: adder_y port map(y, rom_data(3 downto 2), y_out);

	--overflow <= cur_overflow;
	mask     <= cur_mask;
	rom_addr <= cur_rom_addr;	

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state <= reset;
				cur_mask     <= "00000000";
				cur_rom_addr <= "0000000";
			else
				--cur_x_out    <= new_x_out;
				--cur_y_out    <= new_y_out;
				state        <= next_state;
				cur_mask     <= new_mask;
				cur_rom_addr <= new_rom_addr;
			--cur_ready    <= new_ready;
			--cur_change  <= new_change;
			--new_change   <= check_start or draw_start;

			end if;
		end if;
		--ready    <= cur_ready;
		--end if;
	end process;

	process(state, rst, check_start, draw_start, rom_data, x, y, piece_type, rot, mask_select)
	begin
		case state is
			when reset =>
				if ((check_start or draw_start) = '1') then --and cur_change = '0') then
					next_state <= calc_rom_addr_1;
				else
					next_state <= reset;
				end if;

				--new_ready    <= '0';
				ready        <= '0';
				overflow     <= '0';
				--new_overflow <= '0';
				--new_x_out    <= (others => '0');
				--new_y_out    <= (others => '0');
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				new_rom_addr <= (others => '0');
				new_mask     <= (others => '0');

			when calc_rom_addr_1 =>
				--new_ready    <= '0';
				ready        <= '0';
				overflow     <= '0';
				--new_overflow <= '0';
				--new_x_out    <= cur_x_out;
				--new_y_out    <= cur_y_out;
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));

				--new_ready    <= cur_ready;
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;

				next_state <= calc_rom_addr_2;

			when calc_rom_addr_2 =>
				new_rom_addr(6 downto 4) <= piece_type;
				new_rom_addr(3 downto 2) <= rot;
				new_rom_addr(1 downto 0) <= mask_select;

				ready <= '0';
				overflow     <= '0';

				--new_ready    <= cur_ready;
				--new_overflow <= cur_overflow;
				--new_x_out    <= cur_x_out;
				--new_y_out    <= cur_y_out;
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				new_mask     <= cur_mask;

				next_state <= wait_for_rom;

			when wait_for_rom =>
				new_rom_addr <= cur_rom_addr;
				ready        <= '0';
				overflow     <= '0';
				new_mask     <= cur_mask;
				--new_ready    <= cur_ready;
				--new_overflow <= cur_overflow;
				--new_x_out    <= cur_x_out;
				--new_y_out    <= cur_y_out;
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));

				next_state <= cord_calc;

			when cord_calc =>
				--new_ready    <= cur_ready;
				ready        <= '0';
				overflow     <= '0';
				--new_overflow <= cur_overflow;
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;

				--new_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--new_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				--x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));

				next_state <= cord_overflow;

			when cord_overflow =>
				if (x_out(3) = '1' or y_out(4) = '1') then
					next_state <= output1; -- wel overflow
				else
					next_state <= output2; -- geen overflow
				end if;

				new_mask(7)          <= next_piece;
				new_mask(6 downto 3) <= y_out(3 downto 0);
				new_mask(2 downto 0) <= x_out(2 downto 0);

				ready        <= '0';
				overflow     <= '0';
				new_rom_addr <= cur_rom_addr;
				--new_ready    <= cur_ready;
				--new_x_out    <= cur_x_out;
				--new_y_out    <= cur_y_out;
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
				
			when output1 => -- wel overflow
				if ((check_start or draw_start) = '1') then
					--new_ready    <= '1';
					ready      <= '1';
					overflow   <= '1';
					next_state <= output1;
				else
					--new_ready    <= '0';
					ready      <= '0';
					overflow   <= '1';
					next_state <= reset;
				end if;

				new_rom_addr <= cur_rom_addr;
				--ready        <= '1';
				new_mask     <= cur_mask;
				--new_overflow <= cur_overflow;
				--new_x_out    <= cur_x_out;
				--new_y_out    <= cur_y_out;
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));

			when output2 => -- geen overflow
				if ((check_start or draw_start) = '1') then
					--new_ready    <= '1';
					ready      <= '1';
					overflow   <= '0';
					next_state <= output2;
				else
					--new_ready    <= '0';
					ready      <= '0';
					overflow     <= '0';
					next_state <= reset;
				end if;

				new_rom_addr <= cur_rom_addr;
				--ready        <= '1';
				new_mask     <= cur_mask;
				--new_overflow <= cur_overflow;
				--new_x_out    <= cur_x_out;
				--new_y_out    <= cur_y_out;
				--x_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)), 4));
				--y_out        <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)), 5));
	


		end case;
	end process;
end piece_lut_behaviour;



































































































