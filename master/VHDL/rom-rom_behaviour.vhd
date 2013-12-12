library IEEE;
use IEEE.std_logic_1164.ALL;

architecture rom_behaviour of rom is
	signal type1, type2, type3, type4, type5, type6, type7 : std_logic_vector(3 downto 0);
	signal type2northsouth, type2eastwest : std_logic_vector(3 downto 0);
	signal type3north, type3east, type3south, type3west : std_logic_vector(3 downto 0);
	signal type4north, type4east, type4south, type4west : std_logic_vector(3 downto 0);
	signal type5north, type5east, type5south, type5west : std_logic_vector(3 downto 0);
	signal type6north, type6east, type6south, type6west : std_logic_vector(3 downto 0);
	signal type7north, type7east, type7south, type7west : std_logic_vector(3 downto 0);
	signal sub_data_1, sub_data_2 : std_logic_vector(3 downto 0);

	component rom_mux44 is
   	port(data_1			:IN   std_logic_vector(3 downto 0);
	     data_2			:IN   std_logic_vector(3 downto 0);
	     data_3			:IN   std_logic_vector(3 downto 0);
	     data_4			:IN   std_logic_vector(3 downto 0);
	     selector			:IN   std_logic_vector(1 downto 0);
	     output			:OUT  std_logic_vector(3 downto 0));
	end component;

	component rom_mux24 is
   	port(data_1				:IN	   std_logic_vector(3 downto 0);
		 data_2			:IN	   std_logic_vector(3 downto 0);
		 selector			:IN    std_logic;
		 output			:OUT   std_logic_vector(3 downto 0));
	end component;
begin
	--ptype2north: rom_mux44 port map("0100", "0101", "0110", "0111", addr(1 downto 0), type2north);
	--ptype2east:  rom_mux44 port map("0010", "0110", "1010", "1110", addr(1 downto 0), type2east);
	--ptype2south: rom_mux44 port map("1000", "1001", "1010", "1011", addr(1 downto 0), type2south);
	--ptype2west:  rom_mux44 port map("0001", "0101", "1001", "1101", addr(1 downto 0), type2west);

	ptype2northsouth: rom_mux44 port map("0100", "0101", "0110", "0111", addr(1 downto 0), type2northsouth);
	ptype2eastwest:  rom_mux44 port map("0000", "0100", "1000", "1100", addr(1 downto 0), type2eastwest);

	ptype3north: rom_mux44 port map("0001", "0100", "0101", "0110", addr(1 downto 0), type3north);
	ptype3east:  rom_mux44 port map("0000", "0100", "0101", "1000", addr(1 downto 0), type3east);
	ptype3south: rom_mux44 port map("0000", "0001", "0010", "0101", addr(1 downto 0), type3south);
	ptype3west:  rom_mux44 port map("0001", "0101", "1001", "0100", addr(1 downto 0), type3west);

	ptype4north: rom_mux44 port map("0100", "0101", "0110", "0010", addr(1 downto 0), type4north);
	ptype4east:  rom_mux44 port map("0000", "0100", "1000", "1001", addr(1 downto 0), type4east);
	ptype4south: rom_mux44 port map("0100", "0101", "0110", "1000", addr(1 downto 0), type4south);--
	ptype4west:  rom_mux44 port map("1001", "0101", "0001", "0000", addr(1 downto 0), type4west);

	ptype5north: rom_mux44 port map("0000", "0100", "0101", "0110", addr(1 downto 0), type5north);
	ptype5east:  rom_mux44 port map("0000", "0001", "0100", "1000", addr(1 downto 0), type5east);--
	ptype5south: rom_mux44 port map("0000", "0001", "0010", "0110", addr(1 downto 0), type5south);
	ptype5west:  rom_mux44 port map("0001", "0101", "1001", "1000", addr(1 downto 0), type5west);--

	ptype6north: rom_mux44 port map("0001", "0010", "0100", "0101", addr(1 downto 0), type6north);
	ptype6east:  rom_mux44 port map("0000", "0100", "0101", "1001", addr(1 downto 0), type6east);
	ptype6south: rom_mux44 port map("0001", "0010", "0100", "0101", addr(1 downto 0), type6south);
	ptype6west:  rom_mux44 port map("0000", "0100", "0101", "1001", addr(1 downto 0), type6west);

	ptype7north: rom_mux44 port map("0000", "0001", "0101", "0110", addr(1 downto 0), type7north);
	ptype7east:  rom_mux44 port map("0100", "1000", "0001", "0101", addr(1 downto 0), type7east);
	ptype7south: rom_mux44 port map("0000", "0001", "0101", "0110", addr(1 downto 0), type7south);
	ptype7west:  rom_mux44 port map("0100", "1000", "0001", "0101", addr(1 downto 0), type7west);

	ptype1: rom_mux44 port map("0000", "0001", "0100", "0101", addr(1 downto 0), type1);
	ptype2: rom_mux24 port map(type2northsouth, type2eastwest, addr(2), type2);
	ptype3: rom_mux44 port map(type3north, type3east, type3south, type3west, addr(3 downto 2), type3);
	ptype4: rom_mux44 port map(type4north, type4east, type4south, type4west, addr(3 downto 2), type4);
	ptype5: rom_mux44 port map(type5north, type5east, type5south, type5west, addr(3 downto 2), type5);
	ptype6: rom_mux44 port map(type6north, type6east, type6south, type6west, addr(3 downto 2), type6);
	ptype7: rom_mux44 port map(type7north, type7east, type7south, type7west, addr(3 downto 2), type7);
	
	subresult1: rom_mux44 port map(type1, type2, type3, type4, addr(5 downto 4), sub_data_1);
	subresult2: rom_mux44 port map(type5, type6, type7, "0000", addr(5 downto 4), sub_data_2);
	result: rom_mux24 port map(sub_data_1, sub_data_2, addr(6), data);
end rom_behaviour;


