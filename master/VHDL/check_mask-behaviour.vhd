library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture check_mask_behaviour of check_mask is
	type typestate is (rust, startup, wait_for_lut, wait_for_ram, check, output);
	signal state, next_state : typestate;
	signal pixel, next_pixel : std_logic_vector(1 downto 0); 
	signal next_empty, empty_s : std_logic;	

begin	
	empty <= empty_s;
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if rst = '1' then
				state <= rust;
			else
				state <= next_state;
				pixel <= next_pixel;
				empty_s <= next_empty;
			end if;
		end if;
	end process;

	process (state, rst, start, lut_ready, lut_error, pixel, mask, data_in, empty_s)
	begin	
		case state is
			when rust =>
			   write <= 'Z';
			   next_empty <= '0';
			   ready <= '0';
			   lut_start <= '0';
			   next_pixel <= "00";
			   mask_select <= "ZZ";
			   addr <= "ZZZZZZZZ";
				if (start = '1') then
					next_state <= startup;
				else
					next_state <= rust;
				end if;

			next_state <= rust;
			when startup =>
			   write <= '0';
			   next_empty <= '0';
			   ready <= '0';
			   lut_start <= '1';
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= "ZZZZZZZZ";
			   next_state <= wait_for_lut;
			when wait_for_lut =>
			   write <= '0';
			   next_empty <= '0';
			   ready <= '0';
			   lut_start <= '1';
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= "ZZZZZZZZ";
			   if(lut_ready = '1') then
				if(lut_error = '0') then
			   		next_state <= wait_for_ram;
				else
					next_state <= output;
				end if;
			   else
				next_state <= wait_for_lut;
			   end if;
			when wait_for_ram =>
			   write <= '0';
			   next_empty <= '0';
			   ready <= '0';
			   lut_start <= '0';
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= mask;
			   next_state <= check;
			when check =>
			   write <= '0';		 
			   lut_start <= '0';  
			   addr <= "ZZZZZZZZ";
			   mask_select <= pixel;
			   if(data_in = '1') then
			  	next_state <= output;
				next_empty <= '0';
				ready <= '1';
				next_pixel <= "00";
			   else
				ready <= '0';
				if(pixel = "11") then
					next_empty <= '1';
					next_pixel <= "00";
					next_state <= output;
				else
					next_empty <= '0';				
					next_pixel <= std_logic_vector(unsigned(pixel)+1);
					next_state <= startup;
				end if;
			   end if;
			when output =>
			   write <= '0';
			   next_empty <= empty_s;
			   ready <= '1';
			   lut_start <= '0';
			   addr <= "ZZZZZZZZ";
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   if(start = '0') then
			   	next_state <= rust;
			   else
				next_state <= output;
			   end if;   
		end case;
	end process;
end check_mask_behaviour;























