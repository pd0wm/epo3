library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_timer is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;

		ready  : out std_logic;

		eol    : in  std_logic;
		h_sync : out std_logic;

		eof    : in  std_logic;
		v_sync : out std_logic
	);
end vga_timer;

architecture vga_timer_behav of vga_timer is
	signal counter, counter_next : std_logic_vector(7 downto 0);

	-- Delay states
	type state_type is (eof_front_porch, eof_pulse_width, eof_back_porch, eol_front_porch, eol_pulse_width, eol_back_porch, data);
	signal state, state_next : state_type;

begin
	comb : process(state, counter)
	begin
		state_next   <= state;
		counter_next <= counter;

		v_sync <= '0';
		h_sync <= '0';

		ready <= '0';

		-- State machine
		case state is
			when data =>
				ready <= '1';

			-- End of line
			when eol_front_porch =>
				h_sync <= '0';

				if (unsigned(counter) = 24) then -- Horizontal sync front porch timer
					-- Condition met
					state_next   <= eol_pulse_width;
					counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					counter_next <= std_logic_vector(unsigned(counter) + 1);
				end if;
			when eol_pulse_width =>
				h_sync <= '1';

				if (unsigned(counter) = 8) then -- Horizontal sync pulse width timer
					-- Condition met
					state_next   <= eol_back_porch;
					counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					counter_next <= std_logic_vector(unsigned(counter) + 1);
				end if;
			when eol_back_porch =>
				h_sync <= '0';

				if (unsigned(counter) = 16) then -- Horizontal sync back porch timer
					-- Condition met
					state_next   <= data;
					counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					counter_next <= std_logic_vector(unsigned(counter) + 1);
				end if;

			-- End of frame
			when eof_front_porch =>
				v_sync <= '0';

				if (unsigned(counter) = 60) then -- Vertical sync front porch timer
					-- Condition met
					state_next   <= eof_pulse_width;
					counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					counter_next <= std_logic_vector(unsigned(counter) + 1);
				end if;
			when eof_pulse_width =>
				v_sync <= '1';

				if (unsigned(counter) = 15) then -- Vertical sync pulse width timer
					-- Condition met
					state_next   <= eof_back_porch;
					counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					counter_next <= std_logic_vector(unsigned(counter) + 1);
				end if;
			when eof_back_porch =>
				v_sync <= '0';

				if (unsigned(counter) = 30) then --  Vertical sync back porch timer
					-- Condition met
					state_next   <= eol_front_porch;
					counter_next <= (others => '0');
				else
					-- Condition not met, increment counter
					counter_next <= std_logic_vector(unsigned(counter) + 1);
				end if;
		end case;
	end process;

	regs : process(clk, rst)
	begin
		if (rst = '1') then
			state   <= eof_front_porch;
			counter <= (others => '0');
		elsif (clk'event and clk = '1') then
			counter <= counter_next;
			state   <= state_next;

			if (eol = '1') then
				state <= eol_front_porch;
			end if;

			if (eof = '1') then
				state <= eof_front_porch;
			end if;
		end if;
	end process;
end vga_timer_behav;


