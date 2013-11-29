library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture piece_lut_behaviour of piece_lut is
	type typestate is (rust, rom, wait_for_rom, x_calc, x_overflow, y_calc, y_overflow, output);
	signal state, next_state : typestate;
	signal next_mask : std_logic_vector (7 downto 0); -- prev_mask was een signal
	signal x_out : std_logic_vector(3 downto 0);
	signal y_out : std_logic_vector(4 downto 0);
	
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
		--variable rom_v : std_logic_vector(6 downto 0);
	begin
		rom_addr(6 downto 4) <= piece_type;
		rom_addr(3 downto 2) <= rot;
		rom_addr(1 downto 0) <= mask_select;
		mask(7) <= next_piece;
		mask(6 downto 3) <= y_out(3 downto 0);
		mask(2 downto 0) <= x_out(2 downto 0);
		case state is
			when rust =>
				ready <= '0';
				error_side <= '0';
				error_bot <= '0';
				--rom_addr <= rom_v;	
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
				if (start = '1') then
					next_state <= rom;
				else
					next_state <= rust;
				end if;
			when rom =>
				ready <= '0';
				error_side <= '0';
				error_bot <= '0';
				--rom_addr <= rom_v;
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
				next_state <= wait_for_rom;
			when wait_for_rom =>
				ready <= '0';
				error_side <= '0';
				error_bot <= '0';
				--rom_addr <= rom_v;
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
				next_state <= x_calc;
			when x_calc =>
				ready <= '0';
				error_side <= '0';
				error_bot <= '0';
				--rom_addr <= rom_v;
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));			    	
				next_state <= x_overflow;
			when x_overflow =>
				ready <= '0';			
				error_bot <= '0';				
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
				if(x_out(3) = '1') then
					next_state <= rust;
					error_side <= '1';
				else
					next_state <= y_calc;
					error_side <= '0';
				end if;
			when y_calc =>
				ready <= '0';
				error_side <= '0';
				error_bot <= '0';
				--rom_addr <= rom_v;
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
			    	next_state <= y_overflow;
			when y_overflow =>
				ready <= '0';
				error_side <= '0';						
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
				if(y_out(4) = '1') then
					next_state <= rust;
					error_bot <= '1';
				else
					next_state <= output;
					error_bot <= '0';
				end if;
			when output =>
				ready <= '1';
				error_side <= '0';
				error_bot <= '0';
				--rom_addr <= rom_v;
				ready <= '1';
				x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(1 downto 0))) + to_integer(unsigned(x)),4));
				y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data(3 downto 2))) + to_integer(unsigned(y)),5));
				next_state <= rust;
		end case;
	end process;
end piece_lut_behaviour;






























