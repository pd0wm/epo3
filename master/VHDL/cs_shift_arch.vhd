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

	signal state, state_next : std_logic_vector(2 downto 0);

	component cs_adder7
		port(i : in  std_logic_vector(6 downto 0);
			 o : out std_logic_vector(6 downto 0));
	end component cs_adder7;
	
	component cs_shift_comb
		port(state                                                                   : in  std_logic_vector(2 downto 0);
			 state_next                                                              : out std_logic_vector(2 downto 0);
			 start_in, ram_data_in                                                   : in  std_logic;
			 cnt_ram_addr                                                            : in  std_logic_vector(6 downto 0);
			 cnt_set, cnt_en, tri_en, tri_en_substr, ram_we, ready_out, ram_data_out : out std_logic);
	end component cs_shift_comb;
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

	comb : cs_shift_comb
		port map(state         => state,
			     state_next    => state_next,
			     start_in      => start_in,
			     ram_data_in   => ram_data_in,
			     cnt_ram_addr  => cnt_ram_addr,
			     cnt_set       => cnt_set,
			     cnt_en        => cnt_en,
			     tri_en        => tri_en,
			     tri_en_substr => tri_en_substr,
			     ram_we        => ram_we,
			     ready_out     => ready_out,
			     ram_data_out  => ram_data_out);

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state <= "000";
			else
				state <= state_next;
			end if;
		end if;
	end process;

end architecture;