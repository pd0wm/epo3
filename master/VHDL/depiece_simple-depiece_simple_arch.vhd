library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture depiece_simple_arch of depiece_simple is
	signal write_state : std_logic_vector(4 downto 0);
	signal next_write_state : std_logic_vector(4 downto 0);
begin

	L1 : process(write_state)
	begin
		case write_state is
			when "00000" =>
				write    <= '1';
				addr     <= "00001001";
				data_out <= '1';
				next_write_state <= "00001";
			when "00001" =>
				write    <= '1';
				addr     <= "00001010";
				data_out <= '1';
				next_write_state <= "00010";
			when "00010" =>
				write    <= '1';
				addr     <= "00001011";
				data_out <= '1';
				next_write_state <= "00011";
			when "00011" =>
				write    <= '1';
				addr     <= "00010010";
				data_out <= '1';
				next_write_state <= "01001";
				
			when "01001" =>
				write    <= '1';
				addr     <= "10000110";
				data_out <= '1';
				next_write_state <= "01010";
			when "01010" =>
				write    <= '1';
				addr     <= "10000111";
				data_out <= '1';
				next_write_state <= "01100";
			when "01100" =>
				write    <= '1';
				addr     <= "10001001";
				data_out <= '1';
				next_write_state <= "01101";
			when "01101" =>
				write    <= '1';
				addr     <= "10001010";
				data_out <= '1';
				next_write_state <= "01111";
				
			when "01111" =>
				write    <= '1';
				addr     <= "10010100";
				data_out <= '1';
				next_write_state <= "10000";
			when "10000" =>
				write    <= '1';
				addr     <= "10010101";
				data_out <= '1';
				next_write_state <= "10001";
			when "10001" =>
				write    <= '1';
				addr     <= "10010110";
				data_out <= '1';
				next_write_state <= "10011";
			when "10011" =>
				write    <= '1';
				addr     <= "10010111";
				data_out <= '1';
				next_write_state <= "11111";
				
			when others =>
				next_write_state <= "11111";
				write    <= '0';
				addr     <= "00000000";
				data_out <= '0';
		end case;	
	end process;
	
	L2 : process(clk, rst)
	begin
		if (rst = '1') then				
				write_state <= "00000";			
		elsif (clk'event and clk = '1') then
			write_state <= next_write_state;			
		end if;
	end process;
end;
