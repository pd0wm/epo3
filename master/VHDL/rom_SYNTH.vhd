
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of rom is

   component rom_mux24
      port( data_1, data_2 : in std_logic_vector (3 downto 0);  selector : in 
            std_logic;  output : out std_logic_vector (3 downto 0));
   end component;
   
   component rom_mux44
      port( data_1, data_2, data_3, data_4 : in std_logic_vector (3 downto 0); 
            selector : in std_logic_vector (1 downto 0);  output : out 
            std_logic_vector (3 downto 0));
   end component;
   
   signal X_Logic1_port, X_Logic0_port, type2northsouth_3_port, 
      type2northsouth_2_port, type2northsouth_1_port, type2northsouth_0_port, 
      type2eastwest_3_port, type2eastwest_2_port, type2eastwest_1_port, 
      type2eastwest_0_port, type3north_3_port, type3north_2_port, 
      type3north_1_port, type3north_0_port, type3east_3_port, type3east_2_port,
      type3east_1_port, type3east_0_port, type3south_3_port, type3south_2_port,
      type3south_1_port, type3south_0_port, type3west_3_port, type3west_2_port,
      type3west_1_port, type3west_0_port, type4north_3_port, type4north_2_port,
      type4north_1_port, type4north_0_port, type4east_3_port, type4east_2_port,
      type4east_1_port, type4east_0_port, type4south_3_port, type4south_2_port,
      type4south_1_port, type4south_0_port, type4west_3_port, type4west_2_port,
      type4west_1_port, type4west_0_port, type5north_3_port, type5north_2_port,
      type5north_1_port, type5north_0_port, type5east_3_port, type5east_2_port,
      type5east_1_port, type5east_0_port, type5south_3_port, type5south_2_port,
      type5south_1_port, type5south_0_port, type5west_3_port, type5west_2_port,
      type5west_1_port, type5west_0_port, type6north_3_port, type6north_2_port,
      type6north_1_port, type6north_0_port, type6east_3_port, type6east_2_port,
      type6east_1_port, type6east_0_port, type6south_3_port, type6south_2_port,
      type6south_1_port, type6south_0_port, type6west_3_port, type6west_2_port,
      type6west_1_port, type6west_0_port, type7north_3_port, type7north_2_port,
      type7north_1_port, type7north_0_port, type7east_3_port, type7east_2_port,
      type7east_1_port, type7east_0_port, type7south_3_port, type7south_2_port,
      type7south_1_port, type7south_0_port, type7west_3_port, type7west_2_port,
      type7west_1_port, type7west_0_port, type1_3_port, type1_2_port, 
      type1_1_port, type1_0_port, type2_3_port, type2_2_port, type2_1_port, 
      type2_0_port, type3_3_port, type3_2_port, type3_1_port, type3_0_port, 
      type4_3_port, type4_2_port, type4_1_port, type4_0_port, type5_3_port, 
      type5_2_port, type5_1_port, type5_0_port, type6_3_port, type6_2_port, 
      type6_1_port, type6_0_port, type7_3_port, type7_2_port, type7_1_port, 
      type7_0_port, sub_data_1_3_port, sub_data_1_2_port, sub_data_1_1_port, 
      sub_data_1_0_port, sub_data_2_3_port, sub_data_2_2_port, 
      sub_data_2_1_port, sub_data_2_0_port : std_logic;

