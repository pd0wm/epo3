------------------------------------------------------------
-- VHDL top_level
-- 2013 10 18 11 51 3
-- Created By "DXP VHDL Generator"
-- "Copyright (c) 2002-2004 Altium Limited"
------------------------------------------------------------

------------------------------------------------------------
-- VHDL top_level
------------------------------------------------------------

Library IEEE;
Use     IEEE.std_logic_1164.all;

Entity top_level Is
  attribute MacroCell : boolean;

End top_level;
------------------------------------------------------------

------------------------------------------------------------
architecture structure of top_level is
   Component check_mask                                      -- ObjectKind=Sheet Symbol|PrimaryId=U_check_mask
      port
      (
        addr  : out   STD_LOGIC_VECTOR(7 downto 0);          -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-addr[7..0]
        clk   : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-clk
        data  : inout STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-data
        emtpy : out   STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-emtpy
        mask  : in    STD_LOGIC_VECTOR(31 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-mask[31..0]
        ready : out   STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-ready
        rst   : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-rst
        start : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-start
        write : out   STD_LOGIC                              -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-write
      );
   End Component;

   Component clear_shift                                     -- ObjectKind=Sheet Symbol|PrimaryId=U_clear_shift
      port
      (
        addr  : out   STD_LOGIC_VECTOR(7 downto 0);          -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-addr[7..0]
        clk   : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-clk
        data  : inout STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-data
        ready : out   STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-ready
        rst   : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-rst
        start : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-start
        write : out   STD_LOGIC                              -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-write
      );
   End Component;

   Component controller                                      -- ObjectKind=Sheet Symbol|PrimaryId=U_controller
      port
      (
        check_empty       : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_empty
        check_ready       : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_ready
        check_start       : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_start
        clear_shift_ready : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clear_shift_ready
        clear_shift_start : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clear_shift_start
        clk               : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clk
        draw_erase_draw   : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_draw
        draw_erase_ready  : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_ready
        draw_erase_start  : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_start
        draw_erase_type   : out STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_type[2..0]
        draw_next_ready   : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_next_ready
        draw_next_start   : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_next_start
        draw_next_type    : out STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_next_type[2..0]
        draw_score_draw   : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_draw
        draw_score_ready  : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_ready
        lut_error         : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_error
        lut_piece_type    : out STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_piece_type[2..0]
        lut_ready         : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_ready
        lut_rot           : out STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_rot[1..0]
        lut_start         : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_start
        lut_x             : out STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_x[3..0]
        lut_y             : out STD_LOGIC_VECTOR(4 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_y[4..0]
        new_piece         : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-new_piece
        next_piece        : in  STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-next_piece[2..0]
        ram_write         : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-ram_write
        rst               : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-rst
        score_increase    : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-score_increase
        score_value       : out STD_LOGIC_VECTOR(2 downto 0) -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-score_value[2..0]
      );
   End Component;

   Component draw_erase_piece                                -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_erase_piece
      port
      (
        addr       : out   STD_LOGIC_VECTOR(7 downto 0);     -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-addr[7..0]
        clk        : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-clk
        data       : inout STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-data
        draw_erase : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-draw_erase
        mask       : in    STD_LOGIC_VECTOR(31 downto 0);    -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-mask[31..0]
        piece_type : in    STD_LOGIC_VECTOR(2 downto 0);     -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-piece_type[2..0]
        ready      : out   STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-ready
        rst        : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-rst
        start      : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-start
        write      : out   STD_LOGIC                         -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-write
      );
   End Component;

   Component draw_next_piece                                 -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_next_piece
      port
      (
        addr       : out   STD_LOGIC_VECTOR(7 downto 0);     -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-addr[7..0]
        clk        : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-clk
        data       : inout STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-data
        mask       : in    STD_LOGIC_VECTOR(31 downto 0);    -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-mask[31..0]
        piece_type : in    STD_LOGIC_VECTOR(2 downto 0);     -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-piece_type[2..0]
        ready      : out   STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-ready
        rst        : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-rst
        start      : in    STD_LOGIC;                        -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-start
        write      : out   STD_LOGIC                         -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-write
      );
   End Component;

   Component draw_score                                      -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_score
      port
      (
        addr  : out   STD_LOGIC_VECTOR(7 downto 0);          -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-addr[7..0]
        clk   : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-clk
        data  : inout STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-data
        draw  : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-draw
        input : in    STD_LOGIC_VECTOR(15 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-input[15..0]
        ready : out   STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-ready
        rst   : in    STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-rst
        write : out   STD_LOGIC                              -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-write
      );
   End Component;

   Component next_piece_generator                            -- ObjectKind=Sheet Symbol|PrimaryId=U_next_piece_generator
      port
      (
        button_seed : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-button_seed
        clk         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-clk
        new_number  : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-new_number
        output      : out STD_LOGIC_VECTOR(2 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-output[2..0]
        rst         : in  STD_LOGIC                          -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-rst
      );
   End Component;

   Component piece_lut                                       -- ObjectKind=Sheet Symbol|PrimaryId=U_piece_lut
      port
      (
        clk        : in  STD_LOGIC;                          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-clk
        error      : out STD_LOGIC;                          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-error
        mask       : out STD_LOGIC_VECTOR(31 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-mask[31..0]
        piece_type : in  STD_LOGIC_VECTOR(2 downto 0);       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-piece_type[2..0]
        ready      : out STD_LOGIC;                          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-ready
        rom_addr   : out STD_LOGIC_VECTOR(7 downto 0);       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_addr[7..0]
        rom_data   : in  STD_LOGIC_VECTOR(15 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_data[15..0]
        rot        : in  STD_LOGIC_VECTOR(1 downto 0);       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rot[1..0]
        rst        : in  STD_LOGIC;                          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rst
        start      : in  STD_LOGIC;                          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-start
        x          : in  STD_LOGIC_VECTOR(3 downto 0);       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-x[3..0]
        y          : in  STD_LOGIC_VECTOR(4 downto 0)        -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-y[4..0]
      );
   End Component;

   Component ram                                             -- ObjectKind=Sheet Symbol|PrimaryId=U_ram
      port
      (
        addr         : in    STD_LOGIC_VECTOR(7 downto 0);   -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-addr[7..0]
        clk          : in    STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-clk
        data         : inout STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-data
        rst          : in    STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-rst
        vga_addr     : in    STD_LOGIC_VECTOR(7 downto 0);   -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-vga_addr[7..0]
        vga_out      : out   STD_LOGIC_VECTOR(2 downto 0);   -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-vga_out[2..0]
        write_enable : in    STD_LOGIC                       -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-write_enable
      );
   End Component;

   Component rom                                             -- ObjectKind=Sheet Symbol|PrimaryId=U_rom
      port
      (
        addr : in  STD_LOGIC_VECTOR(7 downto 0);             -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-addr[7..0]
        clk  : in  STD_LOGIC;                                -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-clk
        data : out STD_LOGIC_VECTOR(15 downto 0);            -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-data[15..0]
        rst  : in  STD_LOGIC                                 -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-rst
      );
   End Component;

   Component score                                           -- ObjectKind=Sheet Symbol|PrimaryId=U_score
      port
      (
        clk            : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-clk
        increase       : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-increase
        increase_value : in  STD_LOGIC_VECTOR(2 downto 0);   -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-increase_value[2..0]
        output         : out STD_LOGIC_VECTOR(15 downto 0);  -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-output[15..0]
        rst            : in  STD_LOGIC                       -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-rst
      );
   End Component;

   Component vga                                             -- ObjectKind=Sheet Symbol|PrimaryId=U_vga
      port
      (
        blue     : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-blue
        clk      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-clk
        data_in  : in  STD_LOGIC_VECTOR(2 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-data_in[2..0]
        green    : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-green
        h_sync   : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-h_sync
        ram_addr : out STD_LOGIC_VECTOR(7 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-ram_addr[7..0]
        red      : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-red
        rst      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-rst
        v_sync   : out STD_LOGIC                             -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-v_sync
      );
   End Component;


    Signal NamedIOSignal_data                       : STD_LOGIC;
    Signal NamedSignal_CLK                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK
    Signal NamedSignal_RST                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=RST
    Signal PinSignal_U_check_mask_addr              : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr
    Signal PinSignal_U_check_mask_emtpy             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=emtpy
    Signal PinSignal_U_check_mask_ready             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ready
    Signal PinSignal_U_check_mask_write             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=write
    Signal PinSignal_U_clear_shift_ready            : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ready
    Signal PinSignal_U_controller_check_start       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_clear_shift_start : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_draw_erase_draw   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_draw
    Signal PinSignal_U_controller_draw_erase_start  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_start
    Signal PinSignal_U_controller_draw_erase_type   : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=draw_erase_type
    Signal PinSignal_U_controller_draw_next_start   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_next_start
    Signal PinSignal_U_controller_draw_next_type    : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=draw_next_type
    Signal PinSignal_U_controller_draw_score_draw   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_score_draw
    Signal PinSignal_U_controller_lut_piece_type    : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=lut_piece_type
    Signal PinSignal_U_controller_lut_rot           : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=lut_rot
    Signal PinSignal_U_controller_lut_start         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_start
    Signal PinSignal_U_controller_lut_x             : STD_LOGIC_VECTOR(4 downto 0); -- ObjectKind=Net|PrimaryId=lut_x
    Signal PinSignal_U_controller_lut_y             : STD_LOGIC_VECTOR(4 downto 0); -- ObjectKind=Net|PrimaryId=lut_y
    Signal PinSignal_U_controller_new_piece         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=new_piece
    Signal PinSignal_U_controller_score_increase    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=score_increase
    Signal PinSignal_U_controller_score_value       : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=score_value
    Signal PinSignal_U_draw_erase_piece_ready       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_ready
    Signal PinSignal_U_draw_next_piece_ready        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_next_ready
    Signal PinSignal_U_draw_score_ready             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_score_ready
    Signal PinSignal_U_next_piece_generator_output  : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=next_piece
    Signal PinSignal_U_piece_lut_error              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_error
    Signal PinSignal_U_piece_lut_mask               : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=mask
    Signal PinSignal_U_piece_lut_ready              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_ready
    Signal PinSignal_U_piece_lut_rom_addr           : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=rom_addr
    Signal PinSignal_U_ram_vga_out                  : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=vga_out
    Signal PinSignal_U_rom_data                     : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=rom_data
    Signal PinSignal_U_score_output                 : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=input
    Signal PinSignal_U_vga_ram_addr                 : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=vga_addr

begin
    U_vga : vga                                              -- ObjectKind=Sheet Symbol|PrimaryId=U_vga
      Port Map
      (
        clk      => NamedSignal_CLK,                         -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-clk
        data_in  => PinSignal_U_ram_vga_out,                 -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-data_in[2..0]
        ram_addr => PinSignal_U_vga_ram_addr,                -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-ram_addr[7..0]
        rst      => NamedSignal_RST                          -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-rst
      );

    U_score : score                                          -- ObjectKind=Sheet Symbol|PrimaryId=U_score
      Port Map
      (
        clk            => NamedSignal_CLK,                   -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-clk
        increase       => PinSignal_U_controller_score_increase, -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-increase
        increase_value => PinSignal_U_controller_score_value, -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-increase_value[2..0]
        output         => PinSignal_U_score_output,          -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-output[15..0]
        rst            => NamedSignal_RST                    -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-rst
      );

    U_rom : rom                                              -- ObjectKind=Sheet Symbol|PrimaryId=U_rom
      Port Map
      (
        addr => PinSignal_U_piece_lut_rom_addr,              -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-addr[7..0]
        clk  => NamedSignal_CLK,                             -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-clk
        data => PinSignal_U_rom_data,                        -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-data[15..0]
        rst  => NamedSignal_RST                              -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-rst
      );

    U_ram : ram                                              -- ObjectKind=Sheet Symbol|PrimaryId=U_ram
      Port Map
      (
        addr         => PinSignal_U_check_mask_addr,         -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-addr[7..0]
        clk          => NamedSignal_CLK,                     -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-clk
        data         => NamedIOSignal_data,                  -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-data
        rst          => NamedSignal_RST,                     -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-rst
        vga_addr     => PinSignal_U_vga_ram_addr,            -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-vga_addr[7..0]
        vga_out      => PinSignal_U_ram_vga_out,             -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-vga_out[2..0]
        write_enable => PinSignal_U_check_mask_write         -- ObjectKind=Sheet Entry|PrimaryId=ram.vhd-write_enable
      );

    U_piece_lut : piece_lut                                  -- ObjectKind=Sheet Symbol|PrimaryId=U_piece_lut
      Port Map
      (
        clk        => NamedSignal_CLK,                       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-clk
        error      => PinSignal_U_piece_lut_error,           -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-error
        mask       => PinSignal_U_piece_lut_mask,            -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-mask[31..0]
        piece_type => PinSignal_U_controller_lut_piece_type, -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-piece_type[2..0]
        ready      => PinSignal_U_piece_lut_ready,           -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-ready
        rom_addr   => PinSignal_U_piece_lut_rom_addr,        -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_addr[7..0]
        rom_data   => PinSignal_U_rom_data,                  -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_data[15..0]
        rot        => PinSignal_U_controller_lut_rot,        -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rot[1..0]
        rst        => NamedSignal_RST,                       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rst
        start      => PinSignal_U_controller_lut_start,      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-start
        x          => PinSignal_U_controller_lut_y(3 downto 0), -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-x[3..0]
        y          => PinSignal_U_controller_lut_x           -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-y[4..0]
      );

    U_next_piece_generator : next_piece_generator            -- ObjectKind=Sheet Symbol|PrimaryId=U_next_piece_generator
      Port Map
      (
        clk        => NamedSignal_CLK,                       -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-clk
        new_number => PinSignal_U_controller_new_piece,      -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-new_number
        output     => PinSignal_U_next_piece_generator_output, -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-output[2..0]
        rst        => NamedSignal_RST                        -- ObjectKind=Sheet Entry|PrimaryId=next_piece_generator.vhd-rst
      );

    U_draw_score : draw_score                                -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_score
      Port Map
      (
        addr  => PinSignal_U_check_mask_addr,                -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-addr[7..0]
        clk   => NamedSignal_CLK,                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-clk
        data  => NamedIOSignal_data,                         -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-data
        draw  => PinSignal_U_controller_draw_score_draw,     -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-draw
        input => PinSignal_U_score_output,                   -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-input[15..0]
        ready => PinSignal_U_draw_score_ready,               -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-ready
        rst   => NamedSignal_RST,                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-rst
        write => PinSignal_U_check_mask_write                -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-write
      );

    U_draw_next_piece : draw_next_piece                      -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_next_piece
      Port Map
      (
        addr       => PinSignal_U_check_mask_addr,           -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-addr[7..0]
        clk        => NamedSignal_CLK,                       -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-clk
        data       => NamedIOSignal_data,                    -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-data
        mask       => PinSignal_U_piece_lut_mask,            -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-mask[31..0]
        piece_type => PinSignal_U_controller_draw_next_type, -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-piece_type[2..0]
        ready      => PinSignal_U_draw_next_piece_ready,     -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-ready
        rst        => NamedSignal_RST,                       -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-rst
        start      => PinSignal_U_controller_draw_next_start, -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-start
        write      => PinSignal_U_check_mask_write           -- ObjectKind=Sheet Entry|PrimaryId=draw_next_piece.vhd-write
      );

    U_draw_erase_piece : draw_erase_piece                    -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_erase_piece
      Port Map
      (
        addr       => PinSignal_U_check_mask_addr,           -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-addr[7..0]
        clk        => NamedSignal_CLK,                       -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-clk
        data       => NamedIOSignal_data,                    -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-data
        draw_erase => PinSignal_U_controller_draw_erase_draw, -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-draw_erase
        mask       => PinSignal_U_piece_lut_mask,            -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-mask[31..0]
        piece_type => PinSignal_U_controller_draw_erase_type, -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-piece_type[2..0]
        ready      => PinSignal_U_draw_erase_piece_ready,    -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-ready
        rst        => NamedSignal_RST,                       -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-rst
        start      => PinSignal_U_controller_draw_erase_start, -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-start
        write      => PinSignal_U_check_mask_write           -- ObjectKind=Sheet Entry|PrimaryId=draw_erase_piece.vhd-write
      );

    U_controller : controller                                -- ObjectKind=Sheet Symbol|PrimaryId=U_controller
      Port Map
      (
        check_empty       => PinSignal_U_check_mask_emtpy,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_empty
        check_ready       => PinSignal_U_check_mask_ready,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_ready
        check_start       => PinSignal_U_controller_check_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_start
        clear_shift_ready => PinSignal_U_clear_shift_ready,  -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clear_shift_ready
        clear_shift_start => PinSignal_U_controller_clear_shift_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clear_shift_start
        clk               => NamedSignal_CLK,                -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clk
        draw_erase_draw   => PinSignal_U_controller_draw_erase_draw, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_draw
        draw_erase_ready  => PinSignal_U_draw_erase_piece_ready, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_ready
        draw_erase_start  => PinSignal_U_controller_draw_erase_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_start
        draw_erase_type   => PinSignal_U_controller_draw_erase_type, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_type[2..0]
        draw_next_ready   => PinSignal_U_draw_next_piece_ready, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_next_ready
        draw_next_start   => PinSignal_U_controller_draw_next_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_next_start
        draw_next_type    => PinSignal_U_controller_draw_next_type, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_next_type[2..0]
        draw_score_draw   => PinSignal_U_controller_draw_score_draw, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_draw
        draw_score_ready  => PinSignal_U_draw_score_ready,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_ready
        lut_error         => PinSignal_U_piece_lut_error,    -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_error
        lut_piece_type    => PinSignal_U_controller_lut_piece_type, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_piece_type[2..0]
        lut_ready         => PinSignal_U_piece_lut_ready,    -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_ready
        lut_rot           => PinSignal_U_controller_lut_rot, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_rot[1..0]
        lut_start         => PinSignal_U_controller_lut_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_start
        lut_x             => PinSignal_U_controller_lut_x(3 downto 0), -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_x[3..0]
        lut_y             => PinSignal_U_controller_lut_y,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_y[4..0]
        new_piece         => PinSignal_U_controller_new_piece, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-new_piece
        next_piece        => PinSignal_U_next_piece_generator_output, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-next_piece[2..0]
        rst               => NamedSignal_RST,                -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-rst
        score_increase    => PinSignal_U_controller_score_increase, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-score_increase
        score_value       => PinSignal_U_controller_score_value -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-score_value[2..0]
      );

    U_clear_shift : clear_shift                              -- ObjectKind=Sheet Symbol|PrimaryId=U_clear_shift
      Port Map
      (
        addr  => PinSignal_U_check_mask_addr,                -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-addr[7..0]
        clk   => NamedSignal_CLK,                            -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-clk
        data  => NamedIOSignal_data,                         -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-data
        ready => PinSignal_U_clear_shift_ready,              -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-ready
        rst   => NamedSignal_RST,                            -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-rst
        start => PinSignal_U_controller_clear_shift_start,   -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-start
        write => PinSignal_U_check_mask_write                -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-write
      );

    U_check_mask : check_mask                                -- ObjectKind=Sheet Symbol|PrimaryId=U_check_mask
      Port Map
      (
        addr  => PinSignal_U_check_mask_addr,                -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-addr[7..0]
        clk   => NamedSignal_CLK,                            -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-clk
        data  => NamedIOSignal_data,                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-data
        emtpy => PinSignal_U_check_mask_emtpy,               -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-emtpy
        mask  => PinSignal_U_piece_lut_mask,                 -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-mask[31..0]
        ready => PinSignal_U_check_mask_ready,               -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-ready
        rst   => NamedSignal_RST,                            -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-rst
        start => PinSignal_U_controller_check_start,         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-start
        write => PinSignal_U_check_mask_write                -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-write
      );

    -- Signal Assignments
    ---------------------
    PinSignal_U_controller_lut_x             <= PinSignal_U_controller_lut_x(3 downto 0); -- ObjectKind=Net|PrimaryId=lut_x
    PinSignal_U_controller_lut_y(3 downto 0) <= PinSignal_U_controller_lut_y; -- ObjectKind=Net|PrimaryId=lut_y

end structure;
------------------------------------------------------------

