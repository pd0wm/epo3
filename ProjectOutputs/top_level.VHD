------------------------------------------------------------
-- VHDL top_level
-- 2013 10 15 11 44 11
-- Created By "Altium Designer VHDL Generator"
-- "Copyright (c) 2002-2004 Altium Limited"
------------------------------------------------------------

------------------------------------------------------------
-- VHDL top_level
------------------------------------------------------------

Library IEEE;
Use     IEEE.std_logic_1164.all;

Entity top_level Is

End top_level;
------------------------------------------------------------

------------------------------------------------------------
architecture structure of top_level is
   Component check_mask
      port
      (
        clk           : in  STD_LOGIC;
        emtpy         : out STD_LOGIC;
        mask          : in  STD_LOGIC_VECTOR(31 downto 0);
        ready         : out STD_LOGIC;
        rst           : in  STD_LOGIC;
        start         : in  STD_LOGIC;
        vga_addr      : out STD_LOGIC_VECTOR(7 downto 0);
        vga_data_read : in  STD_LOGIC_VECTOR(2 downto 0)
      );
   End Component;

   Component clear_shift
      port
      (
        clk            : in  STD_LOGIC;
        ready          : out STD_LOGIC;
        rst            : in  STD_LOGIC;
        start          : in  STD_LOGIC;
        vga_addr       : out STD_LOGIC_VECTOR(7 downto 0);
        vga_data_read  : in  STD_LOGIC_VECTOR(2 downto 0);
        vga_data_write : out STD_LOGIC_VECTOR(2 downto 0)
      );
   End Component;

   Component controller
      port
      (
        check_empty       : in  STD_LOGIC;
        check_ready       : in  STD_LOGIC;
        check_start       : out STD_LOGIC;
        clear_shift_ready : in  STD_LOGIC;
        clear_shift_start : out STD_LOGIC;
        clk               : in  STD_LOGIC;
        demux_selector    : out STD_LOGIC_VECTOR(2 downto 0);
        draw_erase_draw   : out STD_LOGIC;
        draw_erase_ready  : in  STD_LOGIC;
        draw_erase_start  : out STD_LOGIC;
        draw_erase_type   : out STD_LOGIC_VECTOR(2 downto 0);
        draw_next_ready   : in  STD_LOGIC;
        draw_next_start   : out STD_LOGIC;
        draw_next_type    : out STD_LOGIC_VECTOR(2 downto 0);
        draw_score_draw   : out STD_LOGIC;
        draw_score_ready  : in  STD_LOGIC;
        lut_error         : in  STD_LOGIC;
        lut_piece_type    : out STD_LOGIC_VECTOR(2 downto 0);
        lut_ready         : in  STD_LOGIC;
        lut_rot           : out STD_LOGIC_VECTOR(1 downto 0);
        lut_start         : out STD_LOGIC;
        lut_x             : out STD_LOGIC_VECTOR(7 downto 0);
        lut_y             : out STD_LOGIC_VECTOR(7 downto 0);
        new_piece         : out STD_LOGIC;
        next_piece        : in  STD_LOGIC_VECTOR(2 downto 0);
        ram_write         : out STD_LOGIC;
        rst               : in  STD_LOGIC;
        score_increase    : out STD_LOGIC;
        score_value       : out STD_LOGIC_VECTOR(31 downto 0)
      );
   End Component;

   Component demultiplexer
      port
      (
        addr                  : out STD_LOGIC_VECTOR(7 downto 0);
        addr_check_mask       : in  STD_LOGIC_VECTOR(7 downto 0);
        addr_clear_and_shift  : in  STD_LOGIC_VECTOR(7 downto 0);
        addr_draw_erase_piece : in  STD_LOGIC_VECTOR(7 downto 0);
        addr_draw_next        : in  STD_LOGIC_VECTOR(7 downto 0);
        addr_score            : in  STD_LOGIC_VECTOR(7 downto 0);
        clk                   : in  STD_LOGIC;
        data_in               : in  STD_LOGIC_VECTOR(2 downto 0);
        data_out              : out STD_LOGIC_VECTOR(2 downto 0);
        in_clear_and_shift    : in  STD_LOGIC_VECTOR(2 downto 0);
        in_draw_erase_piece   : in  STD_LOGIC_VECTOR(2 downto 0);
        in_draw_next          : in  STD_LOGIC_VECTOR(2 downto 0);
        in_score              : in  STD_LOGIC_VECTOR(2 downto 0);
        out_check_mask        : out STD_LOGIC_VECTOR(2 downto 0);
        out_clear_and_shift   : out STD_LOGIC_VECTOR(2 downto 0);
        out_draw_erase_piece  : out STD_LOGIC_VECTOR(2 downto 0);
        rst                   : in  STD_LOGIC;
        selector              : in  STD_LOGIC_VECTOR(2 downto 0)
      );
   End Component;

   Component draw_erase_piece
      port
      (
        clk            : in  STD_LOGIC;
        draw_erase     : in  STD_LOGIC;
        mask           : in  STD_LOGIC_VECTOR(31 downto 0);
        piece_type     : in  STD_LOGIC_VECTOR(2 downto 0);
        ready          : out STD_LOGIC;
        rst            : in  STD_LOGIC;
        start          : in  STD_LOGIC;
        vga_addr       : out STD_LOGIC_VECTOR(7 downto 0);
        vga_data_read  : in  STD_LOGIC_VECTOR(2 downto 0);
        vga_data_write : out STD_LOGIC_VECTOR(2 downto 0)
      );
   End Component;

   Component draw_next_piece
      port
      (
        clk            : in  STD_LOGIC;
        mask           : in  STD_LOGIC_VECTOR(31 downto 0);
        piece_type     : in  STD_LOGIC_VECTOR(2 downto 0);
        ready          : out STD_LOGIC;
        rst            : in  STD_LOGIC;
        start          : in  STD_LOGIC;
        vga_addr       : out STD_LOGIC_VECTOR(7 downto 0);
        vga_data_write : out STD_LOGIC_VECTOR(2 downto 0)
      );
   End Component;

   Component draw_score
      port
      (
        clk        : in  STD_LOGIC;
        draw       : in  STD_LOGIC;
        input      : in  STD_LOGIC_VECTOR(31 downto 0);
        ready      : out STD_LOGIC;
        rst        : in  STD_LOGIC;
        write_addr : out STD_LOGIC_VECTOR(7 downto 0);
        write_data : out STD_LOGIC_VECTOR(2 downto 0)
      );
   End Component;

   Component next_piece_generator
      port
      (
        clk        : in  STD_LOGIC;
        input      : in  STD_LOGIC_VECTOR(7 downto 0);
        new_number : in  STD_LOGIC;
        output     : out STD_LOGIC_VECTOR(2 downto 0);
        rst        : in  STD_LOGIC
      );
   End Component;

   Component piece_lut
      port
      (
        clk        : in  STD_LOGIC;
        error      : out STD_LOGIC;
        mask       : out STD_LOGIC_VECTOR(31 downto 0);
        piece_type : in  STD_LOGIC_VECTOR(2 downto 0);
        ready      : out STD_LOGIC;
        rom_addr   : out STD_LOGIC_VECTOR(7 downto 0);
        rom_data   : in  STD_LOGIC_VECTOR(15 downto 0);
        rot        : in  STD_LOGIC_VECTOR(1 downto 0);
        rst        : in  STD_LOGIC;
        start      : in  STD_LOGIC;
        x          : in  STD_LOGIC_VECTOR(7 downto 0);
        y          : in  STD_LOGIC_VECTOR(7 downto 0)
      );
   End Component;

   Component ram
      port
      (
        clk          : in  STD_LOGIC;
        game_addr    : in  STD_LOGIC_VECTOR(7 downto 0);
        game_in      : in  STD_LOGIC_VECTOR(2 downto 0);
        game_out     : out STD_LOGIC_VECTOR(2 downto 0);
        rst          : in  STD_LOGIC;
        vga_addr     : in  STD_LOGIC_VECTOR(7 downto 0);
        vga_out      : out STD_LOGIC_VECTOR(2 downto 0);
        write_enable : in  STD_LOGIC
      );
   End Component;

   Component rng
      port
      (
        clk    : in  STD_LOGIC;
        output : out STD_LOGIC_VECTOR(7 downto 0);
        rst    : in  STD_LOGIC
      );
   End Component;

   Component rom
      port
      (
        addr : in  STD_LOGIC_VECTOR(7 downto 0);
        clk  : in  STD_LOGIC;
        data : out STD_LOGIC_VECTOR(15 downto 0);
        rst  : in  STD_LOGIC
      );
   End Component;

   Component score
      port
      (
        clk            : in  STD_LOGIC;
        increase       : in  STD_LOGIC;
        increase_value : in  STD_LOGIC_VECTOR(31 downto 0);
        output         : out STD_LOGIC_VECTOR(31 downto 0);
        rst            : in  STD_LOGIC
      );
   End Component;

   Component vga
      port
      (
        blue     : out STD_LOGIC;
        clk      : in  STD_LOGIC;
        data_in  : in  STD_LOGIC_VECTOR(2 downto 0);
        green    : out STD_LOGIC;
        h_sync   : out STD_LOGIC;
        ram_addr : out STD_LOGIC_VECTOR(7 downto 0);
        red      : out STD_LOGIC;
        rst      : in  STD_LOGIC;
        v_sync   : out STD_LOGIC
      );
   End Component;


    Signal NamedSignal_CLK                                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK
    Signal NamedSignal_RST                                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=RST
    Signal PinSignal_U_check_mask_emtpy                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=emtpy
    Signal PinSignal_U_check_mask_ready                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ready
    Signal PinSignal_U_check_mask_vga_addr                : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=vga_addr
    Signal PinSignal_U_clear_shift_ready                  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ready
    Signal PinSignal_U_clear_shift_vga_addr               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=vga_addr
    Signal PinSignal_U_clear_shift_vga_data_write         : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=vga_data_write
    Signal PinSignal_U_controller_check_start             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_clear_shift_start       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_demux_selector          : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=demux_selector
    Signal PinSignal_U_controller_draw_erase_draw         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_draw
    Signal PinSignal_U_controller_draw_erase_start        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_start
    Signal PinSignal_U_controller_draw_erase_type         : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=draw_erase_type
    Signal PinSignal_U_controller_draw_next_start         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_next_start
    Signal PinSignal_U_controller_draw_next_type          : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=draw_next_type
    Signal PinSignal_U_controller_draw_score_draw         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_score_draw
    Signal PinSignal_U_controller_lut_piece_type          : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=lut_piece_type
    Signal PinSignal_U_controller_lut_rot                 : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=lut_rot
    Signal PinSignal_U_controller_lut_start               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_start
    Signal PinSignal_U_controller_lut_x                   : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=lut_x
    Signal PinSignal_U_controller_lut_y                   : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=lut_y
    Signal PinSignal_U_controller_new_piece               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=new_piece
    Signal PinSignal_U_controller_ram_write               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ram_write
    Signal PinSignal_U_controller_score_increase          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=score_increase
    Signal PinSignal_U_controller_score_value             : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=score_value
    Signal PinSignal_U_demultiplexer_addr                 : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr
    Signal PinSignal_U_demultiplexer_data_out             : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=data_out
    Signal PinSignal_U_demultiplexer_out_check_mask       : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=vga_data_read
    Signal PinSignal_U_demultiplexer_out_clear_and_shift  : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=vga_data_read
    Signal PinSignal_U_demultiplexer_out_draw_erase_piece : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=out_draw_erase_piece
    Signal PinSignal_U_draw_erase_piece_ready             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_ready
    Signal PinSignal_U_draw_erase_piece_vga_addr          : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr_draw_erase_piece
    Signal PinSignal_U_draw_erase_piece_vga_data_write    : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=in_draw_erase_piece
    Signal PinSignal_U_draw_next_piece_ready              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_next_ready
    Signal PinSignal_U_draw_next_piece_vga_addr           : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr_draw_next
    Signal PinSignal_U_draw_next_piece_vga_data_write     : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=in_draw_next
    Signal PinSignal_U_draw_score_ready                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_score_ready
    Signal PinSignal_U_draw_score_write_addr              : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr_score
    Signal PinSignal_U_draw_score_write_data              : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=in_score
    Signal PinSignal_U_next_piece_generator_output        : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=next_piece
    Signal PinSignal_U_piece_lut_error                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_ready
    Signal PinSignal_U_piece_lut_mask                     : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=mask
    Signal PinSignal_U_piece_lut_ready                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_error
    Signal PinSignal_U_piece_lut_rom_addr                 : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=rom_addr
    Signal PinSignal_U_ram_game_out                       : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=data_in
    Signal PinSignal_U_ram_vga_out                        : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=vga_out
    Signal PinSignal_U_rng_output                         : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=input
    Signal PinSignal_U_rom_data                           : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=rom_data
    Signal PinSignal_U_score_output                       : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=input
    Signal PinSignal_U_vga_ram_addr                       : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=vga_addr

