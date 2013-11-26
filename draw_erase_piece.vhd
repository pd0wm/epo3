library ieee;
use ieee.std_logic_1164.all;
<<<<<<< HEAD
entity draw_erase_piece is
	port(
		clk         : in    std_logic;
		rst         : in    std_logic;
=======
entity depiece is
    port(
        clk        : in    std_logic;
        rst        : in    std_logic;
>>>>>>> 80d008765584500d557cd8d96cd5f9743a0167ee

		mask        : in    std_logic_vector(7 downto 0);
		mask_select : out   std_logic_vector(2 downto 0);

		draw_erase  : in    std_logic;  --draw = 1, erase = 0
		ready       : out   std_logic;
		start       : in    std_logic;

<<<<<<< HEAD
		write       : out   std_logic;
		addr        : out   std_logic_vector(7 downto 0);
		data        : inout std_logic
	);
end draw_erase_piece;
=======

        write      : out   std_logic;
        addr       : out   std_logic_vector(7 downto 0);
        data       : inout std_logic
    );
end depiece;
>>>>>>> 80d008765584500d557cd8d96cd5f9743a0167ee


