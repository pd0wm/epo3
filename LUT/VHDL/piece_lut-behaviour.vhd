library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture piece_lut_behaviour of piece_lut is
	type typestate is (rust, rom, wait_for_rom, x_calc, x_overflow, y_calc, y_overflow, output);
	signal lut_state, lut_next_state : typestate;
	signal lut_next_mask : std_logic_vector (7 downto 0); -- prev_mask was een signal
	signal lut_x_out : std_logic_vector(3 downto 0);
	signal lut_y_out : std_logic_vector(4 downto 0);
	
begin
	
	process(lut_clk)
	begin
		if (lut_clk'event and lut_clk = '1') then
			if lut_rst = '1' then
				lut_state <= rust;
			else
				lut_state <= lut_next_state;
			end if;
		end if;
	end process;

	process (lut_state, lut_rst, lut_start)
		--variable rom_v : std_logic_vector(6 downto 0);
	begin
		lut_rom_addr(6 downto 4) <= lut_piece_type;
		lut_rom_addr(3 downto 2) <= lut_rot;
		lut_rom_addr(1 downto 0) <= lut_mask_select;
		lut_mask(7) <= lut_next_piece;
		lut_mask(6 downto 3) <= lut_y_out(3 downto 0);
		lut_mask(2 downto 0) <= lut_x_out(2 downto 0);
		case lut_state is
			when rust =>
				lut_ready <= '0';
				lut_error_side <= '0';
				lut_error_bot <= '0';
				--rom_addr <= rom_v;	
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
				if (lut_start = '1') then
					lut_next_state <= rom;
				else
					lut_next_state <= rust;
				end if;
			when rom =>
				lut_ready <= '0';
				lut_error_side <= '0';
				lut_error_bot <= '0';
				--rom_addr <= rom_v;
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
				lut_next_state <= wait_for_rom;
			when wait_for_rom =>
				lut_ready <= '0';
				lut_error_side <= '0';
				lut_error_bot <= '0';
				--rom_addr <= rom_v;
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
				lut_next_state <= x_calc;
			when x_calc =>
				lut_ready <= '0';
				lut_error_side <= '0';
				lut_error_bot <= '0';
				--rom_addr <= rom_v;
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));			    	
				lut_next_state <= x_overflow;
			when x_overflow =>
				lut_ready <= '0';			
				lut_error_bot <= '0';				
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
				if(lut_x_out(3) = '1') then
					lut_next_state <= rust;
					lut_error_side <= '1';
				else
					lut_next_state <= y_calc;
					lut_error_side <= '0';
				end if;
			when y_calc =>
				lut_ready <= '0';
				lut_error_side <= '0';
				lut_error_bot <= '0';
				--rom_addr <= rom_v;
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
			    	lut_next_state <= y_overflow;
			when y_overflow =>
				lut_ready <= '0';
				lut_error_side <= '0';						
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
				if(lut_y_out(4) = '1') then
					lut_next_state <= rust;
					lut_error_bot <= '1';
				else
					lut_next_state <= output;
					lut_error_bot <= '0';
				end if;
			when output =>
				lut_ready <= '1';
				lut_error_side <= '0';
				lut_error_bot <= '0';
				--rom_addr <= rom_v;
				lut_ready <= '1';
				lut_x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(1 downto 0))) + to_integer(unsigned(lut_x)),4));
				lut_y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(lut_rom_data(3 downto 2))) + to_integer(unsigned(lut_y)),5));
				lut_next_state <= rust;
		end case;
	end process;
end piece_lut_behaviour;

































