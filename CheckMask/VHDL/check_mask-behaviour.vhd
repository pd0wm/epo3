library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture check_mask_behaviour of check_mask is
	type typestate is (rust, startup, wait_for_lut, wait_for_ram, check, done);
	signal state, next_state : typestate;
	signal pixel, next_pixel : std_logic_vector(1 downto 0); --is niet synthetiseerbaar zonder next_pixel
	signal empty_s, next_empty : std_logic;	

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
				empty_s <= next_empty;
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
			   next_empty <= '0';
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
			   next_empty <= '0';
			   ready <= '0';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';
			   next_state <= wait_for_lut;
			when wait_for_lut =>
			   write <= '0';
			   next_empty <= '0';
			   ready <= '0';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';
			   next_state <= wait_for_ram;
			when wait_for_ram =>
			   write <= '0';
			   next_empty <= '0';
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
			   ready <= '0';
			   if(data_in = '1') then
			  	next_state <= done;
				next_empty <= '0';
				next_pixel <= pixel;
			   else
				if(pixel = "11") then
					next_pixel <= "00";
					next_empty <= '1';
					next_state <= done;
				else
					next_pixel <= std_logic_vector(unsigned(pixel)+1);
					next_empty <= '0';
					next_state <= startup;
				end if;
			   end if;
			when done =>
			   write <= '0';
			   next_empty <= empty_s;
			   ready <= '1';
			   addr <= "ZZZZZZZZ";
			   data_out <= 'Z';			   
			   next_pixel <= pixel;
			   mask_select <= pixel;
			   if( start = '0' ) then
				next_state <= rust;
			   else 
				next_state <= done;
			   end if;
		end case;

	empty <= empty_s;

	end process;
end check_mask_behaviour;


































































































