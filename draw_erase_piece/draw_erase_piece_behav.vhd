library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of draw_erase_piece is
type sending_state is (waiting, writing, done);
signal state, new_state : sending_state;

begin

lbl1: process(clk)
begin
  if (rising_edge(clk)) then
    if rst = '1' then
      state <= waiting;
    else
      state <= new_state;
    end if;
  end if;
end process;

lbl2: process(state, clk, mask, draw_erase, start, data)
begin
  case state is
    when waiting =>
      write <= '0';
      ready <= '0';
      addr <= "ZZZZZZZZ";
      data <= 'Z';
      if(start = '1') then
        new_state <= writing;
      else
        new_state <= waiting;
      end if;
    when writing =>
      write <= '1';
      ready <= '0';
      addr <= mask;
      data <= draw_erase;
      new_state <= done;
    when done =>
      write <= '0';
      ready <= '1';
      addr <= "ZZZZZZZZ";
      data <= 'Z';
      new_state <= waiting;
  end case;
end process;
end behaviour;