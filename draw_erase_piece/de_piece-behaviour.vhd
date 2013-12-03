library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of de_piece is
type sending_state is (waiting, writing, done, lut_lookup);
signal state, new_state : sending_state;
signal current_block, new_current_block : unsigned(1 downto 0);
begin

lbl1: process(clk)
begin
  if (rising_edge(clk)) then
    if rst = '1' then
      state <= waiting;
	current_block <= "00";
    else
      state <= new_state;
	current_block <= new_current_block;
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
	mask_select <= "ZZ";
	lut_start <= '0';
	new_current_block <= "00";
      data <= 'Z';
      if(start = '1') then
        new_state <= lut_lookup;
      else
        new_state <= waiting;
      end if;

    when writing =>
      write <= '1';
      ready <= '0';
      addr <= mask;
      data <= draw_erase;
	new_current_block <= current_block + 1;
	lut_start <= '0';
	if(current_block = 3) then
	new_state <= done;
	else
      new_state <= lut_lookup;
	end if;
	mask_select <= "ZZ";

	when lut_lookup =>
 	write <= '0';
      ready <= '0';
      addr <= "ZZZZZZZZ";
      data <= 'Z';
	lut_start <= '1';
	mask_select <= std_logic_vector(current_block);
	new_current_block <= current_block;
	if( lut_ready = '1') then
	new_state <= writing;
	else
	new_state <= lut_lookup;
	end if;
	
    when done =>
      write <= '0';
      ready <= '1';
	lut_start <= '0';
	mask_select <= "ZZ";
	new_current_block <= "00";
      addr <= "ZZZZZZZZ";
      data <= 'Z';
	  if(start = '1') then
	  new_state <= done;
	  else
      new_state <= waiting;
	  end if;
  end case;
end process;
end behaviour;











