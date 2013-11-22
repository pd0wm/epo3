library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_160b_arch of sr_160b is
	component sr_8b
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 we           : in  std_logic;
			 do1, do2     : out std_logic;
			 addr1, addr2 : in  std_logic_vector(2 downto 0);
			 e1, e2       : in  std_logic);
	end component sr_8b;

	component dec20
		port(di : in  std_logic;
			 do : out std_logic_vector(19 downto 0);
			 s  : in  std_logic_vector(4 downto 0));
	end component dec20;
	
	component dff
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic);
	end component dff;

	signal e1_i, e2_i, we_i : std_logic_vector(19 downto 0);
	signal rw_do, ro_do : std_logic;
begin
	gen_sr_8b : for i in 0 to 19 generate
		sr_8b_mod : sr_8b port map(
				clk   => clk,
				rst   => rst,
				di    => rw_data_in,
				we    => we_i(i),
				do1   => rw_do,
				do2   => ro_do,
				addr1 => rw_addr(2 downto 0),
				addr2 => ro_addr(2 downto 0),
				e1    => e1_i(i),
				e2    => e2_i(i)
			);
	end generate;

	rw_we_dec : component dec20
		port map(di => rw_we,
			     do => we_i,
			     s  => rw_addr(7 downto 3));

	rw_re_dec : component dec20
		port map(di => '1',
			     do => e1_i,
			     s  => rw_addr(7 downto 3));

	ro_re_dec : component dec20
		port map(di => '1',
			     do => e2_i,
			     s  => ro_addr(7 downto 3));
			     
	ro_do_buf : component dff
		port map(clk => clk,
			     rst => rst,
			     di  => ro_do,
			     do  => ro_data_out);
			     
	rw_do_buf : component dff
		port map(clk => clk,
			     rst => rst,
			     di  => rw_do,
			     do  => rw_data_out);
end;  
			  