library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of npg is
	component npg_ff
		port(clk : in  std_logic;
			 rst : in  std_logic;
			 d   : in  std_logic;
			 q   : out std_logic);
	end component npg_ff;
	
	component npg_mux2_1
	  port(
          out1 : out std_logic;
          sel, in1, in2 : in std_logic
        );
      end component npg_mux2_1;
	
	signal s0,s1,s2,s3,s5,s6,s7: std_logic;
	signal reset_or_new, button_xor_self, shift: std_logic;
	signal s4: std_logic_vector (2 downto 0);
begin

  reset_or_new <= (rst or new_number); -- Reset the button npg_ff when on system reset or reading of new number
  button_xor_self <= (button_seed xor shift); -- Make the rng shift half of the time while the button is pressed
											  -- when button stops being pressed either shift at normal speed or stop shifting depending on current state
  
  Button: npg_ff port map(
    clk => clk,
    rst => reset_or_new,
    d => button_xor_self,
    q => shift
  );
  --A mux for every npg_ff in the shift register to control between shifting and keeping the current value
  M1: npg_mux2_1 port map(
    sel =>shift,
    in1 =>s0,
    in2 =>s1,
    out1 =>s5
    );
	--ff for every output, with feedback xor, goes through 7 out of 8 possible states in a determined order
	L1: npg_ff port map(
		clk => clk,
		rst => rst,
		d   => s5,
		q   => s1
	);
	M2: npg_mux2_1 port map(
    sel =>shift,
    in1 =>s1,
    in2 =>s2,
    out1 =>s6
    );
	L2: npg_ff port map(
		clk => clk,
		rst => rst,
		d   => s6,
		q   => s2
	);	
	M3: npg_mux2_1 port map(
    sel =>shift,
    in1 =>s2,
    in2 =>s3,
    out1 =>s7
    );
	L3: npg_ff port map(
		clk => clk,
		rst => rst,
		d   => s7,
		q   => s3
	);
	s0 <= not(s2 xor s3);
	s4<= (s1, s2, s3);
	output <= s4;
	
end structural;

