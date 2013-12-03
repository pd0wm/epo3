library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of draw_score is

type sending_state is (reset, writing,done);
signal state, new_state : sending_state;
signal i , next_i :  unsigned(2 downto 0);

begin

lbl1: process(ds_clk)
begin
 if (rising_edge(ds_clk)) then
    	if ds_rst = '1' then
      		state <= reset;
		i <= (others => '0');
	else
      		state 	<= new_state;
		i 	<= next_i;
    	end if;
 end if;
end process;

lbl2: process(state,ds_rst,ds_draw,ds_input,i)
begin
  case state is
    when reset =>
      	ds_write 		<= '0';
      	ds_ready 		<= '0';
      	ds_data_out 		<= 'Z';
      	next_i 		<= (others => '0');
        ds_addr 	 		<= "ZZZZZZZZ";
        if(ds_draw = '1') then
        	new_state <= writing;
        else
        	new_state <= reset;
        end if;

     when writing =>
	 ds_write 		<= '1';
      	 ds_ready 		<= '0';
      	 ds_addr 		<= std_logic_vector(to_unsigned(151,8) - unsigned(i));
         ds_data_out 			<= ds_input(to_integer(i));
         next_i 			<= i+1;
	
	if (i = "111") then
         new_state <= done;
	else 
	 new_state <= writing;
	end if;

     when done =>
	ds_write 		<= '0';
      	ds_ready 		<= '1';
      	ds_data_out 		<= 'Z';
      	next_i 		<= (others => '0');
        ds_addr 	 		<= "ZZZZZZZZ";
        if(ds_draw = '0') then
        	new_state <= reset;
        else
        	new_state <= done;
        end if;
  end case;
end process;
end behaviour;










