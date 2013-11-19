library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga2_params.all;

architecture vga2_behav of vga2 is
	-- Position
	signal pos_x, pos_x_next : std_logic_vector(6 downto 0);
	signal pos_y, pos_y_next : std_logic_vector(8 downto 0);

	-- memaddrory_address
	signal memaddr_field, memaddr_field_next             : std_logic_vector(6 downto 0);
	signal memaddr_field_start, memaddr_field_start_next : std_logic_vector(6 downto 0);

	signal field_draw : std_logic;

begin
	-- Position
	process(pos_x, pos_y)
	begin
		if (unsigned(pos_x) = total_width - 1) then
			if (unsigned(pos_y) = total_height - 1) then
				pos_x_next <= (others => '0');
				pos_y_next <= (others => '0');
			else
				pos_x_next <= (others => '0');
				pos_y_next <= std_logic_vector(unsigned(pos_y) + 1);
			end if;
		else
			pos_x_next <= std_logic_vector(unsigned(pos_x) + 1);
			pos_y_next <= pos_y;
		end if;
	end process;

	-- Synchronisation
	process(pos_x, pos_y)
	begin
		if (
			unsigned(pos_x) > line_fp and unsigned(pos_x) <= line_fp + line_pw and unsigned(pos_y) >= offset_y
		) then
			h_sync <= '1';
		else
			h_sync <= '0';
		end if;

		if (unsigned(pos_y) > frame_fp and unsigned(pos_y) <= frame_fp + frame_pw) then
			v_sync <= '1';
		else
			v_sync <= '0';
		end if;
	end process;

	-- Field
	process(pos_x, pos_y, memaddr_field, memaddr_field_start)
	begin
		field_draw <= '0';

		memaddr_field_next       <= memaddr_field;
		memaddr_field_start_next <= memaddr_field_start;

		if (
			-- Check in field range
			unsigned(pos_x) > offset_x + field_start_x and unsigned(pos_x) <= offset_x + field_start_x + field_width and unsigned(pos_y) > offset_y + field_start_y and unsigned(pos_y) <= offset_y + field_start_x + field_height
		) then
			if ((unsigned(pos_x) - offset_x - field_start_x) mod field_block_width = 0) then
				memaddr_field_next <= std_logic_vector(unsigned(memaddr_field) + 1);
			end if;

			field_draw <= '1';
		end if;

		if (
			-- In in y-range and pos_x = 0
			unsigned(pos_x) = 0 and unsigned(pos_y) > offset_y + field_start_y and unsigned(pos_y) <= offset_y + field_start_x + field_height
		) then
			if ((unsigned(pos_y) - offset_y - field_start_y) mod field_block_height = 0) then
				memaddr_field_start_next <= std_logic_vector(unsigned(memaddr_field_start) + field_width/field_block_width);
			end if;
		end if;

		-- Check for reset
		if (unsigned(pos_x) = 0 and unsigned(pos_y) = 0) then
			memaddr_field_next       <= (others => '0');
			memaddr_field_start_next <= (others => '0');
		end if;

		-- Check for end of line
		if (unsigned(pos_x) = width - 1) then
			memaddr_field_next <= memaddr_field_start;
		end if;
	end process;

	-- Output
	process(field_draw, memaddr_field)
	begin
		ram_addr <= (others => '0');

		if (field_draw = '1') then
			ram_addr <= memaddr_field;
		end if;
	end process;

	-- Registers
	process(clk, rst)
	begin
		if (rst = '1') then
			pos_x <= (others => '0');
			pos_y <= (others => '0');
		elsif (clk'event and clk = '1') then
			pos_x <= pos_x_next;
			pos_y <= pos_y_next;

			memaddr_field       <= memaddr_field_next;
			memaddr_field_start <= memaddr_field_start_next;
		end if;
	end process;
end;