library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_read_behav of vga_read is
	signal h_sync_buf, v_sync_buf, in_field_buf, in_np_buf : std_logic;
	signal red_next, green_next, blue_next : std_logic;

begin
	h_sync_buf_comb : process(clk, rst)
	begin
		if (rst = '1') then
			h_sync_buf <= '0';
		elsif (clk'event and clk = '1') then
			h_sync_buf <= h_sync_in;
		end if;
	end process;
	
	v_sync_buf_comb : process(clk, rst)
	begin
		if (rst = '1') then
			v_sync_buf <= '0';
		elsif (clk'event and clk = '1') then
			v_sync_buf <= v_sync_in;
		end if;
	end process;
	
	in_field_in_buf_comb : process(clk, rst)
	begin
		if (rst = '1') then
			in_field_buf <= '0';
		elsif (clk'event and clk = '1') then
			in_field_buf <= in_field_in;
		end if;
	end process;
	
	in_np_in_buf_comb : process(clk, rst)
	begin
		if (rst = '1') then
			in_np_buf <= '0';
		elsif (clk'event and clk = '1') then
			in_np_buf <= in_np_in;
		end if;
	end process;
	
	out_comb : process(in_field_buf, in_np_buf, data_in)
	begin
		if (in_field_buf = '1' or in_np_buf = '1') then
			if (data_in = '1') then
				red_next <= '0';
				green_next <= '0';
				blue_next <= '1';
			else
				red_next <= '1';
				green_next <= '1';
				blue_next <= '1';
			end if;
		else
			red_next <= '0';
			green_next <= '0';
			blue_next <= '0';
		end if;
	end process;
	
	regs : process(clk, rst)
	begin
		if (rst = '1') then
			red_out <= '0';
			green_out <= '0';
			blue_out <= '0';
			
			h_sync_out <= '0';
			v_sync_out <= '0';
		elsif(clk'event and clk='1') then
			red_out <= red_next;
			green_out <= green_next;
			blue_out <= blue_next;
			
			h_sync_out <= h_sync_buf;
			v_sync_out <= v_sync_buf;
		end if;
	end process;
		
end;