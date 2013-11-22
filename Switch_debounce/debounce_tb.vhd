library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of debounce_tb is
component debounce is
PORT
(
                clk : in std_logic;
                rst : in std_logic;
                inputs : in std_logic_vector(2 downto 0);
                output : out std_logic_vector(2 downto 0);
                random_seed : out std_logic
);
END component debounce;
        
        signal clk,rst, random_seed: std_logic;
        signal inputs, output: std_logic_vector(2 downto 0);
        begin
         clk <= '1' after 0 ns,
         '0' after 200 ns when clk /= '0' else '1' after 200 ns;
         rst <= '1' after 0 ns, '0' after 2000 ns;
         inputs <= "000" after 0 ns, "100" after 1000 ns, "010" after 7000 ns, "110" after 79000 ns, "100" after 80000 ns, 


"001" after 100000 ns, "000" after 100050 ns,"001" after 100200 ns,"000" after 100300 ns,"001" after 100350 ns,"000" after 119000 ns,"001" after 119050 ns,"000" after 119200 ns,"001" after 119300 ns,"000" after 119450 ns,


"110" after 120000 ns, "000" after 180000 ns;
        
fghjk: debounce port map(
  clk=>clk,
  rst =>rst,
  inputs => inputs,
  random_seed=>random_seed,
  output => output
  );
end behaviour;

