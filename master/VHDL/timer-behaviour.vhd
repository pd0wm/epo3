library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of timer is
	type timer_state is (reset, vga_low, vga_high, check, done);
	signal state, next_state    : timer_state;
	signal cur_count, new_count : unsigned(7 downto 0);
	signal cur_ready, new_ready : std_logic;

begin
	lbl1 : process(clk, rst, ctr_rst)
	begin
		if (rising_edge(clk)) then
			if (rst = '1' or ctr_rst = '1') then
				state <= reset;
			else
				cur_ready <= new_ready;
				cur_count <= new_count;
				state     <= next_state;
			end if;
		end if;
	end process;

	lbl2 : process(state)
	begin
		ready <= cur_ready;
		case state is
			when reset =>
				if (start = '1') then
					next_state <= vga_low;
				else
					next_state <= reset;
				end if;

				new_ready <= '0';
				new_count <= (others => '0');

			when vga_low =>
				if (vga_clk = '0') then
					next_state <= vga_low;
				else
					next_state <= vga_high;
				end if;

				new_ready <= cur_ready;
				new_count <= cur_count;

			when vga_high =>
				if (vga_clk = '1') then
					new_count  <= cur_count;
					next_state <= vga_high;
				else
					new_count  <= cur_count + 1;
					next_state <= check;
				end if;

				new_ready <= cur_ready;

			when check =>
				if ( (time = '1' and cur_count = 30) or (time = '0' and cur_count = 3)) then
					next_state <= done;
				else
					next_state <= vga_low;
				end if;
				
				new_ready <= cur_ready;
				new_count <= cur_count;

			when done =>
				if (start = '0') then
					next_state <= reset;
				else
					next_state <= done;
				end if;

				new_ready <= '1';
				new_count <= cur_count;

		end case;
	end process;
end behaviour;








