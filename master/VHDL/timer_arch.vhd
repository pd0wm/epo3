library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture timer_behav of timer is
	component timer_counter
		port(clk, rst, rst2 : in  std_logic;
			 value          : out std_logic_vector(4 downto 0);
			 en             : in  std_logic);
	end component timer_counter;

	component timer_det
		port(cnt_val : in  std_logic_vector(4 downto 0);
			 time    : in  std_logic;
			 done    : out std_logic);
	end component timer_det;

	signal timer_done, cnt_rst_int, cnt_en, rst_int : std_logic;
	signal cnt_val                                  : std_logic_vector(4 downto 0);
	type statetype is (lock, init, low, rising_edge, high, output);
	signal state, state_next : statetype;
begin
	rst_int <= rst or cnt_rst;

	counter : timer_counter
		port map(clk   => clk,
			     rst   => rst_int,
			     rst2  => cnt_rst_int,
			     value => cnt_val,
			     en    => cnt_en);

	donecheck : timer_det
		port map(cnt_val => cnt_val,
			     time    => time,
			     done    => timer_done);

	process(state, timer_done, vga_clk, start)
	begin
		state_next  <= state;
		cnt_en      <= '0';
		cnt_rst_int <= '0';
		ready <= '0';

		case state is
			when lock =>
				if (start = '1') then
					state_next <= init;
				end if;
				cnt_rst_int <= '1';

			when init =>
				if (vga_clk = '1') then
					state_next <= high;
				else
					state_next <= low;
				end if;

			when low =>
				if (vga_clk = '1') then
					state_next <= rising_edge;
				end if;

			when rising_edge =>
				cnt_en     <= '1';
				state_next <= high;

			when high =>
				if (timer_done = '1') then
					state_next <= output;
				elsif (vga_clk = '0') then
					state_next <= low;
				end if;

			when output =>
				ready      <= '1';
				
				if (start = '0') then 
					state_next <= lock;
				end if;
		end case;
	end process;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst_int = '1') then
				state <= lock;
			else
				state <= state_next;
			end if;
		end if;
	end process;
end timer_behav;


