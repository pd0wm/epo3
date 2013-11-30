library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_arch of vga is
	component vga_counter
		port(clk       : in  std_logic;
			 rst       : in  std_logic;
			 pos_x_out : out std_logic_vector(pos_x_len - 1 downto 0);
			 pos_y_out : out std_logic_vector(pos_y_len - 1 downto 0));
	end component vga_counter;

	signal pos_x : std_logic_vector(pos_x_len - 1 downto 0);
	signal pos_y : std_logic_vector(pos_y_len - 1 downto 0);

	component vga_sync
		port(clk        : in  std_logic;
			 rst        : in  std_logic;
			 pos_x_in   : in  std_logic_vector(pos_x_len - 1 downto 0);
			 pos_y_in   : in  std_logic_vector(pos_y_len - 1 downto 0);
			 h_sync_out : out std_logic;
			 v_sync_out : out std_logic);
	end component vga_sync;

	component vga_triggers
		port(clk           : in  std_logic;
			 rst           : in  std_logic;
			 pos_x_in      : in  std_logic_vector(pos_x_len - 1 downto 0);
			 pos_y_in      : in  std_logic_vector(pos_y_len - 1 downto 0);
			 new_line_out  : out std_logic;
			 new_frame_out : out std_logic;
			 end_frame_out : out std_logic);
	end component vga_triggers;

	signal new_line, new_frame, end_frame : std_logic;

	component vga_read
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 in_field_in : in  std_logic;
			 in_np_in    : in  std_logic;
			 data_in     : in  std_logic;
			 h_sync_in   : in  std_logic;
			 v_sync_in   : in  std_logic;
			 h_sync_out  : out std_logic;
			 v_sync_out  : out std_logic;
			 red_out     : out std_logic;
			 green_out   : out std_logic;
			 blue_out    : out std_logic);
	end component vga_read;

	signal h_sync_buf, v_sync_buf : std_logic;

	-- FIELD

	component vga_field_check
		port(clk                : in  std_logic;
			 rst                : in  std_logic;
			 pos_x_in           : in  std_logic_vector(pos_x_len - 1 downto 0);
			 pos_y_in           : in  std_logic_vector(pos_y_len - 1 downto 0);
			 in_field_out       : out std_logic;
			 end_field_line_out : out std_logic);
	end component vga_field_check;

	signal in_field, end_field_line : std_logic;

	component vga_field_trans
		port(clk               : in  std_logic;
			 rst               : in  std_logic;
			 mem_addr_reset_in : in  std_logic_vector(mem_addr_len - 1 downto 0);
			 mem_addr_out      : out std_logic_vector(mem_addr_len - 1 downto 0);
			 in_field_in       : in  std_logic;
			 new_line_in       : in  std_logic;
			 new_frame_in      : in  std_logic);
	end component vga_field_trans;

	signal mem_addr_reset_field, mem_addr_field : std_logic_vector(mem_addr_len - 1 downto 0);

	component vga_field_trans_reset
		port(clk                : in  std_logic;
			 rst                : in  std_logic;
			 mem_addr_reset_out : out std_logic_vector(mem_addr_len - 1 downto 0);
			 end_field_line_in  : in  std_logic;
			 end_frame_in       : in  std_logic);
	end component vga_field_trans_reset;

	-- NP

	component vga_np_check
		port(clk             : in  std_logic;
			 rst             : in  std_logic;
			 pos_x_in        : in  std_logic_vector(pos_x_len - 1 downto 0);
			 pos_y_in        : in  std_logic_vector(pos_y_len - 1 downto 0);
			 in_np_out       : out std_logic;
			 end_np_line_out : out std_logic);
	end component vga_np_check;

	signal in_np, end_np_line : std_logic;

	component vga_np_trans
		port(clk               : in  std_logic;
			 rst               : in  std_logic;
			 mem_addr_reset_in : in  std_logic_vector(mem_addr_len - 1 downto 0);
			 mem_addr_out      : out std_logic_vector(mem_addr_len - 1 downto 0);
			 in_np_in          : in  std_logic;
			 new_line_in       : in  std_logic;
			 new_frame_in      : in  std_logic);
	end component vga_np_trans;

	signal mem_addr_reset_np, mem_addr_np : std_logic_vector(mem_addr_len - 1 downto 0);

	component vga_np_trans_reset
		port(clk                : in  std_logic;
			 rst                : in  std_logic;
			 mem_addr_reset_out : out std_logic_vector(mem_addr_len - 1 downto 0);
			 end_np_line_in     : in  std_logic;
			 end_frame_in       : in  std_logic);
	end component vga_np_trans_reset;
begin
	counter : vga_counter
		port map(clk       => clk,
			     rst       => rst,
			     pos_x_out => pos_x,
			     pos_y_out => pos_y);

	sync : vga_sync
		port map(clk        => clk,
			     rst        => rst,
			     pos_x_in   => pos_x,
			     pos_y_in   => pos_y,
			     h_sync_out => h_sync_buf,
			     v_sync_out => v_sync_buf);

	triggers : vga_triggers
		port map(clk           => clk,
			     rst           => rst,
			     pos_x_in      => pos_x,
			     pos_y_in      => pos_y,
			     new_line_out  => new_line,
			     new_frame_out => new_frame,
			     end_frame_out => end_frame);

	read_and_output : vga_read
		port map(clk         => clk,
			     rst         => rst,
			     in_field_in => in_field,
			     in_np_in    => in_np,
			     data_in     => data,
			     h_sync_in   => h_sync_buf,
			     v_sync_in   => v_sync_buf,
			     h_sync_out  => h_sync,
			     v_sync_out  => v_sync,
			     red_out     => red,
			     green_out   => green,
			     blue_out    => blue);

	-- FIELD		     

	field_translation : vga_field_trans
		port map(clk               => clk,
			     rst               => rst,
			     mem_addr_reset_in => mem_addr_reset_field,
			     mem_addr_out      => mem_addr_field,
			     in_field_in       => in_field,
			     new_line_in       => new_line,
			     new_frame_in      => new_frame);

	field_translation_reset : vga_field_trans_reset
		port map(clk                => clk,
			     rst                => rst,
			     mem_addr_reset_out => mem_addr_reset_field,
			     end_field_line_in  => end_field_line,
			     end_frame_in       => end_frame);

	field_check : vga_field_check
		port map(clk                => clk,
			     rst                => rst,
			     pos_x_in           => pos_x,
			     pos_y_in           => pos_y,
			     in_field_out       => in_field,
			     end_field_line_out => end_field_line);

	-- NP		     

	np_translation : vga_np_trans
		port map(clk               => clk,
			     rst               => rst,
			     mem_addr_reset_in => mem_addr_reset_np,
			     mem_addr_out      => mem_addr_np,
			     in_np_in          => in_np,
			     new_line_in       => new_line,
			     new_frame_in      => new_frame);

	np_translation_reset : vga_np_trans_reset
		port map(clk                => clk,
			     rst                => rst,
			     mem_addr_reset_out => mem_addr_reset_np,
			     end_np_line_in     => end_np_line,
			     end_frame_in       => end_frame);

	np_check : vga_np_check
		port map(clk             => clk,
			     rst             => rst,
			     pos_x_in        => pos_x,
			     pos_y_in        => pos_y,
			     in_np_out       => in_np,
			     end_np_line_out => end_np_line);

	mem_addr_multiplexer : process(mem_addr_field, mem_addr_np, in_np, in_field)
	begin
		if (in_np = '1') then
			mem_addr <= mem_addr_np;
		else
			mem_addr <= mem_addr_field;
		end if;
	end process;

end;
