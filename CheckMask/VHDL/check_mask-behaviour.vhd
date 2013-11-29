library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture check_mask_behaviour of check_mask is
	type typestate is (rust, startup, wait_for_lut, wait_for_ram, check, output);
	signal state, next_state : typestate;
	signal pixel, next_pixel : std_logic_vector(1 downto 0); --is niet synthetiseerbaar zonder next_pixel
	
begin	
	--data <= 'Z';
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if rst = '1' then
				state <= rust;
			else
				state <= next_state;
				pixel <= next_pixel;
			end if;
		end if;
	end process;

	process (state, rst, start)
	--variable pixel : integer range 0 to 3; zorgt ervoor dat het signaal pixel gaat racen als hij bezig is, rst beeindigt de race
	--variable pixel : unsigned (1 downto 0); --synthetiseerbaar, maar pixel gaat ook racen
	--variable pixel : std_logic_vector (1 downto 0); --synthetiseerbaar, pixel racet
	begin	
		case state is
			when rust =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';
			   next_pixel <= "00";
			   mask_select <= "00";
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';
				if (start = '1') then
					next_state <= startup;
				else
					next_state <= rust;
				end if;
			when startup =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';
			   next_state <= wait_for_lut;
			when wait_for_lut =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';
			   next_state <= wait_for_ram;
			when wait_for_ram =>
			   write <= '0';
			   empty <= 'Z';
			   ready <= '0';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= mask;
			   data_out <= 'Z';
			   next_state <= check;
			when check =>
			   write <= '0';		   
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';
			   mask_select <= pixel;
			   if(data_in = '1') then
			  	next_state <= rust;
				empty <= '0';
				ready <= '1';
				next_pixel <= pixel;
			   else
				empty <= 'Z';
				ready <= '0';
				if(pixel = "11") then
					next_pixel <= "00";
					next_state <= output;
				else
					next_pixel <= std_logic_vector(unsigned(pixel)+1);
					next_state <= startup;
				end if;
			   end if;
			when output =>
			   write <= '0';
			   empty <= not data_in;
			   ready <= '1';
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   next_state <= rust;       
		end case;
	end process;
end check_mask_behaviour;



















































































