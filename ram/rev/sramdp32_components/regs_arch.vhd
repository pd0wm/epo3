library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

architecture sramdp32_regs_arch of sramdp32_regs is
begin
	process(clk, rst)
	begin
		if (rst = '1') then
			mem_out1 <= '0';
			mem_out2 <= '0';
			mem_out3 <= '0';
			mem_out4 <= '0';
			mem_out5 <= '0';
			mem_out6 <= '0';
			mem_out7 <= '0';
			mem_out8 <= '0';
			mem_out9 <= '0';
			mem_out10 <= '0';
			mem_out11 <= '0';
			mem_out12 <= '0';
			mem_out13 <= '0';
			mem_out14 <= '0';
			mem_out15 <= '0';
			mem_out16 <= '0';
			mem_out17 <= '0';
			mem_out18 <= '0';
			mem_out19 <= '0';
			mem_out20 <= '0';
			mem_out21 <= '0';
			mem_out22 <= '0';
			mem_out23 <= '0';
			mem_out24 <= '0';
			mem_out25 <= '0';
			mem_out26 <= '0';
			mem_out27 <= '0';
			mem_out28 <= '0';
			mem_out29 <= '0';
			mem_out30 <= '0';
			mem_out31 <= '0';
			mem_out32 <= '0';
		elsif (clk'event and clk = '1') then
			mem_out1 <= mem_in1;
			mem_out2 <= mem_in2;
			mem_out3 <= mem_in3;
			mem_out4 <= mem_in4;
			mem_out5 <= mem_in5;
			mem_out6 <= mem_in6;
			mem_out7 <= mem_in7;
			mem_out8 <= mem_in8;
			mem_out9 <= mem_in9;
			mem_out10 <= mem_in10;
			mem_out11 <= mem_in11;
			mem_out12 <= mem_in12;
			mem_out13 <= mem_in13;
			mem_out14 <= mem_in14;
			mem_out15 <= mem_in15;
			mem_out16 <= mem_in16;
			mem_out17 <= mem_in17;
			mem_out18 <= mem_in18;
			mem_out19 <= mem_in19;
			mem_out20 <= mem_in20;
			mem_out21 <= mem_in21;
			mem_out22 <= mem_in22;
			mem_out23 <= mem_in23;
			mem_out24 <= mem_in24;
			mem_out25 <= mem_in25;
			mem_out26 <= mem_in26;
			mem_out27 <= mem_in27;
			mem_out28 <= mem_in28;
			mem_out29 <= mem_in29;
			mem_out30 <= mem_in30;
			mem_out31 <= mem_in31;
			mem_out32 <= mem_in32;
		end if;
	end process;
end sramdp32_regs_arch;