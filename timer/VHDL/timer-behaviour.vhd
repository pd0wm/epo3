
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of timer is
type timer_state is (uit,laag, hoog, klaar);
signal state, new_state: timer_state;
signal count,new_count : unsigned (7 downto 0);
signal time_uns : unsigned (7 downto 0);
signal clk_sig : std_logic;

begin
time_uns <= unsigned(timer_time);   
 lbl1: process(timer_clk,timer_vga_clk,timer_rst,clk_sig)
 begin 
if (timer_rst = '1') then  
clk_sig <= timer_clk; 
else 
clk_sig <= timer_vga_clk; 
end if; 

if (rising_edge(clk_sig)) then
	 if (timer_rst = '1') then
		state <= uit;
		count <= (others => '0');
	 else 
	 count <= new_count;
	 state <= new_state;
	 end if;
	end if;
	end process;

 
 lbl2: process(state,timer_start,count)
 
 begin 
 case state is
	when uit => 
	timer_done  <= '0';
	new_count <= (others => '0');
	
	if (timer_start = '1') then
	 new_state <= laag;
	else 
	 new_state <= uit;
	end if;

	when laag =>
	 timer_done <= '0';
	 if (count = time_uns) then
	 new_state<= hoog;
	 new_count <= count;
	else
	  new_state<= laag;
	  new_count <= count +1;
	 end if;

	when hoog => 
	timer_done <= '1';
	new_count <= (others => '0');
	if (timer_start = '0') then 
	 new_state <= klaar;
	else
	 new_state <= hoog;
	end if; 	
	
	when klaar => 
	 timer_done <= '1';
	 new_count<=(others => '0'); 
	if (timer_start = '1') then
	  new_state <= laag;
	else 
	  new_state <= klaar; 
	end if;
 end case;
end process;		       	 	
end behaviour;

