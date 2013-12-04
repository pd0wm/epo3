library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of de_piece is
	type sending_state is (reset, waiting_1, writing, waiting_2, done, lut_lookup);

	signal state, new_state                 : sending_state;
	signal cur_block, new_block             : unsigned(1 downto 0);
	signal cur_ready, new_ready             : std_logic;
	signal cur_addr, new_addr               : std_logic_vector(7 downto 0);
	signal cur_mask_select, new_mask_select : std_logic_vector(1 downto 0);
	signal cur_lut_start, new_lut_start     : std_logic;
	signal cur_data, new_data               : std_logic;
	signal cur_write, new_write             : std_logic;

begin
	lbl1 : process(clk)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				state     <= reset;
			end if;
			
			state           <= new_state;
			cur_block       <= new_block;
			cur_ready       <= new_ready;
			cur_addr        <= new_addr;
			cur_mask_select <= new_mask_select;
			cur_lut_start   <= new_lut_start;
			cur_data        <= new_data;
			cur_write       <= new_write;			
		end if;
	end process;

	lbl2 : process(state, clk, cur_block, new_block, cur_ready, new_ready, cur_addr, new_addr, cur_mask_select, new_mask_select, cur_lut_start, new_lut_start, cur_data, new_data, cur_write, new_write)
	begin
		ready       <= cur_ready;
		mask_select <= cur_mask_select;
		lut_start   <= cur_lut_start;
		write       <= cur_write;
		addr        <= cur_addr;
		data        <= cur_data;
	
	case state is
			when reset =>
				addr <= "ZZZZZZZZ";
				write <= 'Z';
				mask_select <= "ZZ";
				data <= 'Z';

				new_write       <= 'Z';
				new_ready       <= '0';
				new_addr        <= "ZZZZZZZZ";
				new_mask_select <= "ZZ";
				new_lut_start   <= '0';
				new_block       <= "00";
				new_data        <= 'Z';

				if (start = '1') then
					new_state <= lut_lookup;
				else
					new_state <= reset;
				end if;



			when lut_lookup =>
				new_write       <= '0';
				new_lut_start   <= '1';
				new_mask_select <= std_logic_vector(cur_block);

				new_ready <= cur_ready;
				new_addr  <= cur_addr;
				new_data  <= cur_data;
				new_block <= cur_block;

				new_state <= waiting_1;
			when waiting_1 =>
				if (lut_ready = '0') then
					new_state <= waiting_1;
				else
					new_state <= writing;
				end if;


				new_write       <= cur_write;
				new_lut_start   <= cur_lut_start;
				new_mask_select <= cur_mask_select;
				new_block       <= cur_block;
				new_addr        <= cur_addr;
				new_data        <= cur_data;
				new_ready <= cur_ready;
				

			when writing =>
				new_write       <= '1';
				new_ready       <= cur_ready;
				new_addr        <= mask;
				new_data        <= draw_erase;
				new_block       <= cur_block + 1;
				new_lut_start   <= '0';
				new_mask_select <= "ZZ";

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


				new_write       <= cur_write;
				new_lut_start   <= cur_lut_start;
				new_mask_select <= cur_mask_select;
				new_block       <= cur_block;
				new_addr        <= cur_addr;
				new_data        <= cur_data;
				new_ready <= cur_ready;

			when done =>
				if (start = '1') then
					new_state <= done;
					new_ready       <= '1';
				else
					new_state <= reset;
					new_ready       <= '0';
				end if;

				new_write       <= 'Z';
				
				new_lut_start   <= '0';
				new_mask_select <= "ZZ";
				new_block       <= "00";
				new_addr        <= "ZZZZZZZZ";
				new_data        <= 'Z';

		end case;
	end process;
end behaviour;




































