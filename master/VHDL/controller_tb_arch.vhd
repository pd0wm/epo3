library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of controller_tb is
	component controller
		port(clk               : in  std_logic;
			 rst               : in  std_logic;
			 lut_piece_type    : out std_logic_vector(2 downto 0);
			 lut_next_piece    : out std_logic;
			 lut_x             : out std_logic_vector(2 downto 0);
			 lut_y             : out std_logic_vector(3 downto 0);
			 lut_rot           : out std_logic_vector(1 downto 0);
			 new_piece         : out std_logic;
			 next_piece        : in  std_logic_vector(2 downto 0);
			 check_empty       : in  std_logic;
			 check_start       : out std_logic;
			 check_ready       : in  std_logic;
			 draw_erase_draw   : out std_logic;
			 draw_erase_start  : out std_logic;
			 draw_erase_ready  : in  std_logic;
			 clear_shift_start : out std_logic;
			 clear_shift_ready : in  std_logic;
			 draw_score_draw   : out std_logic;
			 draw_score_ready  : in  std_logic;
			 timer_1_time      : out std_logic;
			 timer_1_start     : out std_logic;
			 timer_1_done      : in  std_logic;
			 timer_1_reset     : out std_logic;
			 inputs            : in  std_logic_vector(5 downto 0));
	end component controller;

	signal clk                : std_logic;
	signal rst                : std_logic;
	signal lut_piece_type     : std_logic_vector(2 downto 0);
	signal lut_next_piece     : std_logic;
	signal lut_x              : std_logic_vector(2 downto 0);
	signal lut_y              : std_logic_vector(3 downto 0);
	signal lut_rot            : std_logic_vector(1 downto 0);
	signal new_piece          : std_logic;
	signal next_piece         : std_logic_vector(2 downto 0);
	signal check_empty        : std_logic;
	signal check_start        : std_logic;
	signal check_ready        : std_logic;
	signal draw_erase_draw    : std_logic;
	signal draw_erase_start   : std_logic;
	signal draw_erase_ready   : std_logic;
	signal clear_shift_start  : std_logic;
	signal clear_shift_ready  : std_logic;
	signal draw_score_draw    : std_logic;
	signal draw_score_ready   : std_logic;
	signal timer_1_time       : std_logic;
	signal timer_1_start      : std_logic;
	signal timer_1_done       : std_logic;
	signal timer_1_reset      : std_logic;
	signal inputs             : std_logic_vector(5 downto 0);

	constant clk_period : time := 20 ns;

begin
	dut : controller
		port map(clk               => clk,
			     rst               => rst,
			     lut_piece_type    => lut_piece_type,
			     lut_next_piece    => lut_next_piece,
			     lut_x             => lut_x,
			     lut_y             => lut_y,
			     lut_rot           => lut_rot,
			     new_piece         => new_piece,
			     next_piece        => next_piece,
			     check_empty       => check_empty,
			     check_start       => check_start,
			     check_ready       => check_ready,
			     draw_erase_draw   => draw_erase_draw,
			     draw_erase_start  => draw_erase_start,
			     draw_erase_ready  => draw_erase_ready,
			     clear_shift_start => clear_shift_start,
			     clear_shift_ready => clear_shift_ready,
			     draw_score_draw   => draw_score_draw,
			     draw_score_ready  => draw_score_ready,
			     timer_1_time      => timer_1_time,
			     timer_1_start     => timer_1_start,
			     timer_1_done      => timer_1_done,
			     timer_1_reset     => timer_1_reset,
			     inputs            => inputs);
	
	lbl_new_piece : process
        begin
                next_piece <= "001";
                wait;
        end process;

        lbl_check_mask : process
        begin
                check_empty <= '0';
                check_ready <= '0';
                wait until (check_start = '1');
                wait for 50 ns;
                check_ready <= '1';
                check_empty <= '1';
                wait until (check_start = '0');
                wait for 20 ns;
        end process;
        
        lbl_clear_shift : process
        begin
                clear_shift_ready <= '0';
                wait until (clear_shift_start = '1');
                wait for 50 ns;
                clear_shift_ready <= '1';
                wait until (clear_shift_start = '0');
                wait for 20 ns;
        end process;
        
        
        lbl_draw : process
        begin
                draw_erase_ready <= '0';
                wait until (draw_erase_start = '1');
                wait for 50 ns;
                draw_erase_ready <= '1';
                wait until (draw_erase_start = '0');
                wait for 20 ns;
        end process;
        
        lbl_score : process
        begin
                draw_score_ready <= '0';
                wait until (draw_score_draw = '1');
                wait for 50 ns;
                draw_score_ready <= '1';
                wait until (draw_erase_draw = '0');
                wait for 20 ns;
        end process;
        
        lbl_tmr1 : process
        begin
                timer_1_done <= '0';
                wait until (timer_1_start = '1');
                wait for 100 ns;
                timer_1_done <= '1';                
                wait until (timer_1_start = '0');
                wait for 20 ns;        
        end process;
        
        
        lbl_inpts : process
        begin
                inputs <= "000000";
                wait;
        end process;
        
        
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
	end process;
	
	

	stim_proc : process
	begin
		inputs <= "000001";
		rst <= '1';
		wait for 40 ns;
		rst <= '0';
		wait for 40 ns;
		inputs <= "000000";
		wait;
	end process;

end;





