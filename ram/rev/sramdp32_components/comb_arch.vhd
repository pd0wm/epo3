library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

architecture sramdp32_comb_arch of sramdp32_comb is
begin
	process(
		rw_addr, ro_addr, rw_data_in, rw_we,
		mem_in1, mem_in2, mem_in3, mem_in4, mem_in5, mem_in6, mem_in7, mem_in8, mem_in9, mem_in10,
		mem_in11, mem_in12, mem_in13, mem_in14, mem_in15, mem_in16, mem_in17, mem_in18, mem_in19, mem_in20, 
		mem_in21, mem_in22, mem_in23, mem_in24, mem_in25, mem_in26, mem_in27, mem_in28, mem_in29, mem_in30, 
		mem_in31, mem_in32
	)
	begin
		case to_integer(unsigned(rw_addr)) is
			when 0  => rw_data_out <= mem_in1;
			when 1  => rw_data_out <= mem_in2;
			when 2  => rw_data_out <= mem_in3;
			when 3  => rw_data_out <= mem_in4;
			when 4  => rw_data_out <= mem_in5;
			when 5  => rw_data_out <= mem_in6;
			when 6  => rw_data_out <= mem_in7;
			when 7  => rw_data_out <= mem_in8;
			when 8  => rw_data_out <= mem_in9;
			when 9  => rw_data_out <= mem_in10;
			when 10 => rw_data_out <= mem_in11;
			when 11 => rw_data_out <= mem_in12;
			when 12 => rw_data_out <= mem_in13;
			when 13 => rw_data_out <= mem_in14;
			when 14 => rw_data_out <= mem_in15;
			when 15 => rw_data_out <= mem_in16;
			when 16 => rw_data_out <= mem_in17;
			when 17 => rw_data_out <= mem_in18;
			when 18 => rw_data_out <= mem_in19;
			when 19 => rw_data_out <= mem_in20;
			when 20 => rw_data_out <= mem_in21;
			when 21 => rw_data_out <= mem_in22;
			when 22 => rw_data_out <= mem_in23;
			when 23 => rw_data_out <= mem_in24;
			when 24 => rw_data_out <= mem_in25;
			when 25 => rw_data_out <= mem_in26;
			when 26 => rw_data_out <= mem_in27;
			when 27 => rw_data_out <= mem_in28;
			when 28 => rw_data_out <= mem_in29;
			when 29 => rw_data_out <= mem_in30;
			when 30 => rw_data_out <= mem_in31;
			when 31 => rw_data_out <= mem_in32;
		end case;

		case to_integer(unsigned(ro_addr)) is
			when 0  => ro_data_out <= mem_in1;
			when 1  => ro_data_out <= mem_in2;
			when 2  => ro_data_out <= mem_in3;
			when 3  => ro_data_out <= mem_in4;
			when 4  => ro_data_out <= mem_in5;
			when 5  => ro_data_out <= mem_in6;
			when 6  => ro_data_out <= mem_in7;
			when 7  => ro_data_out <= mem_in8;
			when 8  => ro_data_out <= mem_in9;
			when 9  => ro_data_out <= mem_in10;
			when 10 => ro_data_out <= mem_in11;
			when 11 => ro_data_out <= mem_in12;
			when 12 => ro_data_out <= mem_in13;
			when 13 => ro_data_out <= mem_in14;
			when 14 => ro_data_out <= mem_in15;
			when 15 => ro_data_out <= mem_in16;
			when 16 => ro_data_out <= mem_in17;
			when 17 => ro_data_out <= mem_in18;
			when 18 => ro_data_out <= mem_in19;
			when 19 => ro_data_out <= mem_in20;
			when 20 => ro_data_out <= mem_in21;
			when 21 => ro_data_out <= mem_in22;
			when 22 => ro_data_out <= mem_in23;
			when 23 => ro_data_out <= mem_in24;
			when 24 => ro_data_out <= mem_in25;
			when 25 => ro_data_out <= mem_in26;
			when 26 => ro_data_out <= mem_in27;
			when 27 => ro_data_out <= mem_in28;
			when 28 => ro_data_out <= mem_in29;
			when 29 => ro_data_out <= mem_in30;
			when 30 => ro_data_out <= mem_in31;
			when 31 => ro_data_out <= mem_in32;
		end case;

		mem_out1  <= mem_in1;
		mem_out2  <= mem_in2;
		mem_out3  <= mem_in3;
		mem_out4  <= mem_in4;
		mem_out5  <= mem_in5;
		mem_out6  <= mem_in6;
		mem_out7  <= mem_in7;
		mem_out8  <= mem_in8;
		mem_out9  <= mem_in9;
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

		if (rw_we = '1') then
			case to_integer(unsigned(rw_addr)) is
				when 0  => mem_out1 <= rw_data_in;
				when 1  => mem_out1 <= rw_data_in;
				when 2  => mem_out1 <= rw_data_in;
				when 3  => mem_out1 <= rw_data_in;
				when 4  => mem_out1 <= rw_data_in;
				when 5  => mem_out1 <= rw_data_in;
				when 6  => mem_out1 <= rw_data_in;
				when 7  => mem_out1 <= rw_data_in;
				when 8  => mem_out1 <= rw_data_in;
				when 9  => mem_out1 <= rw_data_in;
				when 10 => mem_out1 <= rw_data_in;
				when 11 => mem_out1 <= rw_data_in;
				when 12 => mem_out1 <= rw_data_in;
				when 13 => mem_out1 <= rw_data_in;
				when 14 => mem_out1 <= rw_data_in;
				when 15 => mem_out1 <= rw_data_in;
				when 16 => mem_out1 <= rw_data_in;
				when 17 => mem_out1 <= rw_data_in;
				when 18 => mem_out1 <= rw_data_in;
				when 19 => mem_out1 <= rw_data_in;
				when 20 => mem_out1 <= rw_data_in;
				when 21 => mem_out1 <= rw_data_in;
				when 22 => mem_out1 <= rw_data_in;
				when 23 => mem_out1 <= rw_data_in;
				when 24 => mem_out1 <= rw_data_in;
				when 25 => mem_out1 <= rw_data_in;
				when 26 => mem_out1 <= rw_data_in;
				when 27 => mem_out1 <= rw_data_in;
				when 28 => mem_out1 <= rw_data_in;
				when 29 => mem_out1 <= rw_data_in;
				when 30 => mem_out1 <= rw_data_in;
				when 31 => mem_out1 <= rw_data_in;

			end case;

			rw_data_out <= rw_data_in;

			if (rw_addr = ro_addr) then
				ro_data_out <= rw_data_in;
			end if;
		end if;
	end process;
end sramdp32_comb_arch;