begin
   
   ptype2northsouth : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2)
                           => X_Logic1_port, data_1(1) => X_Logic0_port, 
                           data_1(0) => X_Logic0_port, data_2(3) => 
                           X_Logic0_port, data_2(2) => X_Logic1_port, data_2(1)
                           => X_Logic0_port, data_2(0) => X_Logic1_port, 
                           data_3(3) => X_Logic0_port, data_3(2) => 
                           X_Logic1_port, data_3(1) => X_Logic1_port, data_3(0)
                           => X_Logic0_port, data_4(3) => X_Logic0_port, 
                           data_4(2) => X_Logic1_port, data_4(1) => 
                           X_Logic1_port, data_4(0) => X_Logic1_port, 
                           selector(1) => addr(1), selector(0) => addr(0), 
                           output(3) => type2northsouth_3_port, output(2) => 
                           type2northsouth_2_port, output(1) => 
                           type2northsouth_1_port, output(0) => 
                           type2northsouth_0_port);
   ptype2eastwest : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) 
                           => X_Logic0_port, data_1(1) => X_Logic0_port, 
                           data_1(0) => X_Logic0_port, data_2(3) => 
                           X_Logic0_port, data_2(2) => X_Logic1_port, data_2(1)
                           => X_Logic0_port, data_2(0) => X_Logic0_port, 
                           data_3(3) => X_Logic1_port, data_3(2) => 
                           X_Logic0_port, data_3(1) => X_Logic0_port, data_3(0)
                           => X_Logic0_port, data_4(3) => X_Logic1_port, 
                           data_4(2) => X_Logic1_port, data_4(1) => 
                           X_Logic0_port, data_4(0) => X_Logic0_port, 
                           selector(1) => addr(1), selector(0) => addr(0), 
                           output(3) => type2eastwest_3_port, output(2) => 
                           type2eastwest_2_port, output(1) => 
                           type2eastwest_1_port, output(0) => 
                           type2eastwest_0_port);
   ptype3north : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic1_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic1_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type3north_3_port, output(2) => type3north_2_port, 
                           output(1) => type3north_1_port, output(0) => 
                           type3north_0_port);
   ptype3east : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type3east_3_port, output(2) => type3east_2_port, 
                           output(1) => type3east_1_port, output(0) => 
                           type3east_0_port);
   ptype3south : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic1_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type3south_3_port, output(2) => type3south_2_port, 
                           output(1) => type3south_1_port, output(0) => 
                           type3south_0_port);
   ptype3west : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic1_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic1_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type3west_3_port, output(2) => type3west_2_port, 
                           output(1) => type3west_1_port, output(0) => 
                           type3west_0_port);
   ptype4north : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic1_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic1_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic1_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type4north_3_port, output(2) => type4north_2_port, 
                           output(1) => type4north_1_port, output(0) => 
                           type4north_0_port);
   ptype4east : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic1_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type4east_3_port, output(2) => type4east_2_port, 
                           output(1) => type4east_1_port, output(0) => 
                           type4east_0_port);
   ptype4south : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic1_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic1_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type4south_3_port, output(2) => type4south_2_port, 
                           output(1) => type4south_1_port, output(0) => 
                           type4south_0_port);
   ptype4west : rom_mux44 port map( data_1(3) => X_Logic1_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic1_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type4west_3_port, output(2) => type4west_2_port, 
                           output(1) => type4west_1_port, output(0) => 
                           type4west_0_port);
   ptype5north : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic1_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type5north_3_port, output(2) => type5north_2_port, 
                           output(1) => type5north_1_port, output(0) => 
                           type5north_0_port);
   ptype5east : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type5east_3_port, output(2) => type5east_2_port, 
                           output(1) => type5east_1_port, output(0) => 
                           type5east_0_port);
   ptype5south : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic1_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic1_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type5south_3_port, output(2) => type5south_2_port, 
                           output(1) => type5south_1_port, output(0) => 
                           type5south_0_port);
   ptype5west : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic1_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic1_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type5west_3_port, output(2) => type5west_2_port, 
                           output(1) => type5west_1_port, output(0) => 
                           type5west_0_port);
   ptype6north : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic1_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic1_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type6north_3_port, output(2) => type6north_2_port, 
                           output(1) => type6north_1_port, output(0) => 
                           type6north_0_port);
   ptype6east : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type6east_3_port, output(2) => type6east_2_port, 
                           output(1) => type6east_1_port, output(0) => 
                           type6east_0_port);
   ptype6south : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic1_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic1_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type6south_3_port, output(2) => type6south_2_port, 
                           output(1) => type6south_1_port, output(0) => 
                           type6south_0_port);
   ptype6west : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic1_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic1_port, data_4(2)
                           => X_Logic0_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type6west_3_port, output(2) => type6west_2_port, 
                           output(1) => type6west_1_port, output(0) => 
                           type6west_0_port);
   ptype7north : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic1_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type7north_3_port, output(2) => type7north_2_port, 
                           output(1) => type7north_1_port, output(0) => 
                           type7north_0_port);
   ptype7east : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic1_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic1_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type7east_3_port, output(2) => type7east_2_port, 
                           output(1) => type7east_1_port, output(0) => 
                           type7east_0_port);
   ptype7south : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic1_port, 
                           data_4(0) => X_Logic0_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type7south_3_port, output(2) => type7south_2_port, 
                           output(1) => type7south_1_port, output(0) => 
                           type7south_0_port);
   ptype7west : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic1_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic1_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic0_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic0_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic1_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => 
                           type7west_3_port, output(2) => type7west_2_port, 
                           output(1) => type7west_1_port, output(0) => 
                           type7west_0_port);
   ptype1 : rom_mux44 port map( data_1(3) => X_Logic0_port, data_1(2) => 
                           X_Logic0_port, data_1(1) => X_Logic0_port, data_1(0)
                           => X_Logic0_port, data_2(3) => X_Logic0_port, 
                           data_2(2) => X_Logic0_port, data_2(1) => 
                           X_Logic0_port, data_2(0) => X_Logic1_port, data_3(3)
                           => X_Logic0_port, data_3(2) => X_Logic1_port, 
                           data_3(1) => X_Logic0_port, data_3(0) => 
                           X_Logic0_port, data_4(3) => X_Logic0_port, data_4(2)
                           => X_Logic1_port, data_4(1) => X_Logic0_port, 
                           data_4(0) => X_Logic1_port, selector(1) => addr(1), 
                           selector(0) => addr(0), output(3) => type1_3_port, 
                           output(2) => type1_2_port, output(1) => type1_1_port
                           , output(0) => type1_0_port);
   ptype2 : rom_mux24 port map( data_1(3) => type2northsouth_3_port, data_1(2) 
                           => type2northsouth_2_port, data_1(1) => 
                           type2northsouth_1_port, data_1(0) => 
                           type2northsouth_0_port, data_2(3) => 
                           type2eastwest_3_port, data_2(2) => 
                           type2eastwest_2_port, data_2(1) => 
                           type2eastwest_1_port, data_2(0) => 
                           type2eastwest_0_port, selector => addr(2), output(3)
                           => type2_3_port, output(2) => type2_2_port, 
                           output(1) => type2_1_port, output(0) => type2_0_port
                           );
   ptype3 : rom_mux44 port map( data_1(3) => type3north_3_port, data_1(2) => 
                           type3north_2_port, data_1(1) => type3north_1_port, 
                           data_1(0) => type3north_0_port, data_2(3) => 
                           type3east_3_port, data_2(2) => type3east_2_port, 
                           data_2(1) => type3east_1_port, data_2(0) => 
                           type3east_0_port, data_3(3) => type3south_3_port, 
                           data_3(2) => type3south_2_port, data_3(1) => 
                           type3south_1_port, data_3(0) => type3south_0_port, 
                           data_4(3) => type3west_3_port, data_4(2) => 
                           type3west_2_port, data_4(1) => type3west_1_port, 
                           data_4(0) => type3west_0_port, selector(1) => 
                           addr(3), selector(0) => addr(2), output(3) => 
                           type3_3_port, output(2) => type3_2_port, output(1) 
                           => type3_1_port, output(0) => type3_0_port);
   ptype4 : rom_mux44 port map( data_1(3) => type4north_3_port, data_1(2) => 
                           type4north_2_port, data_1(1) => type4north_1_port, 
                           data_1(0) => type4north_0_port, data_2(3) => 
                           type4east_3_port, data_2(2) => type4east_2_port, 
                           data_2(1) => type4east_1_port, data_2(0) => 
                           type4east_0_port, data_3(3) => type4south_3_port, 
                           data_3(2) => type4south_2_port, data_3(1) => 
                           type4south_1_port, data_3(0) => type4south_0_port, 
                           data_4(3) => type4west_3_port, data_4(2) => 
                           type4west_2_port, data_4(1) => type4west_1_port, 
                           data_4(0) => type4west_0_port, selector(1) => 
                           addr(3), selector(0) => addr(2), output(3) => 
                           type4_3_port, output(2) => type4_2_port, output(1) 
                           => type4_1_port, output(0) => type4_0_port);
   ptype5 : rom_mux44 port map( data_1(3) => type5north_3_port, data_1(2) => 
                           type5north_2_port, data_1(1) => type5north_1_port, 
                           data_1(0) => type5north_0_port, data_2(3) => 
                           type5east_3_port, data_2(2) => type5east_2_port, 
                           data_2(1) => type5east_1_port, data_2(0) => 
                           type5east_0_port, data_3(3) => type5south_3_port, 
                           data_3(2) => type5south_2_port, data_3(1) => 
                           type5south_1_port, data_3(0) => type5south_0_port, 
                           data_4(3) => type5west_3_port, data_4(2) => 
                           type5west_2_port, data_4(1) => type5west_1_port, 
                           data_4(0) => type5west_0_port, selector(1) => 
                           addr(3), selector(0) => addr(2), output(3) => 
                           type5_3_port, output(2) => type5_2_port, output(1) 
                           => type5_1_port, output(0) => type5_0_port);
   ptype6 : rom_mux44 port map( data_1(3) => type6north_3_port, data_1(2) => 
                           type6north_2_port, data_1(1) => type6north_1_port, 
                           data_1(0) => type6north_0_port, data_2(3) => 
                           type6east_3_port, data_2(2) => type6east_2_port, 
                           data_2(1) => type6east_1_port, data_2(0) => 
                           type6east_0_port, data_3(3) => type6south_3_port, 
                           data_3(2) => type6south_2_port, data_3(1) => 
                           type6south_1_port, data_3(0) => type6south_0_port, 
                           data_4(3) => type6west_3_port, data_4(2) => 
                           type6west_2_port, data_4(1) => type6west_1_port, 
                           data_4(0) => type6west_0_port, selector(1) => 
                           addr(3), selector(0) => addr(2), output(3) => 
                           type6_3_port, output(2) => type6_2_port, output(1) 
                           => type6_1_port, output(0) => type6_0_port);
   ptype7 : rom_mux44 port map( data_1(3) => type7north_3_port, data_1(2) => 
                           type7north_2_port, data_1(1) => type7north_1_port, 
                           data_1(0) => type7north_0_port, data_2(3) => 
                           type7east_3_port, data_2(2) => type7east_2_port, 
                           data_2(1) => type7east_1_port, data_2(0) => 
                           type7east_0_port, data_3(3) => type7south_3_port, 
                           data_3(2) => type7south_2_port, data_3(1) => 
                           type7south_1_port, data_3(0) => type7south_0_port, 
                           data_4(3) => type7west_3_port, data_4(2) => 
                           type7west_2_port, data_4(1) => type7west_1_port, 
                           data_4(0) => type7west_0_port, selector(1) => 
                           addr(3), selector(0) => addr(2), output(3) => 
                           type7_3_port, output(2) => type7_2_port, output(1) 
                           => type7_1_port, output(0) => type7_0_port);
   subresult1 : rom_mux44 port map( data_1(3) => type1_3_port, data_1(2) => 
                           type1_2_port, data_1(1) => type1_1_port, data_1(0) 
                           => type1_0_port, data_2(3) => type2_3_port, 
                           data_2(2) => type2_2_port, data_2(1) => type2_1_port
                           , data_2(0) => type2_0_port, data_3(3) => 
                           type3_3_port, data_3(2) => type3_2_port, data_3(1) 
                           => type3_1_port, data_3(0) => type3_0_port, 
                           data_4(3) => type4_3_port, data_4(2) => type4_2_port
                           , data_4(1) => type4_1_port, data_4(0) => 
                           type4_0_port, selector(1) => addr(5), selector(0) =>
                           addr(4), output(3) => sub_data_1_3_port, output(2) 
                           => sub_data_1_2_port, output(1) => sub_data_1_1_port
                           , output(0) => sub_data_1_0_port);
   subresult2 : rom_mux44 port map( data_1(3) => type5_3_port, data_1(2) => 
                           type5_2_port, data_1(1) => type5_1_port, data_1(0) 
                           => type5_0_port, data_2(3) => type6_3_port, 
                           data_2(2) => type6_2_port, data_2(1) => type6_1_port
                           , data_2(0) => type6_0_port, data_3(3) => 
                           type7_3_port, data_3(2) => type7_2_port, data_3(1) 
                           => type7_1_port, data_3(0) => type7_0_port, 
                           data_4(3) => X_Logic0_port, data_4(2) => 
                           X_Logic0_port, data_4(1) => X_Logic0_port, data_4(0)
                           => X_Logic0_port, selector(1) => addr(5), 
                           selector(0) => addr(4), output(3) => 
                           sub_data_2_3_port, output(2) => sub_data_2_2_port, 
                           output(1) => sub_data_2_1_port, output(0) => 
                           sub_data_2_0_port);
   result : rom_mux24 port map( data_1(3) => sub_data_1_3_port, data_1(2) => 
                           sub_data_1_2_port, data_1(1) => sub_data_1_1_port, 
                           data_1(0) => sub_data_1_0_port, data_2(3) => 
                           sub_data_2_3_port, data_2(2) => sub_data_2_2_port, 
                           data_2(1) => sub_data_2_1_port, data_2(0) => 
                           sub_data_2_0_port, selector => addr(6), output(3) =>
                           data(3), output(2) => data(2), output(1) => data(1),
                           output(0) => data(0));
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';

end synthesised;



