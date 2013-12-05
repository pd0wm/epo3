library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


architecture behaviour of debounce is
type button_state is (uit, start_count, finish_count);
signal count, new_count: unsigned (6 downto 0);
signal new_out: std_logic_vector(5 downto 0);
signal rst_sig: std_logic;
signal state, new_state :button_state;

begin
random_seed <= (inputs(0) or inputs(1) or inputs(2) or inputs(3) or inputs(4) or inputs(5));
lbl2: process(clk)
begin
if (rising_edge(clk)) then
         if rst = '1' then
         state <= uit;
         output <= (others => '0');
         else
	 output <= new_out;
         state <= new_state;
         end if;
end if;
        
        end process;

lbl4: process(count, new_count)
begin
        if count < 127 then
                         new_count <= count+1;
                         else
                new_count<=count;
                end if;
end process;
    
        
 lbl1: process(rst_sig, clk)
 begin
if (rst_sig = '1') then
        count <= (others => '0');
         elsif(rising_edge(clk)) then
        count <= new_count;
        end if;
        end process;

lbl3: process(state,clk, inputs )
 begin
 case state is
        when uit =>
        rst_sig <= '1';
        new_out <= (others => '0');
        
        if (inputs = "000000") then
		new_state <= uit;
	else
		new_state <= start_count;
        end if;

	when start_count =>
        rst_sig <= '0';
        new_out <= (others => '0');
        
        if (rst = '1') then
		new_state <= uit;
	elsif (count = 127) then
		new_state <= finish_count;
	else
		new_state <= start_count;
        end if;

	when finish_count =>
        rst_sig <= '0';
        new_out <= inputs;
        
        if ((rst = '1') or (inputs = "000000")) then
		new_state <= uit;
	else
		new_state <= finish_count;
        end if;
             
  end case;
end process;
        
end behaviour;
