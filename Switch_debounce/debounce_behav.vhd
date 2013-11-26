library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


architecture behaviour of debounce is
type button_state is (uit,links, links2, rechts, rechts2, beneden, beneden2, hdrop, hdrop2, rotatel, rotatel2, rotater, rotarer2);
signal count, new_count: unsigned (16 downto 0);
signal rst_sig: std_logic;
signal state, new_state :button_state;

begin
random_seed <= (inputs(0) or inputs(1) or inputs(2) or inputs(3) or inputs(4) or inputs(5));
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
		 elsif(inputs(3) = '1') then
		 new_state <= hdrop;
		 elsif(inputs(4) = '1') then
		 new_state <=rotatel;
		 elsif(inputs(5) = '1') then
		 new_state <= rotater;
         else
         new_state <= uit;
        end if;

        when links =>
        rst_sig <= '0';
	 output <= "000000";
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
	output <= "100000";

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
        
         output <= "000000";
    
        when rechts2 =>
	if ((rst = '1') or (inputs(1) = '0')) then
         new_state <= uit;
         else
         new_state <= rechts2;
         end if;
	rst_sig <= '0';
	output <= "010000";

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
        output <= "000000";
	
	when beneden2 =>
	if ((rst = '1') or (inputs(2) = '0')) then
         new_state <= uit;
         else
         new_state <= beneden2;
         end if;
	rst_sig <= '0';
	output <= "001000";
	
	
	        when hdrop =>
	rst_sig <= '0';
         if ((rst = '1') or (inputs(3) = '0')) then
         new_state <= uit;
         else
	   if (count > 20) then
	new_state <= hdrop2;
	else
	new_state <= hdrop;
	end if;
         end if;
        output <= "000000";
	
	when hdrop2 =>
	if ((rst = '1') or (inputs(3) = '0')) then
         new_state <= uit;
         else
         new_state <= hdrop2;
         end if;
	rst_sig <= '0';
	output <= "000100";


        when rotatel =>
	rst_sig <= '0';
         if ((rst = '1') or (inputs(4) = '0')) then
         new_state <= uit;
         else
	   if (count > 20) then
	new_state <= rotatel2;
	else
	new_state <= rotatel;
	end if;
         end if;
        output <= "000000";
	
	when rotatel2 =>
	if ((rst = '1') or (inputs(4) = '0')) then
         new_state <= uit;
         else
         new_state <= rotatel2;
         end if;
	rst_sig <= '0';
	output <= "000010"; 


        when rotater =>
	rst_sig <= '0';
         if ((rst = '1') or (inputs(5) = '0')) then
         new_state <= uit;
         else
	   if (count > 20) then
	new_state <= rotater2;
	else
	new_state <= rotater;
	end if;
         end if;
        output <= "000000";
	
	when rotater2 =>
	if ((rst = '1') or (inputs(5) = '0')) then
         new_state <= uit;
         else
         new_state <= rotater2;
         end if;
	rst_sig <= '0';
	output <= "000001";	
  end case;
end process;       
        
end behaviour;
