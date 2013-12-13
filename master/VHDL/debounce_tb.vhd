library IEEE;
use IEEE.std_logic_1164.ALL;


architecture behaviour of debounce_testb is
component debounce is
PORT
(
                clk : in std_logic;
                rst : in std_logic;
                inv_inputs : in std_logic_vector(5 downto 0);
                output : out std_logic_vector(5 downto 0);
                random_seed : out std_logic
);
END component debounce;
        
        signal clk,rst, random_seed: std_logic;
        signal inv_inputs, output: std_logic_vector(5 downto 0);
        begin

         clk <= '1' after 0 ns,
         		'0' after 82 ns when clk /= '0' 
           else '1' after 82 ns;  

         rst <= '1' after 0 ns,
	        '0' after 8000 ns;

         inv_inputs <= "111111" after 0 ns,
		 "011111" after 4000 ns, 
		 "111111" after 27000 ns,
		 "101111" after 28000 ns, 
		 "111111" after 316000 ns, 
		 "011111" after 320000 ns, 
		 "111111" after 400000 ns,
		 "110111" after 440000 ns, 
                 "111111" after 440200 ns,
	  	 "110111" after 440800 ns,
		 "111111" after 441200 ns,
		 "110111" after 441400 ns,
		 "111111" after 516000 ns,
	   	 "110111" after 516200 ns,
		 "111111" after 516800 ns,
		 "110111" after 517200 ns,
		 "111111" after 517800 ns,
		 "001111" after 560000 ns, 
		 "111111" after 760000 ns;
        
fghjk: debounce port map(
  clk=>clk,
  rst =>rst,
  inv_inputs => inv_inputs,
  random_seed=>random_seed,
  output => output
  );
end behaviour;



