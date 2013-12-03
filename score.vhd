library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity score is
	port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		increase_value : in  std_logic_vector(2 downto 0);
		increase       : in  std_logic;

		output         : out std_logic_vector(11 downto 0)
	);
end score;


architecture score_behaviour of score is
	signal bcd : std_logic_vector(19 downto 0);
	--signal score: std_logic_vector (7 downto 0);
	type state_type is(s0,s1,s2,s3,s4);
	signal state, next_state : state_type;
	
begin

L1: process (clk,rst,increase_value,increase) is

begin
if(rising_edge(clk)) then
if (rst='1') then
state  <= s0;
else
state  <= next_state;
end if;
end if;
end process;

L2: process (rst,state,increase_value,increase) is
variable i : integer;
variable score : unsigned(7 downto 0) ;
begin

 case state is
 
 	when s0 =>
 	if rst = '1' then
 	score  := (others  =>  '0'); 
 	output <=  (others  => '0');
 	end if;
 	i  := 0;
 	bcd  <= (others => '0');
 	if increase='1' then
 	next_state <= s1;
 	else
 	next_state <= s0;
 	end if;
 	
 	when s1  => 
 	score  := score + unsigned (increase_value);
 	--score  <= std_logic_vector(unsigned(score) + unsigned(increase_value)); 
 	next_state <= s2;
 	
 	when s2  => 
 	bcd (7 downto 0)  <= std_logic_vector(score);
 	next_state  <= s3;
 	
 	when s3  => 
 
    bcd     <= std_logic_vector(unsigned(bcd) sll 1);
    next_state  <= s4; 
  

 
 
 when s4  => 
 i := i+ 1; 
  	if i < 7 then
  	
 if bcd(11 downto 8) > "0100" then
 bcd( 11 downto 8)  <= std_logic_vector(unsigned(bcd(11 downto 8)) + 3);
 else
 bcd (11 downto 8) <=  bcd (11 downto 8);
 end if;
 	
 	 if bcd(15 downto 12) > "0100" then
 bcd( 15 downto 12)  <= std_logic_vector(unsigned( bcd(15 downto 12)) +3);
 else
  bcd( 15 downto 12)  <=  bcd( 15 downto 12);
 end if;
 		
  if bcd( 19 downto 16) > "0100" then
 bcd( 19 downto 16)  <= std_logic_vector(unsigned( bcd(19 downto 16)) +3);
 else
 bcd( 19 downto 16)  <= bcd( 19 downto 16) ;
end if;

next_state   <= s3;
 	  else 
    next_state <= s0;
    output  <= bcd(19 downto 8);
    end if;
 	when others => null;
 end case;
 

end process;



	
end architecture score_behaviour;
