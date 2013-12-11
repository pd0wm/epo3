library ieee;
use ieee.std_logic_1164.all;

architecture cs_shift_behav of cs_shift is
	component cs_7bcws
		port(clk, rst : in  std_logic;
			 en, set  : in  std_logic;
			 value    : out std_logic_vector(6 downto 0);
			 data     : in  std_logic_vector(6 downto 0));
	end component cs_7bcws;

	signal cnt_ram_addr_uncompressed, cnt_ram_addr_substr_uncompressed : std_logic_vector(7 downto 0);
	signal cnt_ram_addr, cnt_ram_addr_substr : std_logic_vector(6 downto 0);
	signal cnt_set, cnt_en                   : std_logic;

	component cs_tri8
		port(i : in  std_logic_vector(7 downto 0);
			 o : out std_logic_vector(7 downto 0);
			 e : in  std_logic);
	end component cs_tri8;

	signal tri_en, tri_en_substr : std_logic;

	type statetype is (lock, init, init_decrease, read, write, ready, check);
	signal state, state_next : statetype;

	component cs_adder7
		port(i : in  std_logic_vector(6 downto 0);
			 o : out std_logic_vector(6 downto 0));
	end component cs_adder7;
begin
	cnt_ram_addr_uncompressed <= '0' & cnt_ram_addr;
	tristate_8_bit_normal : cs_tri8
		port map(i => cnt_ram_addr_uncompressed,
			     o => ram_addr_out,
			     e => tri_en);

	counter_7_bit : cs_7bcws
		port map(clk   => clk,
			     rst   => rst,
			     en    => cnt_en,
			     set   => cnt_set,
			     value => cnt_ram_addr,
			     data  => ram_addr_in);

	adder_7_bit : cs_adder7
		port map(i => cnt_ram_addr,
			     o => cnt_ram_addr_substr);

	cnt_ram_addr_substr_uncompressed <= '0' & cnt_ram_addr_substr;
	tristate_8_bit_substr : cs_tri8
		port map(i => cnt_ram_addr_substr_uncompressed,
			     o => ram_addr_out,
			     e => tri_en_substr);

	process(state, start_in, cnt_ram_addr)
	begin
		state_next <= state;

		cnt_set <= '0';
		cnt_en  <= '0';

		tri_en        <= '1';
		tri_en_substr <= '0';

		ram_we <= '0';
		ready_out <= '0';
		ram_data_out <= '0';

		case state is
			when lock =>
				-- High Z
				ram_we <= 'Z';
				ram_data_out <= 'Z';
				tri_en <= '0';
			
				if (start_in = '1') then
					state_next <= init;
				end if;
			when init =>
				cnt_set    <= '1';
				state_next <= init_decrease;
				
			when init_decrease =>
				cnt_en <= '1';
				state_next <= read;

			when read =>
				tri_en <= '0';
				tri_en_substr <= '1';
				state_next    <= write;
			when write =>
				if (cnt_ram_addr(6 downto 3) = "0000") then
					ram_data_out <= '0';
				else
					ram_data_out <= ram_data_in;
				end if;
				
				ram_we       <= '1';
				cnt_en       <= '1';
				state_next   <= check;
				
			when check =>			
				if (cnt_ram_addr = "1111111") then
					state_next <= ready;
				else
					state_next <= read;
				end if;

			when ready =>			
				ready_out <= '1';
				state_next <= lock;
		end case;
	end process;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state <= lock;
			else
				state <= state_next;
			end if;
		end if;
	end process;

end architecture;