library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture vga_logic_behav of vga_logic is
	signal field_addr, field_addr_next                   : std_logic_vector(7 downto 0); -- Current memory address
	signal field_addr_next_row, field_addr_next_row_next : std_logic_vector(7 downto 0); -- Next row memory address

	signal x_pos, x_pos_next : std_logic_vector(7 downto 0); -- Keeps track of the x coordinate
	signal y_pos, y_pos_next : std_logic_vector(6 downto 0); -- Keeps track of the y coordinate

	signal draw_next : std_logic;       -- Allowed to draw
begin
	-- Determine next position variables
	comb_next_pos : process(x_pos, y_pos)
	begin
		if (unsigned(y_pos) = 119) then -- y_pos maximum
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

		-- The memory addresses are only valid when field range,
		-- so drawing outside of field range is not allowed. The
		-- data will be incorrect there.
		draw_next <= '0';

		-- Check for memory address reset
		if (x_pos_sub = 1) then
			field_addr_next <= field_addr_next_row;
		end if;

		-- Check if memory address has to be increased and if drawing should be allowed
		if (x_pos_sub > 5 and x_pos_sub < 15 and y_pos_sub > 5 and y_pos_sub < 26) then
			-- Drawing is only allowed in field range
			draw_next <= '1';

			-- In field range
			if ((x_pos AND "00000011") = "00000000") then
				-- Last two bits are zero, this indicated the start
				-- of a new block, so increment memory address
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
					-- Last two bits are zero, this indicated the start
					-- of a new block, so increment memory address
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
			-- Reset positions
			x_pos <= (others => '0');
			y_pos <= (others => '0');

			-- Reset addresses
			field_addr          <= (others => '0');
			field_addr_next_row <= (others => '0');

			-- Reset draw allowance
			draw <= '0';

			-- Reset flags
			eof <= '0';
			eol <= '0';
		elsif (clk'event and clk = '1') then
			-- Draw
			draw <= draw_next;

			-- Flags
			eof <= '0';
			eol <= '0';

			if (x_pos_next = "00000000") then
				if (y_pos_next = "0000000") then
					-- End of frame
					eof <= '1';
				else
					-- End of line
					eol <= '1';
				end if;
			end if;

			if (ready = '1') then
				x_pos <= x_pos_next;
				y_pos <= y_pos_next;

				field_addr          <= field_addr_next;
				field_addr_next_row <= field_addr_next_row_next;
			end if;
		end if;
	end process;

	-- Map ram_addr
	ram_addr <= field_addr;
end vga_logic_behav;


