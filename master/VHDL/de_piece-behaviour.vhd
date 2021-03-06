library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of de_piece is
	type sending_state is (reset, waiting_1, writing, waiting_2, done, lut_lookup);
  signal cur_block, new_cur_block: unsigned (1 downto 0);
	signal state, new_state                 : sending_state;
begin
	lbl1 : process(clk)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				state     <= reset;
				cur_block <= "00";
			else
				state           <= new_state;
				cur_block <= new_cur_block;
			end if;
		end if;
	end process;

	lbl2 : process(state, start, lut_ready, mask, draw_erase, clk, cur_block)
	begin	
	case state is
			when reset =>

				write       <= 'Z';
				ready       <= '0';
				addr        <= "ZZZZZZZZ";
				mask_select <= "ZZ";
				lut_start   <= '0';
				new_cur_block       <= "00";
				data        <= 'Z';

				if (start = '1') then
					new_state <= lut_lookup;
				else
					new_state <= reset;
				end if;

			when lut_lookup =>
				write       <= '0';
				lut_start   <= '1';
				mask_select <= std_logic_vector(cur_block);
				ready <= '0';
				addr  <= "ZZZZZZZZ";
				data  <= 'Z';
				new_cur_block <= cur_block;
				new_state <= waiting_1;
				
			when waiting_1 =>
				if (lut_ready = '0') then
					new_state <= waiting_1;
				else
					new_state <= writing;
				end if;


				write       <= '0';
				lut_start   <= '1';
				mask_select <= std_logic_vector(cur_block);
				new_cur_block       <= cur_block;
				addr        <= "ZZZZZZZZ";
				data        <= 'Z';
				ready <= '0';
				

			when writing =>
				write       <= '1';
				ready       <= '0';
				addr        <= mask;
				data        <= draw_erase;
				new_cur_block       <= cur_block + 1;
				lut_start   <= '0';
				mask_select <= "ZZ";

				if (cur_block = 3) then
					new_state <= done;
				else
					new_state <= waiting_2;
				end if;

			when waiting_2 =>
				if (lut_ready = '1') then
					new_state <= waiting_2;
				else
					new_state <= lut_lookup;
				end if;


				write       <= '0';
				lut_start   <= '0';
				mask_select <= "ZZ";
				new_cur_block       <= cur_block;
				addr        <= "ZZZZZZZZ";
				data        <= 'Z';
				ready <= '0';

			when done =>
				if (start = '1') then
					new_state <= done;
				else
					new_state <= reset;
				end if;

				write       <= '0';
				ready       <= '1';
				lut_start   <= '0';
				mask_select <= "ZZ";
				new_cur_block       <= "00";
				addr        <= "ZZZZZZZZ";
				data        <= 'Z';

		end case;
	end process;
end behaviour;
















































