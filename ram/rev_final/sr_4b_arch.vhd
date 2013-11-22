library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sr_4b_arch of sr_4b is
	component sr_1b
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 we       : in  std_logic);
	end component sr_1b;
	
	component dec4
		port(di : in  std_logic;
			 do : out std_logic_vector(3 downto 0);
			 s  : in  std_logic_vector(1 downto 0));
	end component dec4;

	signal d_i, we_i : std_logic_vector(3 downto 0);
begin
	gen_sr_1b : for i in 0 to 3 generate
		sr_1b_mod : sr_1b
			port map(clk => clk,
				     rst => rst,
				     di  => di,
				     do  => d_i(i),
				     we  => we_i(i));
	end generate;
	
	dec4_we : dec4
		port map(di => we,
			     do => we_i,
			     s  => addr1);
	
	mp4_1 : process(addr1, d_i)
	begin
		case addr1 is
			when "00" => do1 <= d_i(0);
			when "01" => do1 <= d_i(1);
			when "10" => do1 <= d_i(2);
			when others => do1 <= d_i(3);
		end case;
	end process;
	
	mp4_2 : process(addr2, d_i)
	begin
		case addr2 is
			when "00" => do2 <= d_i(0);
			when "01" => do2 <= d_i(1);
			when "10" => do2 <= d_i(2);
			when others => do2 <= d_i(3);
		end case;
	end process;
end;