begin
    U_vga : vga
      Port Map
      (
        clk      => NamedSignal_CLK,
        data_in  => PinSignal_U_ram_vga_out,
        ram_addr => PinSignal_U_vga_ram_addr,
        rst      => NamedSignal_RST
      );

    U_score : score
      Port Map
      (
        clk            => NamedSignal_CLK,
        increase       => PinSignal_U_controller_score_increase,
        increase_value => PinSignal_U_controller_score_value,
        output         => PinSignal_U_score_output,
        rst            => NamedSignal_RST
      );

    U_rom : rom
      Port Map
      (
        addr => PinSignal_U_piece_lut_rom_addr,
        clk  => NamedSignal_CLK,
        data => PinSignal_U_rom_data,
        rst  => NamedSignal_RST
      );

    U_rng : rng
      Port Map
      (
        clk    => NamedSignal_CLK,
        output => PinSignal_U_rng_output,
        rst    => NamedSignal_RST
      );

    U_ram : ram
      Port Map
      (
        clk          => NamedSignal_CLK,
        game_addr    => PinSignal_U_demultiplexer_addr,
        game_in      => PinSignal_U_demultiplexer_data_out,
        game_out     => PinSignal_U_ram_game_out,
        rst          => NamedSignal_RST,
        vga_addr     => PinSignal_U_vga_ram_addr,
        vga_out      => PinSignal_U_ram_vga_out,
        write_enable => PinSignal_U_controller_ram_write
      );

    U_piece_lut : piece_lut
      Port Map
      (
        clk        => NamedSignal_CLK,
        error      => PinSignal_U_piece_lut_error,
        mask       => PinSignal_U_piece_lut_mask,
        piece_type => PinSignal_U_controller_lut_piece_type,
        ready      => PinSignal_U_piece_lut_ready,
        rom_addr   => PinSignal_U_piece_lut_rom_addr,
        rom_data   => PinSignal_U_rom_data,
        rot        => PinSignal_U_controller_lut_rot,
        rst        => NamedSignal_RST,
        start      => PinSignal_U_controller_lut_start,
        x          => PinSignal_U_controller_lut_y,
        y          => PinSignal_U_controller_lut_x
      );

    U_next_piece_generator : next_piece_generator
      Port Map
      (
        clk        => NamedSignal_CLK,
        input      => PinSignal_U_rng_output,
        new_number => PinSignal_U_controller_new_piece,
        output     => PinSignal_U_next_piece_generator_output,
        rst        => NamedSignal_RST
      );

    U_draw_score : draw_score
      Port Map
      (
        clk        => NamedSignal_CLK,
        draw       => PinSignal_U_controller_draw_score_draw,
        input      => PinSignal_U_score_output,
        ready      => PinSignal_U_draw_score_ready,
        rst        => NamedSignal_RST,
        write_addr => PinSignal_U_draw_score_write_addr,
        write_data => PinSignal_U_draw_score_write_data
      );

    U_draw_next_piece : draw_next_piece
      Port Map
      (
        clk            => NamedSignal_CLK,
        mask           => PinSignal_U_piece_lut_mask,
        piece_type     => PinSignal_U_controller_draw_next_type,
        ready          => PinSignal_U_draw_next_piece_ready,
        rst            => NamedSignal_RST,
        start          => PinSignal_U_controller_draw_next_start,
        vga_addr       => PinSignal_U_draw_next_piece_vga_addr,
        vga_data_write => PinSignal_U_draw_next_piece_vga_data_write
      );

    U_draw_erase_piece : draw_erase_piece
      Port Map
      (
        clk            => NamedSignal_CLK,
        draw_erase     => PinSignal_U_controller_draw_erase_draw,
        mask           => PinSignal_U_piece_lut_mask,
        piece_type     => PinSignal_U_controller_draw_erase_type,
        ready          => PinSignal_U_draw_erase_piece_ready,
        rst            => NamedSignal_RST,
        start          => PinSignal_U_controller_draw_erase_start,
        vga_addr       => PinSignal_U_draw_erase_piece_vga_addr,
        vga_data_read  => PinSignal_U_demultiplexer_out_draw_erase_piece,
        vga_data_write => PinSignal_U_draw_erase_piece_vga_data_write
      );

    U_demultiplexer : demultiplexer
      Port Map
      (
        addr                  => PinSignal_U_demultiplexer_addr,
        addr_check_mask       => PinSignal_U_check_mask_vga_addr,
        addr_clear_and_shift  => PinSignal_U_clear_shift_vga_addr,
        addr_draw_erase_piece => PinSignal_U_draw_erase_piece_vga_addr,
        addr_draw_next        => PinSignal_U_draw_next_piece_vga_addr,
        addr_score            => PinSignal_U_draw_score_write_addr,
        clk                   => NamedSignal_CLK,
        data_in               => PinSignal_U_ram_game_out,
        data_out              => PinSignal_U_demultiplexer_data_out,
        in_clear_and_shift    => PinSignal_U_clear_shift_vga_data_write,
        in_draw_erase_piece   => PinSignal_U_draw_erase_piece_vga_data_write,
        in_draw_next          => PinSignal_U_draw_next_piece_vga_data_write,
        in_score              => PinSignal_U_draw_score_write_data,
        out_check_mask        => PinSignal_U_demultiplexer_out_check_mask,
        out_clear_and_shift   => PinSignal_U_demultiplexer_out_clear_and_shift,
        out_draw_erase_piece  => PinSignal_U_demultiplexer_out_draw_erase_piece,
        rst                   => NamedSignal_RST,
        selector              => PinSignal_U_controller_demux_selector
      );

    U_controller : controller
      Port Map
      (
        check_empty       => PinSignal_U_check_mask_emtpy,
        check_ready       => PinSignal_U_check_mask_ready,
        check_start       => PinSignal_U_controller_check_start,
        clear_shift_ready => PinSignal_U_clear_shift_ready,
        clear_shift_start => PinSignal_U_controller_clear_shift_start,
        clk               => NamedSignal_CLK,
        demux_selector    => PinSignal_U_controller_demux_selector,
        draw_erase_draw   => PinSignal_U_controller_draw_erase_draw,
        draw_erase_ready  => PinSignal_U_draw_erase_piece_ready,
        draw_erase_start  => PinSignal_U_controller_draw_erase_start,
        draw_erase_type   => PinSignal_U_controller_draw_erase_type,
        draw_next_ready   => PinSignal_U_draw_next_piece_ready,
        draw_next_start   => PinSignal_U_controller_draw_next_start,
        draw_next_type    => PinSignal_U_controller_draw_next_type,
        draw_score_draw   => PinSignal_U_controller_draw_score_draw,
        draw_score_ready  => PinSignal_U_draw_score_ready,
        lut_error         => PinSignal_U_piece_lut_ready,
        lut_piece_type    => PinSignal_U_controller_lut_piece_type,
        lut_ready         => PinSignal_U_piece_lut_error,
        lut_rot           => PinSignal_U_controller_lut_rot,
        lut_start         => PinSignal_U_controller_lut_start,
        lut_x             => PinSignal_U_controller_lut_x,
        lut_y             => PinSignal_U_controller_lut_y,
        new_piece         => PinSignal_U_controller_new_piece,
        next_piece        => PinSignal_U_next_piece_generator_output,
        ram_write         => PinSignal_U_controller_ram_write,
        rst               => NamedSignal_RST,
        score_increase    => PinSignal_U_controller_score_increase,
        score_value       => PinSignal_U_controller_score_value
      );

    U_clear_shift : clear_shift
      Port Map
      (
        clk            => NamedSignal_CLK,
        ready          => PinSignal_U_clear_shift_ready,
        rst            => NamedSignal_RST,
        start          => PinSignal_U_controller_clear_shift_start,
        vga_addr       => PinSignal_U_clear_shift_vga_addr,
        vga_data_read  => PinSignal_U_demultiplexer_out_clear_and_shift,
        vga_data_write => PinSignal_U_clear_shift_vga_data_write
      );

    U_check_mask : check_mask
      Port Map
      (
        clk           => NamedSignal_CLK,
        emtpy         => PinSignal_U_check_mask_emtpy,
        mask          => PinSignal_U_piece_lut_mask,
        ready         => PinSignal_U_check_mask_ready,
        rst           => NamedSignal_RST,
        start         => PinSignal_U_controller_check_start,
        vga_addr      => PinSignal_U_check_mask_vga_addr,
        vga_data_read => PinSignal_U_demultiplexer_out_check_mask
      );

end structure;
------------------------------------------------------------

