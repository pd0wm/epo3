------------------------------------------------------------
-- VHDL top_level
-- 2013 12 3 10 40 53
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
        addr        : out STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-addr[7..0]
        clk         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-clk
        data_in     : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-data_in
        empty       : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-empty
        lut_error   : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-lut_error
        lut_ready   : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-lut_ready
        lut_start   : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-lut_start
        mask        : in  STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-mask[7..0]
        mask_select : out STD_LOGIC_VECTOR(1 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-mask_select[1..0]
        ready       : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-ready
        rst         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-rst
        start       : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-start
        write       : out STD_LOGIC                          -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-write
      );
   End Component;

   Component clear_shift                                     -- ObjectKind=Sheet Symbol|PrimaryId=U_clear_shift
      port
      (
        addr           : out STD_LOGIC_VECTOR(7 downto 0);   -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-addr[7..0]
        clk            : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-clk
        data_in        : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-data_in
        data_out       : out STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-data_out
        ready          : out STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-ready
        rst            : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-rst
        score_increase : out STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-score_increase
        start          : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-start
        write          : out STD_LOGIC                       -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-write
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
        draw_score_draw   : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_draw
        draw_score_ready  : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_ready
        inputs            : in  STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-inputs[7..0]
        lut_next_piece    : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_next_piece
        lut_piece_type    : out STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_piece_type[2..0]
        lut_rot           : out STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_rot[1..0]
        lut_x             : out STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_x[3..0]
        lut_y             : out STD_LOGIC_VECTOR(4 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_y[4..0]
        new_piece         : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-new_piece
        next_piece        : in  STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-next_piece[2..0]
        rst               : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-rst
        timer_1_done      : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_1_done
        timer_1_start     : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_1_start
        timer_1_time      : out STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_1_time[7..0]
        timer_2_done      : in  STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_2_done
        timer_2_start     : out STD_LOGIC;                   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_2_start
        timer_2_time      : out STD_LOGIC_VECTOR(7 downto 0) -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_2_time[7..0]
      );
   End Component;

   Component debounce                                        -- ObjectKind=Sheet Symbol|PrimaryId=U_debounce
      port
      (
        clk         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-clk
        inputs      : in  STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-inputs[7..0]
        output      : out STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-output[7..0]
        random_seed : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-random_seed
        rst         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-rst
        vga_clock   : in  STD_LOGIC                          -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-vga_clock
      );
   End Component;

   Component depiece                                         -- ObjectKind=Sheet Symbol|PrimaryId=U_depiece
      port
      (
        addr        : out STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-addr[7..0]
        clk         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-clk
        data_out    : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-data_out
        draw_erase  : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-draw_erase
        lut_ready   : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-lut_ready
        lut_start   : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-lut_start
        mask        : in  STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-mask[7..0]
        mask_select : out STD_LOGIC_VECTOR(1 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-mask_select[1..0]
        ready       : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-ready
        rst         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-rst
        start       : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-start
        write       : out STD_LOGIC                          -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-write
      );
   End Component;

   Component draw_score                                      -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_score
      port
      (
        addr     : out STD_LOGIC_VECTOR(7 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-addr[7..0]
        clk      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-clk
        data_out : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-data_out
        draw     : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-draw
        input    : in  STD_LOGIC_VECTOR(15 downto 0);        -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-input[15..0]
        ready    : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-ready
        rst      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-rst
        write    : out STD_LOGIC                             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-write
      );
   End Component;

   Component npgen                                           -- ObjectKind=Sheet Symbol|PrimaryId=U_npgen
      port
      (
        button_seed : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-button_seed
        clk         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-clk
        new_number  : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-new_number
        output      : out STD_LOGIC_VECTOR(2 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-output[2..0]
        rst         : in  STD_LOGIC                          -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-rst
      );
   End Component;

   Component piece_lut                                       -- ObjectKind=Sheet Symbol|PrimaryId=U_piece_lut
      port
      (
        check_start : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-check_start
        clk         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-clk
        draw_start  : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-draw_start
        error       : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-error
        mask        : out STD_LOGIC_VECTOR(7 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-mask[7..0]
        mask_select : in  STD_LOGIC_VECTOR(1 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-mask_select[1..0]
        next_piece  : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-next_piece
        piece_type  : in  STD_LOGIC_VECTOR(2 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-piece_type[2..0]
        ready       : out STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-ready
        rom_addr    : out STD_LOGIC_VECTOR(6 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_addr[6..0]
        rom_data    : in  STD_LOGIC_VECTOR(3 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_data[3..0]
        rot         : in  STD_LOGIC_VECTOR(1 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rot[1..0]
        rst         : in  STD_LOGIC;                         -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rst
        x           : in  STD_LOGIC_VECTOR(2 downto 0);      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-x[2..0]
        y           : in  STD_LOGIC_VECTOR(3 downto 0)       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-y[3..0]
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
        clk      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-clk
        increase : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-increase
        output   : out STD_LOGIC_VECTOR(15 downto 0);        -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-output[15..0]
        rst      : in  STD_LOGIC                             -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-rst
      );
   End Component;

   Component sr_if                                           -- ObjectKind=Sheet Symbol|PrimaryId=U_sr_if
      port
      (
        addr1 : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-addr1[7..0]
        addr2 : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-addr2[7..0]
        clk   : in  STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-clk
        di    : in  STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-di
        do1   : out STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-do1
        do2   : out STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-do2
        rst   : in  STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-rst
        we    : in  STD_LOGIC                                -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-we
      );
   End Component;

   Component timer                                           -- ObjectKind=Sheet Symbol|PrimaryId=Timer 1
      port
      (
        clk     : in  STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-clk
        done    : out STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-done
        rst     : in  STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-rst
        start   : in  STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-start
        time    : in  STD_LOGIC_VECTOR(7 downto 0);          -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-time[7..0]
        vga_clk : in  STD_LOGIC                              -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-vga_clk
      );
   End Component;

   Component vga                                             -- ObjectKind=Sheet Symbol|PrimaryId=U_vga
      port
      (
        blue     : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-blue
        clk      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-clk
        data     : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-data
        green    : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-green
        h_sync   : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-h_sync
        mem_addr : out STD_LOGIC_VECTOR(7 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-mem_addr[7..0]
        red      : out STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-red
        rst      : in  STD_LOGIC;                            -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-rst
        v_sync   : out STD_LOGIC                             -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-v_sync
      );
   End Component;


    Signal NamedSignal_CLK                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK
    Signal NamedSignal_RST                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=RST
    Signal PinSignal_Timer_1_done                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=done
    Signal PinSignal_Timer_2_done                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=done
    Signal PinSignal_U_check_mask_addr              : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr
    Signal PinSignal_U_check_mask_empty             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=empty
    Signal PinSignal_U_check_mask_lut_start         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_start
    Signal PinSignal_U_check_mask_mask_select       : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=mask_select
    Signal PinSignal_U_check_mask_ready             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ready
    Signal PinSignal_U_check_mask_write             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=write
    Signal PinSignal_U_clear_shift_data_out         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=data_out
    Signal PinSignal_U_clear_shift_ready            : STD_LOGIC; -- ObjectKind=Net|PrimaryId=ready
    Signal PinSignal_U_clear_shift_score_increase   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=score_increase
    Signal PinSignal_U_controller_check_start       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_clear_shift_start : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_draw_erase_draw   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_draw
    Signal PinSignal_U_controller_draw_erase_start  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_start
    Signal PinSignal_U_controller_draw_score_draw   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_score_draw
    Signal PinSignal_U_controller_lut_next_piece    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_next_piece
    Signal PinSignal_U_controller_lut_piece_type    : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=lut_piece_type
    Signal PinSignal_U_controller_lut_rot           : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=lut_rot
    Signal PinSignal_U_controller_lut_x             : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=lut_x
    Signal PinSignal_U_controller_lut_y             : STD_LOGIC_VECTOR(4 downto 0); -- ObjectKind=Net|PrimaryId=lut_y
    Signal PinSignal_U_controller_new_piece         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=new_piece
    Signal PinSignal_U_controller_timer_1_start     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_timer_1_time      : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=time
    Signal PinSignal_U_controller_timer_2_start     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=start
    Signal PinSignal_U_controller_timer_2_time      : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=time
    Signal PinSignal_U_debounce_output              : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=inputs
    Signal PinSignal_U_debounce_random_seed         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=random_seed
    Signal PinSignal_U_depiece_lut_start            : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_start
    Signal PinSignal_U_depiece_ready                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_erase_ready
    Signal PinSignal_U_draw_score_ready             : STD_LOGIC; -- ObjectKind=Net|PrimaryId=draw_score_ready
    Signal PinSignal_U_npgen_output                 : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=next_piece
    Signal PinSignal_U_piece_lut_error              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_error
    Signal PinSignal_U_piece_lut_mask               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=mask
    Signal PinSignal_U_piece_lut_ready              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=lut_ready
    Signal PinSignal_U_piece_lut_rom_addr           : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=rom_addr
    Signal PinSignal_U_rom_data                     : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=rom_data
    Signal PinSignal_U_score_output                 : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=input
    Signal PinSignal_U_sr_if_do1                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=data_in
    Signal PinSignal_U_sr_if_do2                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=do2
    Signal PinSignal_U_vga_h_sync                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=vga_clock
    Signal PinSignal_U_vga_mem_addr                 : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=addr2
    Signal PinSignal_U_vga_v_sync                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=vga_clk

begin
    U_vga : vga                                              -- ObjectKind=Sheet Symbol|PrimaryId=U_vga
      Port Map
      (
        clk      => NamedSignal_CLK,                         -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-clk
        data     => PinSignal_U_sr_if_do2,                   -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-data
        h_sync   => PinSignal_U_vga_h_sync,                  -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-h_sync
        mem_addr => PinSignal_U_vga_mem_addr,                -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-mem_addr[7..0]
        rst      => NamedSignal_RST,                         -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-rst
        v_sync   => PinSignal_U_vga_v_sync                   -- ObjectKind=Sheet Entry|PrimaryId=vga.vhd-v_sync
      );

    U_sr_if : sr_if                                          -- ObjectKind=Sheet Symbol|PrimaryId=U_sr_if
      Port Map
      (
        addr1 => PinSignal_U_check_mask_addr,                -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-addr1[7..0]
        addr2 => PinSignal_U_vga_mem_addr,                   -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-addr2[7..0]
        clk   => NamedSignal_CLK,                            -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-clk
        di    => PinSignal_U_clear_shift_data_out,           -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-di
        do1   => PinSignal_U_sr_if_do1,                      -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-do1
        do2   => PinSignal_U_sr_if_do2,                      -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-do2
        rst   => NamedSignal_RST,                            -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-rst
        we    => PinSignal_U_check_mask_write                -- ObjectKind=Sheet Entry|PrimaryId=interface.vhd-we
      );

    U_score : score                                          -- ObjectKind=Sheet Symbol|PrimaryId=U_score
      Port Map
      (
        clk      => NamedSignal_CLK,                         -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-clk
        increase => PinSignal_U_clear_shift_score_increase,  -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-increase
        output   => PinSignal_U_score_output,                -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-output[15..0]
        rst      => NamedSignal_RST                          -- ObjectKind=Sheet Entry|PrimaryId=score.vhd-rst
      );

    U_rom : rom                                              -- ObjectKind=Sheet Symbol|PrimaryId=U_rom
      Port Map
      (
        addr => PinSignal_U_piece_lut_rom_addr,              -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-addr[7..0]
        clk  => NamedSignal_CLK,                             -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-clk
        data => PinSignal_U_rom_data,                        -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-data[15..0]
        rst  => NamedSignal_RST                              -- ObjectKind=Sheet Entry|PrimaryId=rom.vhd-rst
      );

    U_piece_lut : piece_lut                                  -- ObjectKind=Sheet Symbol|PrimaryId=U_piece_lut
      Port Map
      (
        check_start => PinSignal_U_check_mask_lut_start,     -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-check_start
        clk         => NamedSignal_CLK,                      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-clk
        draw_start  => PinSignal_U_depiece_lut_start,        -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-draw_start
        error       => PinSignal_U_piece_lut_error,          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-error
        mask        => PinSignal_U_piece_lut_mask,           -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-mask[7..0]
        mask_select => PinSignal_U_check_mask_mask_select,   -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-mask_select[1..0]
        next_piece  => PinSignal_U_controller_lut_next_piece, -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-next_piece
        piece_type  => PinSignal_U_controller_lut_piece_type, -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-piece_type[2..0]
        ready       => PinSignal_U_piece_lut_ready,          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-ready
        rom_addr    => PinSignal_U_piece_lut_rom_addr(6 downto 0), -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_addr[6..0]
        rom_data    => PinSignal_U_rom_data(3 downto 0),     -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rom_data[3..0]
        rot         => PinSignal_U_controller_lut_rot,       -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rot[1..0]
        rst         => NamedSignal_RST,                      -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-rst
        x           => PinSignal_U_controller_lut_y(2 downto 0), -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-x[2..0]
        y           => PinSignal_U_controller_lut_x          -- ObjectKind=Sheet Entry|PrimaryId=piece_lut.vhd-y[3..0]
      );

    U_npgen : npgen                                          -- ObjectKind=Sheet Symbol|PrimaryId=U_npgen
      Port Map
      (
        button_seed => PinSignal_U_debounce_random_seed,     -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-button_seed
        clk         => NamedSignal_CLK,                      -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-clk
        new_number  => PinSignal_U_controller_new_piece,     -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-new_number
        output      => PinSignal_U_npgen_output,             -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-output[2..0]
        rst         => NamedSignal_RST                       -- ObjectKind=Sheet Entry|PrimaryId=npgen.vhd-rst
      );

    U_draw_score : draw_score                                -- ObjectKind=Sheet Symbol|PrimaryId=U_draw_score
      Port Map
      (
        addr     => PinSignal_U_check_mask_addr,             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-addr[7..0]
        clk      => NamedSignal_CLK,                         -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-clk
        data_out => PinSignal_U_clear_shift_data_out,        -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-data_out
        draw     => PinSignal_U_controller_draw_score_draw,  -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-draw
        input    => PinSignal_U_score_output,                -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-input[15..0]
        ready    => PinSignal_U_draw_score_ready,            -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-ready
        rst      => NamedSignal_RST,                         -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-rst
        write    => PinSignal_U_check_mask_write             -- ObjectKind=Sheet Entry|PrimaryId=draw_score.vhd-write
      );

    U_depiece : depiece                                      -- ObjectKind=Sheet Symbol|PrimaryId=U_depiece
      Port Map
      (
        addr        => PinSignal_U_check_mask_addr,          -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-addr[7..0]
        clk         => NamedSignal_CLK,                      -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-clk
        data_out    => PinSignal_U_clear_shift_data_out,     -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-data_out
        draw_erase  => PinSignal_U_controller_draw_erase_draw, -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-draw_erase
        lut_ready   => PinSignal_U_check_mask_lut_start,     -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-lut_ready
        lut_start   => PinSignal_U_depiece_lut_start,        -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-lut_start
        mask        => PinSignal_U_piece_lut_mask,           -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-mask[7..0]
        mask_select => PinSignal_U_check_mask_mask_select,   -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-mask_select[1..0]
        ready       => PinSignal_U_depiece_ready,            -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-ready
        rst         => NamedSignal_RST,                      -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-rst
        start       => PinSignal_U_controller_draw_erase_start, -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-start
        write       => PinSignal_U_check_mask_write          -- ObjectKind=Sheet Entry|PrimaryId=depiece.vhd-write
      );

    U_debounce : debounce                                    -- ObjectKind=Sheet Symbol|PrimaryId=U_debounce
      Port Map
      (
        clk         => NamedSignal_CLK,                      -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-clk
        output      => PinSignal_U_debounce_output,          -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-output[7..0]
        random_seed => PinSignal_U_debounce_random_seed,     -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-random_seed
        rst         => NamedSignal_RST,                      -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-rst
        vga_clock   => PinSignal_U_vga_h_sync                -- ObjectKind=Sheet Entry|PrimaryId=debounce.vhd-vga_clock
      );

    U_controller : controller                                -- ObjectKind=Sheet Symbol|PrimaryId=U_controller
      Port Map
      (
        check_empty       => PinSignal_U_check_mask_empty,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_empty
        check_ready       => PinSignal_U_check_mask_ready,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_ready
        check_start       => PinSignal_U_controller_check_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-check_start
        clear_shift_ready => PinSignal_U_clear_shift_ready,  -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clear_shift_ready
        clear_shift_start => PinSignal_U_controller_clear_shift_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clear_shift_start
        clk               => NamedSignal_CLK,                -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-clk
        draw_erase_draw   => PinSignal_U_controller_draw_erase_draw, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_draw
        draw_erase_ready  => PinSignal_U_depiece_ready,      -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_ready
        draw_erase_start  => PinSignal_U_controller_draw_erase_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_erase_start
        draw_score_draw   => PinSignal_U_controller_draw_score_draw, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_draw
        draw_score_ready  => PinSignal_U_draw_score_ready,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-draw_score_ready
        inputs            => PinSignal_U_debounce_output,    -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-inputs[7..0]
        lut_next_piece    => PinSignal_U_controller_lut_next_piece, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_next_piece
        lut_piece_type    => PinSignal_U_controller_lut_piece_type, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_piece_type[2..0]
        lut_rot           => PinSignal_U_controller_lut_rot, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_rot[1..0]
        lut_x             => PinSignal_U_controller_lut_x,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_x[3..0]
        lut_y             => PinSignal_U_controller_lut_y,   -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-lut_y[4..0]
        new_piece         => PinSignal_U_controller_new_piece, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-new_piece
        next_piece        => PinSignal_U_npgen_output,       -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-next_piece[2..0]
        rst               => NamedSignal_RST,                -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-rst
        timer_1_done      => PinSignal_Timer_1_done,         -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_1_done
        timer_1_start     => PinSignal_U_controller_timer_1_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_1_start
        timer_1_time      => PinSignal_U_controller_timer_1_time, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_1_time[7..0]
        timer_2_done      => PinSignal_Timer_2_done,         -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_2_done
        timer_2_start     => PinSignal_U_controller_timer_2_start, -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_2_start
        timer_2_time      => PinSignal_U_controller_timer_2_time -- ObjectKind=Sheet Entry|PrimaryId=controller.vhd-timer_2_time[7..0]
      );

    U_clear_shift : clear_shift                              -- ObjectKind=Sheet Symbol|PrimaryId=U_clear_shift
      Port Map
      (
        addr           => PinSignal_U_check_mask_addr,       -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-addr[7..0]
        clk            => NamedSignal_CLK,                   -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-clk
        data_in        => PinSignal_U_sr_if_do1,             -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-data_in
        data_out       => PinSignal_U_clear_shift_data_out,  -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-data_out
        ready          => PinSignal_U_clear_shift_ready,     -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-ready
        rst            => NamedSignal_RST,                   -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-rst
        score_increase => PinSignal_U_clear_shift_score_increase, -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-score_increase
        start          => PinSignal_U_controller_clear_shift_start, -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-start
        write          => PinSignal_U_check_mask_write       -- ObjectKind=Sheet Entry|PrimaryId=clear_shift.vhd-write
      );

    U_check_mask : check_mask                                -- ObjectKind=Sheet Symbol|PrimaryId=U_check_mask
      Port Map
      (
        addr        => PinSignal_U_check_mask_addr,          -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-addr[7..0]
        clk         => NamedSignal_CLK,                      -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-clk
        data_in     => PinSignal_U_sr_if_do1,                -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-data_in
        empty       => PinSignal_U_check_mask_empty,         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-empty
        lut_error   => PinSignal_U_piece_lut_error,          -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-lut_error
        lut_ready   => PinSignal_U_piece_lut_ready,          -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-lut_ready
        lut_start   => PinSignal_U_check_mask_lut_start,     -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-lut_start
        mask        => PinSignal_U_piece_lut_mask,           -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-mask[7..0]
        mask_select => PinSignal_U_check_mask_mask_select,   -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-mask_select[1..0]
        ready       => PinSignal_U_check_mask_ready,         -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-ready
        rst         => NamedSignal_RST,                      -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-rst
        start       => PinSignal_U_controller_check_start,   -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-start
        write       => PinSignal_U_check_mask_write          -- ObjectKind=Sheet Entry|PrimaryId=check_mask.vhd-write
      );

    Timer_2 : timer                                          -- ObjectKind=Sheet Symbol|PrimaryId=Timer 2
      Port Map
      (
        clk     => NamedSignal_CLK,                          -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-clk
        done    => PinSignal_Timer_2_done,                   -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-done
        rst     => NamedSignal_RST,                          -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-rst
        start   => PinSignal_U_controller_timer_2_start,     -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-start
        time    => PinSignal_U_controller_timer_2_time,      -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-time[7..0]
        vga_clk => PinSignal_U_vga_v_sync                    -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-vga_clk
      );

    Timer_1 : timer                                          -- ObjectKind=Sheet Symbol|PrimaryId=Timer 1
      Port Map
      (
        clk     => NamedSignal_CLK,                          -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-clk
        done    => PinSignal_Timer_1_done,                   -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-done
        rst     => NamedSignal_RST,                          -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-rst
        start   => PinSignal_U_controller_timer_1_start,     -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-start
        time    => PinSignal_U_controller_timer_1_time,      -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-time[7..0]
        vga_clk => PinSignal_U_vga_v_sync                    -- ObjectKind=Sheet Entry|PrimaryId=timer.vhd-vga_clk
      );

    -- Signal Assignments
    ---------------------
    PinSignal_U_controller_lut_y(2 downto 0) <= PinSignal_U_controller_lut_y; -- ObjectKind=Net|PrimaryId=lut_y
    PinSignal_U_piece_lut_rom_addr           <= PinSignal_U_piece_lut_rom_addr(6 downto 0); -- ObjectKind=Net|PrimaryId=rom_addr
    PinSignal_U_rom_data(3 downto 0)         <= PinSignal_U_rom_data; -- ObjectKind=Net|PrimaryId=rom_data

end structure;
------------------------------------------------------------

