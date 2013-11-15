library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture vga_behav of vga is
	signal field_addr, field_addr_next                   : std_logic_vector(7 downto 0); -- Current memory address
	signal field_addr_next_row, field_addr_next_row_next : std_logic_vector(7 downto 0); -- Next row memory address
	signal x_pos, x_pos_next                             : std_logic_vector(7 downto 0); -- Keeps track of the x coordinate
	signal y_pos, y_pos_next                             : std_logic_vector(6 downto 0); -- Keeps track of the y coordinate

	------------------------------
	-- VGA TIMINGS
	------------------------------
	signal timer_counter, timer_counter_next : std_logic_vector(7 downto 0);

	-- Delay states
	type timer_state_type is (ready,
		eof_front_porch, eof_pulse_width, eof_back_porch,
		eol_front_porch, eol_pulse_width, eol_back_porch
	);
	signal timer_state, timer_state_next : timer_state_type;
	
	------------------------------
	-- BUFFERS AND OUTPUT
	-- Pipelining to ensure performance
	------------------------------
	
	signal draw, draw_next : std_logic;
	
	signal h_sync_buf, v_sync_buf : std_logic;
	
	signal h_sync_next, v_sync_next : std_logic;
	signal red_next, green_next, blue_next : std_logic;

begin
	-- For now
	vga_clk <= '0';

	-- Determine next position variables
	comb_next_pos : process(x_pos, y_pos)
	begin
		if (unsigned(y_pos) = 199) then     -- y_pos maximum
			if (unsigned(x_pos) = 159) then -- x_pos maximum
				-- End of screen
				x_pos_next <= (others => '0');
				y_pos_next <= (others => '0');
			else
				-- Increment x_pos
				x_pos_next <= std_logic_vector(unsigned(x_pos) + 1);
				y_pos_next <= y_pos;
			end if;
		else
			if (unsigned(x_pos) = 159) then -- x_pos maximum
				-- End of line
				y_pos_next <= std_logic_vector(unsigned(y_pos) + 1);
				x_pos_next <= (others => '0');
			else
				-- Increment x_pos
				x_pos_next <= std_logic_vector(unsigned(x_pos) + 1);
				y_pos_next <= y_pos;
			end if;
		end if;
	end process;

	-- Determine address increment (horizontal)
	comb_addr_inc_hor : process(x_pos)
		variable x_pos_sub : integer range 0 to 2 ** 6 - 1;
		variable y_pos_sub : integer range 0 to 2 ** 5 - 1;
	begin
		x_pos_sub := to_integer(unsigned(x_pos(7 downto 2)));
		y_pos_sub := to_integer(unsigned(y_pos(6 downto 2)));

		field_addr_next <= field_addr;
		draw_next <= '0';

		-- Check for memory address reset
		if (x_pos_sub = 1) then
			field_addr_next <= field_addr_next_row;
		end if;

		-- Check if memory address has to be increased
		if (x_pos_sub > 5 and x_pos_sub < 15 and y_pos_sub > 5 and y_pos_sub < 26) then
			-- In field range
			if ((x_pos AND "00000011") = "00000000") then
				-- Last two bits are zero
				-- Now increment field memory address
				field_addr_next <= std_logic_vector(unsigned(field_addr) + 1);
			end if;
			
			-- Drawing is only allowed in field range
			draw_next <= '1';
		end if;
	end process;

	-- Determine address next row (vertical)
	comb_addr_inc_vert : process(y_pos)
		variable y_pos_sub : integer range 0 to 2 ** 5 - 1;
	begin
		field_addr_next_row_next <= field_addr_next_row;

		-- Only do stuff one time!
		if (x_pos = "00000000") then
			y_pos_sub := to_integer(unsigned(y_pos(6 downto 2)));

			if (y_pos_sub > 6 and y_pos_sub < 26) then
				-- In field range
				if ((y_pos AND "0000011") = "0000000") then
					-- Last two bits are zero
					-- Now increment next row field memory address
					field_addr_next_row_next <= std_logic_vector(unsigned(field_addr_next_row) + 10);
				end if;
			end if;

			-- Reset start address
			if (y_pos = "0000000") then
				field_addr_next_row_next <= (others => '0');
			end if;
		end if;
	end process;

	-- Registers
	regs : process(clk)
	begin
		if (rst = '1') then
			-- Reset
			x_pos               <= (others => '0');
			y_pos               <= (others => '0');
			field_addr          <= (others => '0');
			field_addr_next_row <= (others => '0');

			timer_state   <= eof_front_porch;
			timer_counter <= (others => '0');
			
			draw <= '0';
		elsif (clk'event and clk = '1') then
			-- Timer
			timer_counter <= timer_counter_next;
			timer_state <= timer_state_next;
			
			-- Draw
			draw <= draw_next;
		
			-- Check of end
			if (x_pos_next = "00000000") then
				if (y_pos_next = "0000000") then
					-- frame
					timer_state <= eof_front_porch;
				else
					-- line
					timer_state <= eol_front_porch;
				end if;
			end if;

			-- Read next value to prevent too big of a delay
			if (timer_state = ready) then
				x_pos               <= x_pos_next;
				y_pos               <= y_pos_next;
				field_addr          <= field_addr_next;
				field_addr_next_row <= field_addr_next_row_next;
			end if;
		end if;
	end process;

	------------------------------
	-- VGA TIMINGS
	------------------------------

	-- Comb
	comb_timers : process(timer_state, timer_counter)
	begin
		timer_state_next   <= timer_state;
		timer_counter_next <= timer_counter;
		h_sync_buf <= '0';
		v_sync_buf <= '0';

		-- State machine
		case timer_state is
			when ready =>
				null;

			-- End of line
			when eol_front_porch =>
				h_sync_buf <= '0';
				
				if (unsigned(timer_counter) = 24) then -- H_SYNC FRONT PORCH TIMER
					-- Condition met
					timer_state_next   <= eol_pulse_width;
					timer_counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					timer_counter_next <= std_logic_vector(unsigned(timer_counter) + 1);
				end if;
			when eol_pulse_width =>
				h_sync_buf <= '1';
			
				if (unsigned(timer_counter) = 8) then -- H_SYNC PULSE WIDTH
					-- Condition met
					timer_state_next   <= eol_back_porch;
					timer_counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					timer_counter_next <= std_logic_vector(unsigned(timer_counter) + 1);
				end if;
			when eol_back_porch =>
				h_sync_buf <= '0';
			
				if (unsigned(timer_counter) = 16) then -- H_SYNC BACK PORCH_TIMER
					-- Condition met
					timer_state_next   <= ready;
					timer_counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					timer_counter_next <= std_logic_vector(unsigned(timer_counter) + 1);
				end if;

			-- End of frame
			when eof_front_porch =>
				v_sync_buf <= '0';
				
				if (unsigned(timer_counter) = 60) then -- V_SYNC FRONT PORCH TIMER
					-- Condition met
					timer_state_next   <= eof_pulse_width;
					timer_counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					timer_counter_next <= std_logic_vector(unsigned(timer_counter) + 1);
				end if;
			when eof_pulse_width =>
				v_sync_buf <= '1';
			
				if (unsigned(timer_counter) = 15) then -- V_SYNC PULSE WIDTH
					-- Condition met
					timer_state_next   <= eof_back_porch;
					timer_counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					timer_counter_next <= std_logic_vector(unsigned(timer_counter) + 1);
				end if;
			when eof_back_porch =>
				v_sync_buf <= '0';
			
				if (unsigned(timer_counter) = 30) then --  V_SYNC BACK PORCH TIMER
					-- Condition met
					timer_state_next   <= eol_front_porch;
					timer_counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					timer_counter_next <= std_logic_vector(unsigned(timer_counter) + 1);
				end if;
		end case;
	end process;
	
	------------------------------
	-- BUFFERS AND OUTPUT
	-- Pipelining to ensure performance
	------------------------------
	
	-- Map RAM address
	ram_addr <= field_addr;
	
	comb_out : process (data_in, h_sync_buf, v_sync_buf, draw)
	begin
		h_sync_next <= h_sync_buf;
		v_sync_next <= v_sync_buf;
		
		if (data_in = '1' and draw = '1') then
			red_next <= '0';
			green_next <= '0';
			blue_next <= '0';
		else
			red_next <= '1';
			green_next <= '1';
			blue_next <= '1';
		end if;
	end process;
	
	-- Output
	regs_out : process (clk, rst)
	begin
		if (rst = '1') then
			h_sync <= '0';
			v_sync <= '0';
			
			red <= '0';
			green <= '0';
			blue <= '0';
		elsif (clk'event and clk = '1') then
			h_sync <= h_sync_next;
			v_sync <= v_sync_next;
		
			red <= red_next;
			green <= green_next;
			blue <= blue_next;
		end if;
	end process;
end vga_behav;