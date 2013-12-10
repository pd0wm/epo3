library ieee;
use ieee.std_logic_1164.all;

architecture cs_compare_behav of cs_compare is
	type state_type is (lock, init, check_row, check_row_process, check_row_done, trigger, notify_score, ready);

	signal state, state_next       : state_type;
	signal row_full, row_full_next : std_logic;

	signal cnt_en       : std_logic;
	signal cnt_ram_addr : std_logic_vector(6 downto 0);

	signal tri_en : std_logic;

	component cs_7bc
		port(clk, rst : in  std_logic;
			 en       : in  std_logic;
			 value    : out std_logic_vector(6 downto 0));
	end component cs_7bc;

	component cs_tri7
		port(i : in  std_logic_vector(6 downto 0);
			 o : out std_logic_vector(6 downto 0);
			 e : in  std_logic);
	end component cs_tri7;
	
	component cs_shift
		port(clk, rst     : in  std_logic;
			 start_in     : in  std_logic;
			 ready_out    : out std_logic;
			 ram_addr_in  : in  std_logic_vector(6 downto 0);
			 ram_addr_out : out std_logic_vector(6 downto 0);
			 ram_we       : out std_logic;
			 ram_data_in  : in  std_logic;
			 ram_data_out : out std_logic);
	end component cs_shift;
	
	signal shift_start, shift_ready : std_logic;
begin
	counter_7_bit : cs_7bc port map(
			clk   => clk,
			rst   => rst,
			en    => cnt_en,
			value => cnt_ram_addr
		);

	tristate_7_bit : cs_tri7 port map(
			i => cnt_ram_addr,
			o => ram_addr_out,
			e => tri_en
		);
		
	shift: cs_shift
		port map(clk          => clk,
			     rst          => rst,
			     start_in     => shift_start,
			     ready_out    => shift_ready,
			     ram_addr_in  => cnt_ram_addr,
			     ram_addr_out => ram_addr_out,
			     ram_we       => ram_we,
			     ram_data_in  => ram_data_in,
			     ram_data_out => ram_data_out);

	process(state, row_full, start_in, cnt_ram_addr, ram_data_in, shift_ready)
	begin
		tri_en    <= '0';
		cnt_en    <= '0';
		ready_out <= '0';
		shift_start <= '0';
		score_out <= '0';

		state_next    <= state;
		row_full_next <= row_full;

		case state is
			when lock =>
				if (start_in = '1') then
					state_next <= init;
				end if;

			when init =>
				row_full_next <= '1';
				tri_en        <= '1';

				state_next <= check_row;

			when check_row =>
				cnt_en        <= '1';
				tri_en        <= '1';
				row_full_next <= row_full AND ram_data_in;

				if (cnt_ram_addr(2 downto 0) = "111") then
					state_next <= check_row_process;
				end if;

			when check_row_process =>
				if (row_full = '1') then
					state_next <= trigger;
				else
					state_next <= check_row_done;
				end if;

			when trigger =>
				shift_start <= '1';
				
				if (shift_ready = '1') then
					state_next <= notify_score;
				end if;
				
			when notify_score =>
				score_out <= '1';
				state_next <= check_row_done;

			when check_row_done =>
				if (cnt_ram_addr = "0000000") then
					state_next <= ready;
				else
					state_next <= init;
				end if;

			when ready =>
				ready_out  <= '1';
				state_next <= lock;
		end case;
	end process;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state    <= lock;
				row_full <= '0';
			else
				state    <= state_next;
				row_full <= row_full_next;
			end if;
		end if;
	end process;

end architecture;