library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

architecture sramdp32_behav of sramdp32 is
	component sramdp32_comb
		port(mem_in1     : in  std_logic;
			 mem_in2     : in  std_logic;
			 mem_in3     : in  std_logic;
			 mem_in4     : in  std_logic;
			 mem_in5     : in  std_logic;
			 mem_in6     : in  std_logic;
			 mem_in7     : in  std_logic;
			 mem_in8     : in  std_logic;
			 mem_in9     : in  std_logic;
			 mem_in10    : in  std_logic;
			 mem_in11    : in  std_logic;
			 mem_in12    : in  std_logic;
			 mem_in13    : in  std_logic;
			 mem_in14    : in  std_logic;
			 mem_in15    : in  std_logic;
			 mem_in16    : in  std_logic;
			 mem_in17    : in  std_logic;
			 mem_in18    : in  std_logic;
			 mem_in19    : in  std_logic;
			 mem_in20    : in  std_logic;
			 mem_in21    : in  std_logic;
			 mem_in22    : in  std_logic;
			 mem_in23    : in  std_logic;
			 mem_in24    : in  std_logic;
			 mem_in25    : in  std_logic;
			 mem_in26    : in  std_logic;
			 mem_in27    : in  std_logic;
			 mem_in28    : in  std_logic;
			 mem_in29    : in  std_logic;
			 mem_in30    : in  std_logic;
			 mem_in31    : in  std_logic;
			 mem_in32    : in  std_logic;
			 mem_out1    : out std_logic;
			 mem_out2    : out std_logic;
			 mem_out3    : out std_logic;
			 mem_out4    : out std_logic;
			 mem_out5    : out std_logic;
			 mem_out6    : out std_logic;
			 mem_out7    : out std_logic;
			 mem_out8    : out std_logic;
			 mem_out9    : out std_logic;
			 mem_out10   : out std_logic;
			 mem_out11   : out std_logic;
			 mem_out12   : out std_logic;
			 mem_out13   : out std_logic;
			 mem_out14   : out std_logic;
			 mem_out15   : out std_logic;
			 mem_out16   : out std_logic;
			 mem_out17   : out std_logic;
			 mem_out18   : out std_logic;
			 mem_out19   : out std_logic;
			 mem_out20   : out std_logic;
			 mem_out21   : out std_logic;
			 mem_out22   : out std_logic;
			 mem_out23   : out std_logic;
			 mem_out24   : out std_logic;
			 mem_out25   : out std_logic;
			 mem_out26   : out std_logic;
			 mem_out27   : out std_logic;
			 mem_out28   : out std_logic;
			 mem_out29   : out std_logic;
			 mem_out30   : out std_logic;
			 mem_out31   : out std_logic;
			 mem_out32   : out std_logic;
			 rw_addr     : in  std_logic_vector(4 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 ro_addr     : in  std_logic_vector(4 downto 0);
			 ro_data_out : out std_logic);
	end component sramdp32_comb;

	component sramdp32_regs
		port(clk       : in  std_logic;
			 rst       : in  std_logic;
			 mem_in1   : in  std_logic;
			 mem_in2   : in  std_logic;
			 mem_in3   : in  std_logic;
			 mem_in4   : in  std_logic;
			 mem_in5   : in  std_logic;
			 mem_in6   : in  std_logic;
			 mem_in7   : in  std_logic;
			 mem_in8   : in  std_logic;
			 mem_in9   : in  std_logic;
			 mem_in10  : in  std_logic;
			 mem_in11  : in  std_logic;
			 mem_in12  : in  std_logic;
			 mem_in13  : in  std_logic;
			 mem_in14  : in  std_logic;
			 mem_in15  : in  std_logic;
			 mem_in16  : in  std_logic;
			 mem_in17  : in  std_logic;
			 mem_in18  : in  std_logic;
			 mem_in19  : in  std_logic;
			 mem_in20  : in  std_logic;
			 mem_in21  : in  std_logic;
			 mem_in22  : in  std_logic;
			 mem_in23  : in  std_logic;
			 mem_in24  : in  std_logic;
			 mem_in25  : in  std_logic;
			 mem_in26  : in  std_logic;
			 mem_in27  : in  std_logic;
			 mem_in28  : in  std_logic;
			 mem_in29  : in  std_logic;
			 mem_in30  : in  std_logic;
			 mem_in31  : in  std_logic;
			 mem_in32  : in  std_logic;
			 mem_out1  : out std_logic;
			 mem_out2  : out std_logic;
			 mem_out3  : out std_logic;
			 mem_out4  : out std_logic;
			 mem_out5  : out std_logic;
			 mem_out6  : out std_logic;
			 mem_out7  : out std_logic;
			 mem_out8  : out std_logic;
			 mem_out9  : out std_logic;
			 mem_out10 : out std_logic;
			 mem_out11 : out std_logic;
			 mem_out12 : out std_logic;
			 mem_out13 : out std_logic;
			 mem_out14 : out std_logic;
			 mem_out15 : out std_logic;
			 mem_out16 : out std_logic;
			 mem_out17 : out std_logic;
			 mem_out18 : out std_logic;
			 mem_out19 : out std_logic;
			 mem_out20 : out std_logic;
			 mem_out21 : out std_logic;
			 mem_out22 : out std_logic;
			 mem_out23 : out std_logic;
			 mem_out24 : out std_logic;
			 mem_out25 : out std_logic;
			 mem_out26 : out std_logic;
			 mem_out27 : out std_logic;
			 mem_out28 : out std_logic;
			 mem_out29 : out std_logic;
			 mem_out30 : out std_logic;
			 mem_out31 : out std_logic;
			 mem_out32 : out std_logic);
	end component sramdp32_regs;

	component sramdp32_tri
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 enable   : in  std_logic;
			 data_in  : in  std_logic;
			 data_out : out std_logic);
	end component sramdp32_tri;

	signal mem_state1  : std_logic;
	signal mem_state2  : std_logic;
	signal mem_state3  : std_logic;
	signal mem_state4  : std_logic;
	signal mem_state5  : std_logic;
	signal mem_state6  : std_logic;
	signal mem_state7  : std_logic;
	signal mem_state8  : std_logic;
	signal mem_state9  : std_logic;
	signal mem_state10 : std_logic;
	signal mem_state11 : std_logic;
	signal mem_state12 : std_logic;
	signal mem_state13 : std_logic;
	signal mem_state14 : std_logic;
	signal mem_state15 : std_logic;
	signal mem_state16 : std_logic;
	signal mem_state17 : std_logic;
	signal mem_state18 : std_logic;
	signal mem_state19 : std_logic;
	signal mem_state20 : std_logic;
	signal mem_state21 : std_logic;
	signal mem_state22 : std_logic;
	signal mem_state23 : std_logic;
	signal mem_state24 : std_logic;
	signal mem_state25 : std_logic;
	signal mem_state26 : std_logic;
	signal mem_state27 : std_logic;
	signal mem_state28 : std_logic;
	signal mem_state29 : std_logic;
	signal mem_state30 : std_logic;
	signal mem_state31 : std_logic;
	signal mem_state32 : std_logic;
	signal mem_new1    : std_logic;
	signal mem_new2    : std_logic;
	signal mem_new3    : std_logic;
	signal mem_new4    : std_logic;
	signal mem_new5    : std_logic;
	signal mem_new6    : std_logic;
	signal mem_new7    : std_logic;
	signal mem_new8    : std_logic;
	signal mem_new9    : std_logic;
	signal mem_new10   : std_logic;
	signal mem_new11   : std_logic;
	signal mem_new12   : std_logic;
	signal mem_new13   : std_logic;
	signal mem_new14   : std_logic;
	signal mem_new15   : std_logic;
	signal mem_new16   : std_logic;
	signal mem_new17   : std_logic;
	signal mem_new18   : std_logic;
	signal mem_new19   : std_logic;
	signal mem_new20   : std_logic;
	signal mem_new21   : std_logic;
	signal mem_new22   : std_logic;
	signal mem_new23   : std_logic;
	signal mem_new24   : std_logic;
	signal mem_new25   : std_logic;
	signal mem_new26   : std_logic;
	signal mem_new27   : std_logic;
	signal mem_new28   : std_logic;
	signal mem_new29   : std_logic;
	signal mem_new30   : std_logic;
	signal mem_new31   : std_logic;
	signal mem_new32   : std_logic;

	signal ro_new : std_logic;
	signal rw_new : std_logic;
