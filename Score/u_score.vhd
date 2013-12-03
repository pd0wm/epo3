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

architecture score_behavioural of score is
function to_bcd ( bin : std_logic_vector(7 downto 0) ) return std_logic_vector is
variable i : integer;--:=0;
variable bcd : std_logic_vector(11 downto 0) ; --:= (others => '0');
variable bint : std_logic_vector(7 downto 0); -- := bin;

begin
i := 0; 
bcd   := (others => '0');
bint := bin;
for i in 0 to 7 loop  -- repeating 8 times.
bcd(11 downto 1) := bcd(10 downto 0);  --shifting the bits.
bcd(0) := bint(7);
bint(7 downto 1) := bint(6 downto 0);
bint(0) :='0';


if(i < 7 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
bcd(3 downto 0) := bcd(3 downto 0) + "0011";
end if;

if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
bcd(7 downto 4) := bcd(7 downto 4) + "0011";
end if;

if(i < 7 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
bcd(11 downto 8) := bcd(11 downto 8) + "0011";
end if;


end loop;
return bcd;
end to_bcd;

signal score: std_logic_vector (7 downto 0);
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


L2: process (clk,rst,increase_value,increase) 

end architecture;