library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of next_piece_generator is
	component ff
		port(clk : in  std_logic;
			 rst : in  std_logic;
			 D   : in  std_logic;
			 Q   : out std_logic);
	end component ff;
	
	component ff
	  port(
          out1 : out std_logic;
          sel, in1, in2 : in std_logic
        );
      end component ff;
	
	signal s0,s1,s2,s3,s5,s6,s7: std_logic;
	signal reset_or_new, button_xor_self, shift: std_logic;
	signal s4: std_logic_vector (2 downto 0);
begin
  reset_or_new <= (rst or new_number);
  button_xor_self <= (button_seed xor shift);
  
  Button: ff port map(
    clk => clk,
    rst => reset_or_new,
    D => button_xor_self,
    Q => shift
  );
  
  M1: ff port map(
    sel =>shift,
    in1 =>s0,
    in2 =>s1,
    out1 =>s5
    );
	L1: ff port map(
		clk => clk,
		rst => rst,
		D   => s5,
		Q   => s1
	);
	M2: ff port map(
    sel =>shift,
    in1 =>s1,
    in2 =>s2,
    out1 =>s6
    );
	L2: ff port map(
		clk => clk,
		rst => rst,
		D   => s6,
		Q   => s2
	);	
	M3: ff port map(
    sel =>shift,
    in1 =>s2,
    in2 =>s3,
    out1 =>s7
    );
	L3: ff port map(
		clk => clk,
		rst => rst,
		D   => s7,
		Q   => s3
	);
	s0 <= not(s2 xor s3);
	s4<= (s1, s2, s3);
	output <= s4;
	
end architecture structural;