begin
	comb_logic : sramdp32_comb
		port map(mem_in1     => mem_state1,
			     mem_in2     => mem_state2,
			     mem_in3     => mem_state3,
			     mem_in4     => mem_state4,
			     mem_in5     => mem_state5,
			     mem_in6     => mem_state6,
			     mem_in7     => mem_state7,
			     mem_in8     => mem_state8,
			     mem_in9     => mem_state9,
			     mem_in10    => mem_state10,
			     mem_in11    => mem_state11,
			     mem_in12    => mem_state12,
			     mem_in13    => mem_state13,
			     mem_in14    => mem_state14,
			     mem_in15    => mem_state15,
			     mem_in16    => mem_state16,
			     mem_in17    => mem_state17,
			     mem_in18    => mem_state18,
			     mem_in19    => mem_state19,
			     mem_in20    => mem_state20,
			     mem_in21    => mem_state21,
			     mem_in22    => mem_state22,
			     mem_in23    => mem_state23,
			     mem_in24    => mem_state24,
			     mem_in25    => mem_state25,
			     mem_in26    => mem_state26,
			     mem_in27    => mem_state27,
			     mem_in28    => mem_state28,
			     mem_in29    => mem_state29,
			     mem_in30    => mem_state30,
			     mem_in31    => mem_state31,
			     mem_in32    => mem_state32,
			     mem_out1    => mem_new1,
			     mem_out2    => mem_new2,
			     mem_out3    => mem_new3,
			     mem_out4    => mem_new4,
			     mem_out5    => mem_new5,
			     mem_out6    => mem_new6,
			     mem_out7    => mem_new7,
			     mem_out8    => mem_new8,
			     mem_out9    => mem_new9,
			     mem_out10   => mem_new10,
			     mem_out11   => mem_new11,
			     mem_out12   => mem_new12,
			     mem_out13   => mem_new13,
			     mem_out14   => mem_new14,
			     mem_out15   => mem_new15,
			     mem_out16   => mem_new16,
			     mem_out17   => mem_new17,
			     mem_out18   => mem_new18,
			     mem_out19   => mem_new19,
			     mem_out20   => mem_new20,
			     mem_out21   => mem_new21,
			     mem_out22   => mem_new22,
			     mem_out23   => mem_new23,
			     mem_out24   => mem_new24,
			     mem_out25   => mem_new25,
			     mem_out26   => mem_new26,
			     mem_out27   => mem_new27,
			     mem_out28   => mem_new28,
			     mem_out29   => mem_new29,
			     mem_out30   => mem_new30,
			     mem_out31   => mem_new31,
			     mem_out32   => mem_new32,
			     rw_addr     => rw_addr,
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we,
			     ro_addr     => ro_addr,
			     ro_data_out => ro_data_out);

	regs : sramdp32_regs
		port map(clk       => clk,
			     rst       => rst,
			     mem_in1   => mem_new1,
			     mem_in2   => mem_new2,
			     mem_in3   => mem_new3,
			     mem_in4   => mem_new4,
			     mem_in5   => mem_new5,
			     mem_in6   => mem_new6,
			     mem_in7   => mem_new7,
			     mem_in8   => mem_new8,
			     mem_in9   => mem_new9,
			     mem_in10  => mem_new10,
			     mem_in11  => mem_new11,
			     mem_in12  => mem_new12,
			     mem_in13  => mem_new13,
			     mem_in14  => mem_new14,
			     mem_in15  => mem_new15,
			     mem_in16  => mem_new16,
			     mem_in17  => mem_new17,
			     mem_in18  => mem_new18,
			     mem_in19  => mem_new19,
			     mem_in20  => mem_new20,
			     mem_in21  => mem_new21,
			     mem_in22  => mem_new22,
			     mem_in23  => mem_new23,
			     mem_in24  => mem_new24,
			     mem_in25  => mem_new25,
			     mem_in26  => mem_new26,
			     mem_in27  => mem_new27,
			     mem_in28  => mem_new28,
			     mem_in29  => mem_new29,
			     mem_in30  => mem_new30,
			     mem_in31  => mem_new31,
			     mem_in32  => mem_new32,
			     mem_out1  => mem_state1,
			     mem_out2  => mem_state2,
			     mem_out3  => mem_state3,
			     mem_out4  => mem_state4,
			     mem_out5  => mem_state5,
			     mem_out6  => mem_state6,
			     mem_out7  => mem_state7,
			     mem_out8  => mem_state8,
			     mem_out9  => mem_state9,
			     mem_out10 => mem_state10,
			     mem_out11 => mem_state11,
			     mem_out12 => mem_state12,
			     mem_out13 => mem_state13,
			     mem_out14 => mem_state14,
			     mem_out15 => mem_state15,
			     mem_out16 => mem_state16,
			     mem_out17 => mem_state17,
			     mem_out18 => mem_state18,
			     mem_out19 => mem_state19,
			     mem_out20 => mem_state20,
			     mem_out21 => mem_state21,
			     mem_out22 => mem_state22,
			     mem_out23 => mem_state23,
			     mem_out24 => mem_state24,
			     mem_out25 => mem_state25,
			     mem_out26 => mem_state26,
			     mem_out27 => mem_state27,
			     mem_out28 => mem_state28,
			     mem_out29 => mem_state29,
			     mem_out30 => mem_state30,
			     mem_out31 => mem_state31,
			     mem_out32 => mem_state32);

	ro_tri : sramdp32_tri
		port map(clk      => clk,
			     rst      => rst,
			     enable   => ro_re,
			     data_in  => ro_new,
			     data_out => ro_data_out);

	rw_tri : sramdp32_tri
		port map(clk      => clk,
			     rst      => rst,
			     enable   => rw_re,
			     data_in  => rw_new,
			     data_out => rw_data_out);

end;