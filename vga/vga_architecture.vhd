library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture vga_behav of vga is
	signal field_addr, field_addr_next                   : std_logic_vector(7 downto 0); -- Current memory address
	signal field_addr_next_row, field_addr_next_row_next : std_logic_vector(7 downto 0); -- Next row memory address
	signal x_pos, x_pos_next                             : std_logic_vector(7 downto 0); -- Keeps track of the x coordinate
	signal y_pos, y_pos_next                             : std_logic_vector(6 downto 0); -- Keeps track of the y coordinate

	------------------------------
	-- VGA TIMER
	------------------------------
	signal timer_eol, timer_eol_next : std_logic;
	signal timer_eof, timer_eof_next : std_logic;
	signal timer_rdy, timer_rdy_next : std_logic;
	
	-- Delay states
	
begin
	-- For now
	red     <= '0';
	green   <= '0';
	blue    <= '0';
	vga_clk <= '0';
	h_sync  <= '0';
	v_sync  <= '0';

	ram_addr <= field_addr;

	-- Determine next position variables
	comb_next_pos : process(x_pos, y_pos)
	begin
		if (y_pos = "1110111") then     -- y_pos maximum: (119)_10
			if (x_pos = "10011111") then -- x_pos maximum: (159)_10
				-- End of screen
				x_pos_next <= (others => '0');
				y_pos_next <= (others => '0');
			else
				-- Increment x_pos
				x_pos_next <= std_logic_vector(unsigned(x_pos) + 1);
				y_pos_next <= y_pos;
			end if;
		else
			if (x_pos = "10011111") then -- x_pos maximum: (159)_10
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

			timer_eol <= '0';
			timer_eof <= '0';
			timer_rdy <= '1';
		elsif (clk'event and clk = '1') then
			-- Check of end
			if (x_pos_next = "00000000") then
				if (y_pos_next = "0000000") then
					-- frame
					timer_eof <= '1';
				else
					-- line
					timer_eol <= '1';
				end if;
			end if;

			-- Append next ready
			timer_rdy <= timer_rdy_next;

			-- Read next value to prevent too big of a delay
			if (timer_rdy_next = '1') then
				x_pos               <= x_pos_next;
				y_pos               <= y_pos_next;
				field_addr          <= field_addr_next;
				field_addr_next_row <= field_addr_next_row_next;
			end if;
		end if;
	end process;

	-------------------------------------------
	-- VGA TIMER
	-- * Delay must be one clock pulse longer at the end!
	-------------------------------------------

	-- End of line
	comb_eol : process(timer_eol, timer_rdy)
	begin
		timer_eol_next <= timer_eol;

		-- Check for flag reset
		if (timer_rdy = '0') then
			timer_eol <= '0';
		end if;

		-- Delays
		if (timer_eol = '1') then
			timer_rdy_next <= '0';
		-- STATES DELAY EOL
		--
		end if;
	end process;

end vga_behav;