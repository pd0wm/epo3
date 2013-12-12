library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture piece_lut_behaviour of piece_lut is
component adder_x is
   port(x  :in    std_logic_vector(2 downto 0);
        rom_data:in    std_logic_vector(3 downto 0);
	next_piece:in std_logic;
        x_out :out   std_logic_vector(3 downto 0));
end component;
component adder_y is
   port(y  :in    std_logic_vector(3 downto 0);
        rom_data:in    std_logic_vector(3 downto 0);
	next_piece:in std_logic;
        y_out :out   std_logic_vector(4 downto 0));
end component;


	type typestate is (reset, calc_rom_addr_1, calc_rom_addr_2, wait_for_rom, cord_calc, cord_overflow, output1, output2);
	signal state, next_state          : typestate;
	signal cur_rom_addr, new_rom_addr : std_logic_vector(6 downto 0);
	signal cur_mask, new_mask         : std_logic_vector(7 downto 0);
	signal x_out                      : std_logic_vector(3 downto 0);
	signal y_out                      : std_logic_vector(4 downto 0);


begin

	lbl_adder_x: adder_x port map(x, rom_data, next_piece, x_out);
	lbl_adder_y: adder_y port map(y, rom_data, next_piece, y_out);

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
				state        <= next_state;
				cur_mask     <= new_mask;
				cur_rom_addr <= new_rom_addr;
			end if;
		end if;
	end process;

	process(state, rst, check_start, draw_start, rom_data, x, y, piece_type, rot, mask_select)
	begin
		case state is
			when reset =>
				if ((check_start or draw_start) = '1') then
					next_state <= calc_rom_addr_1;
				else
					next_state <= reset;
				end if;

				ready        <= '0';
				overflow     <= '0';
				new_rom_addr <= (others => '0');
				new_mask     <= (others => '0');

			when calc_rom_addr_1 =>
				ready        <= '0';
				overflow     <= '0';
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;

				next_state <= calc_rom_addr_2;

			when calc_rom_addr_2 =>
				new_rom_addr(6 downto 4) <= piece_type;
				new_rom_addr(3 downto 2) <= rot;
				new_rom_addr(1 downto 0) <= mask_select;

				ready <= '0';
				overflow     <= '0';
				new_mask     <= cur_mask;

				next_state <= wait_for_rom;

			when wait_for_rom =>
				new_rom_addr <= cur_rom_addr;
				ready        <= '0';
				overflow     <= '0';
				new_mask     <= cur_mask;
				next_state <= cord_calc;

			when cord_calc =>
				ready        <= '0';
				overflow     <= '0';
				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;
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
				
			when output1 => -- wel overflow
				if ((check_start or draw_start) = '1') then
					ready      <= '1';
					overflow   <= '1';
					next_state <= output1;
				else
					ready      <= '0';
					overflow   <= '1';
					next_state <= reset;
				end if;

				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;

			when output2 => -- geen overflow
				if ((check_start or draw_start) = '1') then
					ready      <= '1';
					overflow   <= '0';
					next_state <= output2;
				else
					ready      <= '0';
					overflow     <= '0';
					next_state <= reset;
				end if;

				new_rom_addr <= cur_rom_addr;
				new_mask     <= cur_mask;


		end case;
	end process;
end piece_lut_behaviour;




















































































