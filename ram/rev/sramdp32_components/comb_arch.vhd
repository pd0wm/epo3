library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

architecture sramdp32_comb_arch of sramdp32_comb is
begin
	process(rw_addr, ro_addr, rw_data_in, rw_we, mem_in1, mem_in2, mem_in3, mem_in4, mem_in5, mem_in6, mem_in7, mem_in8, mem_in9, mem_in10, mem_in11, mem_in12, mem_in13, mem_in14, mem_in15, mem_in16, mem_in17, mem_in18, mem_in19, mem_in20, mem_in21, mem_in22, mem_in23, mem_in24, mem_in25, mem_in26, mem_in27, mem_in28, mem_in29, mem_in30, mem_in31, mem_in32)
		variable rw_addr_int, ro_addr_int : integer range 0 to 31;
		variable mem_temp                 : mem;

	begin
		rw_addr_int := to_integer(unsigned(rw_addr));
		ro_addr_int := to_integer(unsigned(ro_addr));

		mem_temp(0 to 31) := mem_in1 & mem_in2 & mem_in3 & mem_in4 & mem_in5 & mem_in6 & mem_in7 & mem_in8 & mem_in9 & mem_in10 & mem_in11 & mem_in12 & mem_in13 & mem_in14 & mem_in15 & mem_in16 & mem_in17 & mem_in18 & mem_in19 & mem_in20 & mem_in21 & mem_in22 & mem_in23 & mem_in24 & mem_in25 & mem_in26
			& mem_in27 & mem_in28 & mem_in29 & mem_in30 & mem_in31 & mem_in32;

		rw_data_out <= mem_temp(rw_addr_int);
		ro_data_out <= mem_temp(ro_addr_int);

		if (rw_we = '1') then
			mem_temp(rw_addr_int) := rw_data_in;

			rw_data_out <= rw_data_in;

			if (rw_addr = ro_addr) then
				ro_data_out <= rw_data_in;
			end if;

		end if;

		mem_out1  <= mem_temp(0);
		mem_out2  <= mem_temp(1);
		mem_out3  <= mem_temp(2);
		mem_out4  <= mem_temp(3);
		mem_out5  <= mem_temp(4);
		mem_out6  <= mem_temp(5);
		mem_out7  <= mem_temp(6);
		mem_out8  <= mem_temp(7);
		mem_out9  <= mem_temp(8);
		mem_out10 <= mem_temp(9);
		mem_out11 <= mem_temp(10);
		mem_out12 <= mem_temp(11);
		mem_out13 <= mem_temp(12);
		mem_out14 <= mem_temp(13);
		mem_out15 <= mem_temp(14);
		mem_out16 <= mem_temp(15);
		mem_out17 <= mem_temp(16);
		mem_out18 <= mem_temp(17);
		mem_out19 <= mem_temp(18);
		mem_out20 <= mem_temp(19);
		mem_out21 <= mem_temp(20);
		mem_out22 <= mem_temp(21);
		mem_out23 <= mem_temp(22);
		mem_out24 <= mem_temp(23);
		mem_out25 <= mem_temp(24);
		mem_out26 <= mem_temp(25);
		mem_out27 <= mem_temp(26);
		mem_out28 <= mem_temp(27);
		mem_out29 <= mem_temp(28);
		mem_out30 <= mem_temp(29);
		mem_out31 <= mem_temp(30);
		mem_out32 <= mem_temp(31);
	end process;
end sramdp32_comb_arch;