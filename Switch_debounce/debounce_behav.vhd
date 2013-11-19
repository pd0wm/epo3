library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


architecture behaviour of debounce is
type button_state is (uit,links, rechts, beneden);
signal count: unsigned (16 downto 0);
signal rst_sig: std_logic;
signal state, new_state :button_state;

begin
random_seed <= (inputs(0) or inputs(1) or inputs(2));
lbl2: process(clk)
begin
if (rising_edge(clk)) then
	 if rst = '1' then
	 state <= uit;
	
	 else 
	 state <= new_state;
	 end if;
	end if;
	end process;
	
 lbl1: process(clk)
 begin 
if (rising_edge(clk)) then
	 if rst_sig = '1' then
	count <= (others => '0');
	 else 
	 if count < 21 then
	 count <= count+1;
	 else
		count<=count;
		end if;
	 end if;
	end if;
	end process;
	
lbl3: process(state,clk, inputs )
 begin 
 case state is
	when uit => 
	rst_sig <= '1';
	output <= (others => '0');
	
	if (inputs(0) = '1') then
	 new_state <= links;
	elsif(inputs(1) = '1') then
	 new_state <= rechts;
	 elsif(inputs(2) = '1') then
	 new_state <= beneden;
	 else
	 new_state <= uit;
	end if;

	when links =>
	 rst_sig <= '0';
	 
	 if ((rst = '1') or (inputs(0) = '0')) then
	 new_state <= uit;
	 else
	 new_state <= links;
	 end if;
	 
	 if (count > 20) then
		output <= "100";
		else
		output <= "000";
		end if;

	when rechts => 
	rst_sig <= '0';
	 
	 if ((rst = '1') or (inputs(1) = '0')) then
	 new_state <= uit;
	 else
	 new_state <= rechts;
	 end if;
	 
	 if (count > 20) then
		output <= "010";
		else
		output <= "000";
		end if;	
	
	when beneden => 
	rst_sig <= '0';
	 
	 if ((rst = '1') or (inputs(2) = '0')) then
	 new_state <= uit;
	 else
	 new_state <= beneden;
	 end if;
	 
	 if (count > 20) then
		output <= "001";
		else
		output <= "000";
		end if;
 end case;
end process;		    
	
	
end behaviour;