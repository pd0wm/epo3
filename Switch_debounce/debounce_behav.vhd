library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


architecture behaviour of debounce is
type button_state is (uit,links, links2, rechts, rechts2, beneden, beneden2);
signal count, new_count: unsigned (16 downto 0);
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

lbl4: process(count, new_count)
begin
	if count < 21 then
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
	 output <= "000";
         if ((rst = '1') or (inputs(0) = '0')) then
         new_state <= uit;
         else
         	if (count > 20) then
	new_state <= links2;
	else
	new_state <= links;
	end if;
         end if;
        
         

	when links2 =>
	if ((rst = '1') or (inputs(0) = '0')) then
         new_state <= uit;
         else
         new_state <= links2;
         end if;
	rst_sig <= '0';
	output <= "100";

        when rechts =>
	rst_sig <= '0';
         if ((rst = '1') or (inputs(1) = '0')) then
         new_state <= uit;
         else
	  if (count > 20) then
	new_state <= rechts2;
	else
	new_state <= rechts;
	end if;
         end if;
        
         output <= "000";
    
        when rechts2 =>
	if ((rst = '1') or (inputs(1) = '0')) then
         new_state <= uit;
         else
         new_state <= rechts2;
         end if;
	rst_sig <= '0';
	output <= "010";

        when beneden =>
	rst_sig <= '0';
         if ((rst = '1') or (inputs(2) = '0')) then
         new_state <= uit;
         else
	   if (count > 20) then
	new_state <= beneden2;
	else
	new_state <= beneden;
	end if;
         end if;
        output <= "000";
	
	when beneden2 =>
	if ((rst = '1') or (inputs(2) = '0')) then
         new_state <= uit;
         else
         new_state <= beneden2;
         end if;
	rst_sig <= '0';
	output <= "001";
 end case;
end process;                
        
        
end behaviour;
