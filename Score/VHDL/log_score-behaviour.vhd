library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of log_score is
component score is
   port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		increase_value : in  std_logic_vector(2 downto 0);
		increase       : in  std_logic;

		output         : out std_logic_vector(7 downto 0)
		);
end component;

component log is
   port(log_in :in    std_logic_vector(7 downto 0);
        log_out:out   std_logic_vector(7 downto 0));
end component;

signal score_to_log : std_logic_vector (7 downto 0);

begin

L1: score port map ( clk => clk, rst => rst, increase_value => increase_value, increase => increase, output => score_to_log);
L2: log port map ( log_in => score_to_log, log_out => output);

end behaviour;


