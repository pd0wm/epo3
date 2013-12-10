library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_sync_arch of vga_sync is
	signal h_sync_state, h_sync_new : std_logic;
	signal v_sync_state, v_sync_new : std_logic;
begin
	h_sync_out <= h_sync_state;
	v_sync_out <= v_sync_state;

	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_x_in) >= width + line_fp and unsigned(pos_x_in) < width + line_fp + line_pw
		) then
			h_sync_new <= '0';
		else
			h_sync_new <= '1';
		end if;
	end process;
	
	process(pos_x_in, pos_y_in)
	begin
		if (unsigned(pos_y_in) >= height + frame_fp and unsigned(pos_y_in) < height + frame_fp + frame_pw) then
			v_sync_new <= '0';
		else
			v_sync_new <= '1';
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			h_sync_state <= '0';
			v_sync_state <= '0';
		elsif (clk'event and clk = '1') then
			h_sync_state <= h_sync_new;
			v_sync_state <= v_sync_new;
		end if;
	end process;
end;