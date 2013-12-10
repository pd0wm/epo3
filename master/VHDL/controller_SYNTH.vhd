
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal lut_next_piece_port, cur_state_6_port, cur_state_5_port, 
      cur_state_4_port, cur_state_3_port, cur_state_2_port, cur_state_1_port, 
      cur_state_0_port, cur_future_piece_2_port, cur_future_piece_1_port, 
      cur_future_piece_0_port, cur_piece_2_port, cur_piece_1_port, 
      cur_piece_0_port, cur_x_2_port, cur_x_1_port, cur_x_0_port, 
      cur_x_new_2_port, cur_x_new_1_port, cur_x_new_0_port, cur_y_3_port, 
      cur_y_2_port, cur_y_1_port, cur_y_0_port, cur_y_new_3_port, 
      cur_y_new_2_port, cur_y_new_1_port, cur_y_new_0_port, cur_rot_1_port, 
      cur_rot_0_port, cur_rot_new_1_port, cur_rot_new_0_port, cur_lut_x_2_port,
      cur_lut_x_1_port, cur_lut_x_0_port, cur_lut_y_3_port, cur_lut_y_2_port, 
      cur_lut_y_1_port, cur_lut_y_0_port, cur_lut_rot_1_port, 
      cur_lut_rot_0_port, cur_lut_piece_type_2_port, cur_lut_piece_type_1_port,
      cur_lut_piece_type_0_port, cur_new_piece, cur_check_start, 
      cur_draw_erase_draw, cur_draw_erase_start, cur_clear_shift_start, 
      cur_draw_score_draw, cur_timer_1_time_7_port, cur_timer_1_time_6_port, 
      cur_timer_1_time_5_port, cur_timer_1_time_4_port, cur_timer_1_time_3_port
      , cur_timer_1_time_2_port, cur_timer_1_time_1_port, 
      cur_timer_1_time_0_port, cur_timer_1_start, cur_timer_1_reset, 
      inv_inputs_7_port, inv_inputs_6_port, inv_inputs_5_port, 
      inv_inputs_4_port, inv_inputs_3_port, inv_inputs_2_port, 
      inv_inputs_1_port, inv_inputs_0_port, n159, n166, n492, n509, n516, n527,
      n576, n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823, n1824, 
      n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832, n1833, n1834, 
      n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842, n1843, n1844, 
      n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853, n1854, 
      n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863, n1864, 
      n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872, n1876, n1877, 
      n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887, 
      n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897, 
      n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907, 
      n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917, 
      n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, 
      n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937, 
      n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947, 
      n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957, 
      n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967, 
      n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977, 
      n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987, 
      n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997, 
      n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007, 
      n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017, 
      n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026, n2027, 
      n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037, 
      n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047, 
      n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057, 
      n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067, 
      n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077, 
      n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087, 
      n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097, 
      n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107, 
      n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117, 
      n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127, 
      n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137, 
      n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147, 
      n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157, 
      n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167, 
      n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177, 
      n2178, n2179, n2180, n2181, n2182, n2183, n2184, n2185, n2186, n2187, 
      n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195, n2196, n2197, 
      n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205, n2206, n2207, 
      n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215, n2216, n2217, 
      n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225, n2226, n2227, 
      n2228, n2229, n2230, n2231, n2232, n2233, n2234, n2235, n2236, n2237, 
      n2238, n2239, n2240, n2241, n2242, n2243, n2244, n2245, n2246, n2247, 
      n2248, n2249, n2250, n2251, n2252, n2253, n2254, n2255, n2256, n2257, 
      n2258, n2259, n2260, n2261, n2262, n2263, n2264, n2265, n2266, n2267, 
      n2268, n2269, n2270, n2271, n2272, n2273, n2274, n2275, n2276, n2277, 
      n2278, n2279, n2280, n2281, n2282, n2283, n2284, n2285, n2286, n2287, 
      n2288, n2289, n2290, n2291, n2292, n2293, n2294, n2295, n2296, n2297, 
      n2298, n2299, n2300, n2301, n2302, n2303, n2304, n2305, n2306, n2307, 
      n2308, n2309, n2310, n2311, n2312, n2313, n2314, n2315, n2316, n2317, 
      n2318, n2319, n2320, n2321, n2322, n2323, n2324, n2325, n2326, n2327, 
      n2328, n2329, n2330, n2331, n2332, n2333, n2334, n2335, n2336, n2337, 
      n2338, n2339, n2340, n2341, n2342, n2343, n2344, n2345, n2346, n2347, 
      n2348, n2349, n2350, n2351, n2352, n2353, n2354, n2355, n2356, n2357, 
      n2358, n2359, n2360, n2361, n2362, n2363, n2364, n2365, n2366, n2367, 
      n2368, n2369, n2370, n2371, n2372, n2373, n2374, n2375, n2376, n2377, 
      n2378, n2379, n2380, n2381, n2382, n2383, n2384, n2385, n2386, n2387, 
      n2388, n2389, n2390, n2391, n2392, n2393, n2394, n2395, n2396, n2397, 
      n2398, n2399, n2400, n2401, n2402, n2403, n2404, n2405, n2406, n2407, 
      n2408, n2409, n2410, n2411, n2412, n2413, n2414, n2415, n2416, n2417, 
      n2418, n2419, n2420, n2421, n2422, n2423, n2424, n2425, n2426, n2427, 
      n2428, n2429, n2430, n2431, n2432, n2433, n2434, n2435, n2436, n2437, 
      n2438, n2439, n2440, n2441, n2442, n2443, n2444, n2445, n2446, n2447, 
      n2448, n2449, n2450, n2451, n2452, n2453, n2454, n2455, n2456, n2457, 
      n2458, n2459, n2460, n2461, n2462, n2463, n2464, n2465, n2466, n2467, 
      n2468, n2469, n2470, n2471, n2472, n2473, n2474, n2475, n2476, n2477, 
      n2478, n2479, n2480, n2481, n2482, n2483, n2484, n2485, n2486, n2487, 
      n2488, n2489, n2490, n2491, n2492, n2493, n2494, n2495, n2496, n2497, 
      n2498, n2499, n2500, n2501, n2502, n2503, n2504, n2505, n2506, n2507, 
      n2508, n2509, n2510, n2511, n2512, n2513, n2514, n2515, n2516, n2517, 
      n2518, n2519, n2520, n2521, n2522, n2523, n2524, n2525, n2526, n2527, 
      n2528, n2529, n2530, n2531, n2532, n2533, n2534, n2535, n2536, n2537, 
      n2538, n2539, n2540, n2541, n2542, n2543, n2544, n2545, n2546, n2547, 
      n2548, n2549, n2550, n2551, n2552, n2553, n2554, n2555, n2556, n2557, 
      n2558, n2559, n2560, n2561, n2562, n2563, n2564, n2565, n2566, n2567, 
      n2568, n2569, n2570, n2571, n2572, n2573, n2574, n2575, n2576, n2577, 
      n2578, n2579, n2580, n2581, n2582, n2583, n2584, n2585, n2586, n2587, 
      n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595, n2596, n2597, 
      n2598, n2599, n2600, n2601, n2602, n2603, n2604, n2605, n2606, n2607, 
      n2608, n2609, n2610, n2611, n2612, n2613, n2614, n2615, n2616, n2617, 
      n2618, n2619, n2620, n2621, n2622, n2623, n2624, n2625, n2626, n2627, 
      n2628, n2629, n2630, n2631, n2632, n2633, n2634, n2635, n2636, n2637, 
      n2638, n2639, n2640, n2641, n2642, n2643, n2644, n2645, n2646, n2647, 
      n2648, n2649, n2650, n2651, n2652, n2653, n2654, n2655, n2656, n2657, 
      n2658, n2659, n2660, n2661, n2662, n2663, n2664, n2665, n2666, n2667, 
      n2668, n2669, n2670, n2671, n2672, n2673, n2674, n2675, n2676, n2677, 
      n2678, n2679, n2680, n2681, n2682, n2683, n2684, n2685, n2686, n2687, 
      n2688, n2689, n2690, n2691, n2692, n2693, n2694, n2695, n2696, n2697, 
      n2698, n2699, n2700, n2701, n2702, n2703, n2704, n2705, n2706, n2707, 
      n2708, n2709, n2710, n2711, n2712, n2713, n2714, n2715, n2716, n2717, 
      n2718, n2719, n2720, n2721, n2722, n2723, n2724, n2725, n2726, n2727, 
      n2728, n2729, n2730, n2731, n2732, n2733, n2734, n2735, n2736, n2737, 
      n2738, n2739, n2740, n2741, n2742, n2743, n2744, n2745, n2746, n2747, 
      n2748, n2749, n2750, n2751, n2752, n2753 : std_logic;

begin
   lut_next_piece <= lut_next_piece_port;
   
   inv_inputs_reg_7_inst : dfn10 port map( D => n1872, CK => clk, Q => 
                           inv_inputs_7_port);
   inv_inputs_reg_6_inst : dfn10 port map( D => n1871, CK => clk, Q => 
                           inv_inputs_6_port);
   inv_inputs_reg_5_inst : dfn10 port map( D => n1870, CK => clk, Q => 
                           inv_inputs_5_port);
   inv_inputs_reg_4_inst : dfn10 port map( D => n1869, CK => clk, Q => 
                           inv_inputs_4_port);
   inv_inputs_reg_3_inst : dfn10 port map( D => n1868, CK => clk, Q => 
                           inv_inputs_3_port);
   inv_inputs_reg_2_inst : dfn10 port map( D => n1867, CK => clk, Q => 
                           inv_inputs_2_port);
   inv_inputs_reg_1_inst : dfn10 port map( D => n1866, CK => clk, Q => 
                           inv_inputs_1_port);
   inv_inputs_reg_0_inst : dfn10 port map( D => n1865, CK => clk, Q => 
                           inv_inputs_0_port);
   cur_timer_1_time_reg_0_inst : dfn10 port map( D => n1864, CK => clk, Q => 
                           cur_timer_1_time_0_port);
   cur_state_reg_3_inst : dfr11 port map( D => n516, R => rst, CK => clk, Q => 
                           cur_state_3_port);
   cur_state_reg_2_inst : dfr11 port map( D => n576, R => rst, CK => clk, Q => 
                           cur_state_2_port);
   cur_state_reg_5_inst : dfr11 port map( D => n527, R => rst, CK => clk, Q => 
                           cur_state_5_port);
   cur_state_reg_1_inst : dfr11 port map( D => n509, R => rst, CK => clk, Q => 
                           cur_state_1_port);
   cur_state_reg_0_inst : dfr11 port map( D => n492, R => rst, CK => clk, Q => 
                           cur_state_0_port);
   cur_timer_1_time_reg_1_inst : dfn10 port map( D => n1863, CK => clk, Q => 
                           cur_timer_1_time_1_port);
   cur_state_reg_4_inst : dfr11 port map( D => n159, R => rst, CK => clk, Q => 
                           cur_state_4_port);
   cur_state_reg_6_inst : dfr11 port map( D => n166, R => rst, CK => clk, Q => 
                           cur_state_6_port);
   cur_timer_1_time_reg_7_inst : dfn10 port map( D => n1862, CK => clk, Q => 
                           cur_timer_1_time_7_port);
   cur_timer_1_time_reg_6_inst : dfn10 port map( D => n1861, CK => clk, Q => 
                           cur_timer_1_time_6_port);
   cur_timer_1_time_reg_5_inst : dfn10 port map( D => n1860, CK => clk, Q => 
                           cur_timer_1_time_5_port);
   cur_draw_score_draw_reg : dfn10 port map( D => n1859, CK => clk, Q => 
                           cur_draw_score_draw);
   cur_rot_reg_0_inst : dfn10 port map( D => n1858, CK => clk, Q => 
                           cur_rot_0_port);
   cur_rot_new_reg_0_inst : dfn10 port map( D => n1857, CK => clk, Q => 
                           cur_rot_new_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n1856, CK => clk, Q => 
                           cur_rot_1_port);
   cur_rot_new_reg_1_inst : dfn10 port map( D => n1855, CK => clk, Q => 
                           cur_rot_new_1_port);
   cur_x_reg_0_inst : dfn10 port map( D => n1854, CK => clk, Q => cur_x_0_port)
                           ;
   cur_x_new_reg_1_inst : dfn10 port map( D => n1853, CK => clk, Q => 
                           cur_x_new_1_port);
   cur_x_reg_1_inst : dfn10 port map( D => n1852, CK => clk, Q => cur_x_1_port)
                           ;
   cur_x_new_reg_2_inst : dfn10 port map( D => n1851, CK => clk, Q => 
                           cur_x_new_2_port);
   cur_x_reg_2_inst : dfn10 port map( D => n1850, CK => clk, Q => cur_x_2_port)
                           ;
   cur_x_new_reg_0_inst : dfn10 port map( D => n1849, CK => clk, Q => 
                           cur_x_new_0_port);
   cur_new_piece_reg : dfn10 port map( D => n1848, CK => clk, Q => 
                           cur_new_piece);
   cur_timer_1_time_reg_4_inst : dfn10 port map( D => n1847, CK => clk, Q => 
                           cur_timer_1_time_4_port);
   cur_timer_1_time_reg_3_inst : dfn10 port map( D => n1846, CK => clk, Q => 
                           cur_timer_1_time_3_port);
   cur_timer_1_time_reg_2_inst : dfn10 port map( D => n1845, CK => clk, Q => 
                           cur_timer_1_time_2_port);
   cur_y_reg_0_inst : dfn10 port map( D => n1844, CK => clk, Q => cur_y_0_port)
                           ;
   cur_y_new_reg_0_inst : dfn10 port map( D => n1843, CK => clk, Q => 
                           cur_y_new_0_port);
   cur_y_new_reg_1_inst : dfn10 port map( D => n1842, CK => clk, Q => 
                           cur_y_new_1_port);
   cur_y_reg_1_inst : dfn10 port map( D => n1841, CK => clk, Q => cur_y_1_port)
                           ;
   cur_y_new_reg_2_inst : dfn10 port map( D => n1840, CK => clk, Q => 
                           cur_y_new_2_port);
   cur_y_reg_2_inst : dfn10 port map( D => n1839, CK => clk, Q => cur_y_2_port)
                           ;
   cur_y_new_reg_3_inst : dfn10 port map( D => n1838, CK => clk, Q => 
                           cur_y_new_3_port);
   cur_y_reg_3_inst : dfn10 port map( D => n1837, CK => clk, Q => cur_y_3_port)
                           ;
   cur_lut_next_piece_reg : dfn10 port map( D => n1876, CK => clk, Q => 
                           lut_next_piece_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n1877, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_2_inst : dfn10 port map( D => n1836, CK => clk, Q => 
                           cur_piece_2_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n1878, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n1835, CK => clk, Q => 
                           cur_piece_1_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n1879, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n1834, CK => clk, Q => 
                           cur_piece_0_port);
   cur_lut_piece_type_reg_2_inst : dfn10 port map( D => n1833, CK => clk, Q => 
                           cur_lut_piece_type_2_port);
   cur_lut_piece_type_reg_1_inst : dfn10 port map( D => n1832, CK => clk, Q => 
                           cur_lut_piece_type_1_port);
   cur_lut_piece_type_reg_0_inst : dfn10 port map( D => n1831, CK => clk, Q => 
                           cur_lut_piece_type_0_port);
   cur_check_start_reg : dfn10 port map( D => n1830, CK => clk, Q => 
                           cur_check_start);
   cur_lut_y_reg_3_inst : dfn10 port map( D => n1829, CK => clk, Q => 
                           cur_lut_y_3_port);
   cur_lut_y_reg_2_inst : dfn10 port map( D => n1828, CK => clk, Q => 
                           cur_lut_y_2_port);
   cur_lut_y_reg_1_inst : dfn10 port map( D => n1827, CK => clk, Q => 
                           cur_lut_y_1_port);
   cur_lut_y_reg_0_inst : dfn10 port map( D => n1826, CK => clk, Q => 
                           cur_lut_y_0_port);
   cur_lut_rot_reg_1_inst : dfn10 port map( D => n1825, CK => clk, Q => 
                           cur_lut_rot_1_port);
   cur_lut_x_reg_0_inst : dfn10 port map( D => n1824, CK => clk, Q => 
                           cur_lut_x_0_port);
   cur_lut_x_reg_1_inst : dfn10 port map( D => n1823, CK => clk, Q => 
                           cur_lut_x_1_port);
   cur_lut_x_reg_2_inst : dfn10 port map( D => n1822, CK => clk, Q => 
                           cur_lut_x_2_port);
   cur_lut_rot_reg_0_inst : dfn10 port map( D => n1821, CK => clk, Q => 
                           cur_lut_rot_0_port);
   cur_draw_erase_start_reg : dfn10 port map( D => n1820, CK => clk, Q => 
                           cur_draw_erase_start);
   cur_draw_erase_draw_reg : dfn10 port map( D => n1819, CK => clk, Q => 
                           cur_draw_erase_draw);
   cur_clear_shift_start_reg : dfn10 port map( D => n1818, CK => clk, Q => 
                           cur_clear_shift_start);
   cur_timer_1_start_reg : dfn10 port map( D => n1817, CK => clk, Q => 
                           cur_timer_1_start);
   cur_timer_1_reset_reg : dfn10 port map( D => n1816, CK => clk, Q => 
                           cur_timer_1_reset);
   U1036 : iv110 port map( A => n1889, Y => n1880);
   U1037 : iv110 port map( A => rst, Y => n1881);
   U1038 : iv110 port map( A => rst, Y => n1882);
   U1039 : iv110 port map( A => rst, Y => n1883);
   U1040 : iv110 port map( A => cur_state_1_port, Y => n1884);
   U1041 : iv110 port map( A => n1884, Y => n1885);
   U1042 : iv110 port map( A => n1949, Y => n1886);
   U1043 : iv110 port map( A => n1886, Y => n1887);
   U1044 : iv110 port map( A => cur_state_3_port, Y => n1888);
   U1045 : iv110 port map( A => n1888, Y => n1889);
   U1046 : iv110 port map( A => cur_state_5_port, Y => n1890);
   U1047 : iv110 port map( A => n1890, Y => n1891);
   U1048 : buf40 port map( A => cur_state_2_port, Y => n1892);
   U1049 : iv110 port map( A => n1893, Y => timer_1_time(7));
   U1050 : iv110 port map( A => n1894, Y => timer_1_time(6));
   U1051 : iv110 port map( A => n1895, Y => timer_1_time(5));
   U1052 : na210 port map( A => n1896, B => n1897, Y => timer_1_time(4));
   U1053 : na210 port map( A => cur_timer_1_time_4_port, B => n1898, Y => n1897
                           );
   U1054 : na210 port map( A => n1896, B => n1899, Y => timer_1_time(3));
   U1055 : na210 port map( A => cur_timer_1_time_3_port, B => n1898, Y => n1899
                           );
   U1056 : na210 port map( A => n1896, B => n1900, Y => timer_1_time(2));
   U1057 : na210 port map( A => cur_timer_1_time_2_port, B => n1898, Y => n1900
                           );
   U1058 : na210 port map( A => n1901, B => n1902, Y => timer_1_time(1));
   U1059 : na210 port map( A => n1903, B => cur_timer_1_time_1_port, Y => n1902
                           );
   U1060 : iv110 port map( A => n1904, Y => n1901);
   U1061 : na210 port map( A => n1905, B => n1906, Y => timer_1_time(0));
   U1062 : na310 port map( A => n1907, B => n1908, C => n1909, Y => n1906);
   U1063 : na210 port map( A => cur_timer_1_time_0_port, B => n1910, Y => n1905
                           );
   U1064 : na210 port map( A => n1911, B => n1912, Y => timer_1_start);
   U1065 : na210 port map( A => cur_timer_1_start, B => n1913, Y => n1912);
   U1066 : na210 port map( A => n1914, B => n1915, Y => n1911);
   U1067 : na210 port map( A => n1916, B => n1917, Y => timer_1_reset);
   U1068 : na210 port map( A => n1918, B => n1915, Y => n1917);
   U1069 : na210 port map( A => cur_timer_1_reset, B => n1919, Y => n1916);
   U1070 : na210 port map( A => n1920, B => n1921, Y => new_piece);
   U1071 : na210 port map( A => cur_new_piece, B => n1922, Y => n1921);
   U1072 : na210 port map( A => n1923, B => n1924, Y => n576);
   U1073 : na210 port map( A => n1907, B => n1925, Y => n1924);
   U1074 : na310 port map( A => n1926, B => n1927, C => n1928, Y => n1925);
   U1075 : na210 port map( A => n1929, B => n1930, Y => n1928);
   U1076 : na210 port map( A => n1931, B => n1932, Y => n1926);
   U1077 : mu111 port map( A => n1933, B => n1934, S => cur_state_3_port, Y => 
                           n1923);
   U1078 : no310 port map( A => n1935, B => n1936, C => n1937, Y => n1934);
   U1079 : no310 port map( A => n1938, B => inv_inputs_3_port, C => n1892, Y =>
                           n1937);
   U1080 : no210 port map( A => n1939, B => n1890, Y => n1935);
   U1081 : no210 port map( A => n1941, B => n1942, Y => n1939);
   U1082 : na310 port map( A => n1943, B => n1944, C => n1945, Y => n1942);
   U1083 : na210 port map( A => n1946, B => n1947, Y => n1945);
   U1084 : na210 port map( A => n1948, B => n1887, Y => n1943);
   U1085 : na310 port map( A => n1950, B => n1951, C => n1952, Y => n1941);
   U1086 : na210 port map( A => n1953, B => n1954, Y => n1952);
   U1087 : na210 port map( A => draw_erase_ready, B => n1955, Y => n1951);
   U1088 : na210 port map( A => n1956, B => n1957, Y => n1955);
   U1089 : na210 port map( A => n1931, B => n1886, Y => n1957);
   U1090 : na210 port map( A => check_empty, B => n1958, Y => n1950);
   U1091 : no310 port map( A => n1959, B => n1960, C => n1961, Y => n1933);
   U1092 : no210 port map( A => check_empty, B => n1927, Y => n1961);
   U1093 : no210 port map( A => n1892, B => n1962, Y => n1960);
   U1094 : no310 port map( A => n1963, B => n1964, C => n1965, Y => n1962);
   U1095 : no310 port map( A => n1966, B => cur_state_5_port, C => n1967, Y => 
                           n1965);
   U1096 : iv110 port map( A => n1938, Y => n1964);
   U1097 : no210 port map( A => n1968, B => n1969, Y => n1963);
   U1098 : na210 port map( A => n1970, B => n1971, Y => n1959);
   U1099 : na210 port map( A => n1972, B => n1973, Y => n1971);
   U1100 : na210 port map( A => n1974, B => n1975, Y => n1970);
   U1101 : na310 port map( A => n1976, B => n1890, C => n1977, Y => n1975);
   U1102 : na210 port map( A => check_empty, B => cur_state_1_port, Y => n1977)
                           ;
   U1103 : na310 port map( A => n1978, B => n1979, C => n1980, Y => n527);
   U1104 : no310 port map( A => n1981, B => n1982, C => n1983, Y => n1980);
   U1105 : no310 port map( A => n1984, B => n1985, C => n1890, Y => n1983);
   U1106 : no210 port map( A => n1986, B => n1969, Y => n1985);
   U1107 : na210 port map( A => n1987, B => n1988, Y => n1981);
   U1108 : na310 port map( A => n1989, B => n1990, C => n1991, Y => n1988);
   U1109 : mu111 port map( A => n1992, B => n1993, S => n1892, Y => n1991);
   U1110 : na210 port map( A => n1994, B => n1995, Y => n1992);
   U1111 : na210 port map( A => n1887, B => n1996, Y => n1994);
   U1112 : na210 port map( A => cur_state_1_port, B => n1997, Y => n1996);
   U1113 : na210 port map( A => n1998, B => n1999, Y => n1987);
   U1114 : na210 port map( A => n1929, B => n1892, Y => n1999);
   U1115 : iv110 port map( A => n2000, Y => n1979);
   U1116 : mu111 port map( A => n2001, B => n2002, S => cur_state_3_port, Y => 
                           n2000);
   U1117 : no210 port map( A => n2003, B => n2004, Y => n2002);
   U1118 : no210 port map( A => n2005, B => n2006, Y => n1978);
   U1119 : no210 port map( A => n1887, B => n2007, Y => n2006);
   U1120 : no210 port map( A => n2008, B => n1956, Y => n2005);
   U1121 : na310 port map( A => n2009, B => n2010, C => n2011, Y => n516);
   U1122 : no210 port map( A => n2012, B => n2013, Y => n2011);
   U1123 : no210 port map( A => n2014, B => n2015, Y => n2013);
   U1124 : no310 port map( A => n2016, B => n1953, C => n2017, Y => n2014);
   U1125 : no310 port map( A => n2018, B => n1949, C => n2019, Y => n2017);
   U1126 : no210 port map( A => n1892, B => n2020, Y => n2016);
   U1127 : no310 port map( A => n2018, B => n1973, C => n2021, Y => n2012);
   U1128 : na210 port map( A => n2022, B => n2023, Y => n2010);
   U1129 : mu111 port map( A => n2024, B => n2025, S => cur_state_3_port, Y => 
                           n2009);
   U1130 : no310 port map( A => n2026, B => n2027, C => n2028, Y => n2025);
   U1131 : na210 port map( A => n2029, B => n2030, Y => n2028);
   U1132 : na310 port map( A => n2031, B => n2032, C => n1989, Y => n2030);
   U1133 : na210 port map( A => n1993, B => n2033, Y => n2031);
   U1134 : na310 port map( A => n2034, B => n2035, C => n1948, Y => n2029);
   U1135 : na310 port map( A => n1927, B => n2036, C => n2037, Y => n2027);
   U1136 : na310 port map( A => n2038, B => n2039, C => n2040, Y => n2026);
   U1137 : no210 port map( A => n2041, B => n2042, Y => n2040);
   U1138 : no210 port map( A => cur_state_0_port, B => n2007, Y => n2042);
   U1139 : no210 port map( A => n2043, B => n1890, Y => n2041);
   U1140 : no310 port map( A => n2044, B => n2045, C => n2046, Y => n2043);
   U1141 : no310 port map( A => n2032, B => cur_state_4_port, C => 
                           clear_shift_ready, Y => n2046);
   U1142 : no210 port map( A => timer_1_done, B => n2047, Y => n2044);
   U1143 : na210 port map( A => n2048, B => n2049, Y => n2039);
   U1144 : na210 port map( A => n2032, B => n2019, Y => n2049);
   U1145 : na210 port map( A => cur_state_4_port, B => n2050, Y => n2038);
   U1146 : na210 port map( A => n2007, B => n2051, Y => n2050);
   U1147 : na210 port map( A => n2052, B => n1954, Y => n2051);
   U1148 : na210 port map( A => n1936, B => n2053, Y => n2024);
   U1149 : na210 port map( A => n2054, B => n2055, Y => n2053);
   U1150 : na210 port map( A => n2056, B => n2034, Y => n2055);
   U1151 : na210 port map( A => n1993, B => n2019, Y => n2054);
   U1152 : mu111 port map( A => n2057, B => n2058, S => cur_state_3_port, Y => 
                           n509);
   U1153 : na310 port map( A => n2059, B => n2060, C => n2061, Y => n2058);
   U1154 : no310 port map( A => n2062, B => n2063, C => n2064, Y => n2061);
   U1155 : no210 port map( A => n1892, B => n2065, Y => n2064);
   U1156 : no210 port map( A => n2066, B => n2067, Y => n2065);
   U1157 : no310 port map( A => n1968, B => n2068, C => n2069, Y => n2067);
   U1158 : no210 port map( A => cur_state_4_port, B => check_empty, Y => n2069)
                           ;
   U1159 : no210 port map( A => n2070, B => n2034, Y => n2068);
   U1160 : no210 port map( A => n2071, B => n1995, Y => n2066);
   U1161 : no210 port map( A => n2072, B => n2020, Y => n2063);
   U1162 : no210 port map( A => n2073, B => n1982, Y => n2072);
   U1163 : no210 port map( A => clear_shift_ready, B => n2074, Y => n2073);
   U1164 : no210 port map( A => n2075, B => n2076, Y => n2062);
   U1165 : no310 port map( A => n2077, B => n2078, C => n2079, Y => n2075);
   U1166 : no210 port map( A => n1969, B => n1954, Y => n2079);
   U1167 : iv110 port map( A => n1986, Y => n1954);
   U1168 : no210 port map( A => n2004, B => inv_inputs_4_port, Y => n1986);
   U1169 : no210 port map( A => cur_state_1_port, B => n2004, Y => n2077);
   U1170 : no210 port map( A => n2080, B => n2081, Y => n2060);
   U1171 : no310 port map( A => n2071, B => n2070, C => n2082, Y => n2081);
   U1172 : no310 port map( A => n2083, B => n2078, C => n2084, Y => n2082);
   U1173 : no210 port map( A => n1892, B => n2085, Y => n2084);
   U1174 : no210 port map( A => n1967, B => n2034, Y => n2085);
   U1175 : no210 port map( A => inv_inputs_0_port, B => cur_state_1_port, Y => 
                           n2083);
   U1176 : no210 port map( A => n2086, B => n2087, Y => n2059);
   U1177 : no210 port map( A => n2088, B => n2089, Y => n2087);
   U1178 : no210 port map( A => n2090, B => n2091, Y => n2088);
   U1179 : no210 port map( A => cur_state_5_port, B => n2078, Y => n2090);
   U1180 : no310 port map( A => n2092, B => timer_1_done, C => n2034, Y => 
                           n2086);
   U1181 : na310 port map( A => n2093, B => n2094, C => n2095, Y => n2057);
   U1182 : no310 port map( A => n2096, B => n2097, C => n2098, Y => n2095);
   U1183 : no210 port map( A => n2099, B => n2076, Y => n2098);
   U1184 : no210 port map( A => n2100, B => n1929, Y => n2099);
   U1185 : no210 port map( A => cur_state_1_port, B => check_empty, Y => n2100)
                           ;
   U1186 : no310 port map( A => n2101, B => n2071, C => n1927, Y => n2097);
   U1187 : no210 port map( A => cur_state_6_port, B => n2036, Y => n2096);
   U1188 : na310 port map( A => n2102, B => n1890, C => n1947, Y => n2036);
   U1189 : na210 port map( A => n1982, B => cur_state_1_port, Y => n2094);
   U1190 : no210 port map( A => n2103, B => n2104, Y => n2093);
   U1191 : no210 port map( A => n1892, B => n2105, Y => n2104);
   U1192 : no310 port map( A => n2106, B => n2107, C => n2108, Y => n2105);
   U1193 : no310 port map( A => n1968, B => cur_state_1_port, C => n2070, Y => 
                           n2108);
   U1194 : no210 port map( A => n2071, B => n1976, Y => n2106);
   U1195 : no210 port map( A => n2109, B => n2110, Y => n2103);
   U1196 : no310 port map( A => n2111, B => n1946, C => n2056, Y => n2109);
   U1197 : no210 port map( A => n2034, B => n2019, Y => n2111);
   U1198 : na310 port map( A => n2112, B => n2113, C => n2114, Y => n492);
   U1199 : na210 port map( A => cur_state_3_port, B => n2115, Y => n2114);
   U1200 : na310 port map( A => n2116, B => n2117, C => n2118, Y => n2115);
   U1201 : no310 port map( A => n2119, B => n2080, C => n2120, Y => n2118);
   U1202 : no310 port map( A => n2121, B => draw_erase_ready, C => 
                           cur_state_1_port, Y => n2120);
   U1203 : iv110 port map( A => n2037, Y => n2080);
   U1204 : na310 port map( A => inv_inputs_4_port, B => n1936, C => n2122, Y =>
                           n2037);
   U1205 : no210 port map( A => n2020, B => n2123, Y => n2122);
   U1206 : no210 port map( A => n2032, B => n1938, Y => n2119);
   U1207 : na210 port map( A => n1936, B => n2078, Y => n2117);
   U1208 : mu111 port map( A => n2124, B => n2125, S => cur_state_5_port, Y => 
                           n2116);
   U1209 : no310 port map( A => n2126, B => n2127, C => n2128, Y => n2125);
   U1210 : iv110 port map( A => n1944, Y => n2128);
   U1211 : na210 port map( A => n2129, B => n1974, Y => n1944);
   U1212 : na210 port map( A => timer_1_done, B => n1993, Y => n2129);
   U1213 : no210 port map( A => n1969, B => n2130, Y => n2127);
   U1214 : na310 port map( A => n2131, B => n2132, C => n2133, Y => n2126);
   U1215 : na210 port map( A => n1929, B => n2134, Y => n2133);
   U1216 : na310 port map( A => n2135, B => n2136, C => n2137, Y => n2134);
   U1217 : na210 port map( A => check_ready, B => n1947, Y => n2137);
   U1218 : na210 port map( A => n1948, B => n2004, Y => n2136);
   U1219 : na210 port map( A => n2138, B => check_empty, Y => n2135);
   U1220 : na210 port map( A => n1953, B => n2139, Y => n2132);
   U1221 : iv110 port map( A => clear_shift_ready, Y => n2139);
   U1222 : no210 port map( A => n1966, B => n2032, Y => n1953);
   U1223 : na210 port map( A => n2070, B => n1931, Y => n2131);
   U1224 : iv110 port map( A => n2140, Y => n2070);
   U1225 : mu111 port map( A => n2141, B => n2142, S => n1973, Y => n2124);
   U1226 : no210 port map( A => n2143, B => n1947, Y => n2142);
   U1227 : no210 port map( A => draw_erase_ready, B => n1892, Y => n2143);
   U1228 : na210 port map( A => n1931, B => n2033, Y => n2141);
   U1229 : no210 port map( A => n1966, B => n1892, Y => n1931);
   U1230 : na210 port map( A => n1998, B => n2144, Y => n2113);
   U1231 : na310 port map( A => n2145, B => n2146, C => n2147, Y => n2144);
   U1232 : na210 port map( A => n1974, B => n2148, Y => n2147);
   U1233 : na210 port map( A => n2078, B => n2101, Y => n2148);
   U1234 : na310 port map( A => n2149, B => n2150, C => n2151, Y => n2146);
   U1235 : no310 port map( A => n2152, B => n1892, C => n2153, Y => n2151);
   U1236 : na210 port map( A => n1967, B => n1995, Y => n2150);
   U1237 : iv110 port map( A => n1932, Y => n1967);
   U1238 : na210 port map( A => cur_state_0_port, B => n2140, Y => n2149);
   U1239 : na310 port map( A => check_empty, B => n2078, C => n1948, Y => n2145
                           );
   U1240 : na210 port map( A => n2154, B => n2155, Y => n2112);
   U1241 : na310 port map( A => n2156, B => n2157, C => n2158, Y => n2155);
   U1242 : no310 port map( A => n2159, B => n2160, C => n2161, Y => n2158);
   U1243 : no310 port map( A => n2162, B => n2163, C => n2034, Y => n2161);
   U1244 : no210 port map( A => n2164, B => n1947, Y => n2163);
   U1245 : no210 port map( A => n1892, B => n1932, Y => n2164);
   U1246 : na210 port map( A => n2140, B => n1995, Y => n2162);
   U1247 : no310 port map( A => n2018, B => inv_inputs_2_port, C => n2102, Y =>
                           n2159);
   U1248 : na210 port map( A => n1974, B => n2165, Y => n2157);
   U1249 : na310 port map( A => n2166, B => n2167, C => n2168, Y => n2165);
   U1250 : na210 port map( A => check_empty, B => cur_state_4_port, Y => n2168)
                           ;
   U1251 : na210 port map( A => n1946, B => draw_erase_ready, Y => n2166);
   U1252 : na210 port map( A => n2169, B => n2101, Y => n2156);
   U1253 : iv110 port map( A => check_ready, Y => n2101);
   U1254 : na210 port map( A => n2170, B => n2171, Y => n1879);
   U1255 : na210 port map( A => next_piece(0), B => n2172, Y => n2171);
   U1256 : na210 port map( A => cur_future_piece_0_port, B => n2173, Y => n2170
                           );
   U1257 : na210 port map( A => n2174, B => n2175, Y => n1878);
   U1258 : na210 port map( A => next_piece(1), B => n2172, Y => n2175);
   U1259 : na210 port map( A => cur_future_piece_1_port, B => n2173, Y => n2174
                           );
   U1260 : na210 port map( A => n2176, B => n2177, Y => n1877);
   U1261 : na210 port map( A => next_piece(2), B => n2172, Y => n2177);
   U1262 : no210 port map( A => n2173, B => n2178, Y => n2172);
   U1263 : iv110 port map( A => n2179, Y => n2178);
   U1264 : na210 port map( A => cur_future_piece_2_port, B => n2173, Y => n2176
                           );
   U1265 : na310 port map( A => n2180, B => n2181, C => n2182, Y => n2173);
   U1266 : no210 port map( A => n2153, B => n2183, Y => n2182);
   U1267 : no210 port map( A => n2184, B => n2015, Y => n2183);
   U1268 : no310 port map( A => n2185, B => n2160, C => n2186, Y => n2184);
   U1269 : no210 port map( A => cur_state_6_port, B => n2187, Y => n2186);
   U1270 : no210 port map( A => n2078, B => n1993, Y => n2187);
   U1271 : no210 port map( A => n2188, B => n2189, Y => n2185);
   U1272 : na210 port map( A => n1948, B => n2190, Y => n2181);
   U1273 : iv110 port map( A => n2191, Y => n2180);
   U1274 : mu111 port map( A => lut_next_piece_port, B => n2192, S => n2193, Y 
                           => n1876);
   U1275 : no310 port map( A => n2194, B => n2191, C => n2179, Y => n2193);
   U1276 : na210 port map( A => n2195, B => n2196, Y => n2179);
   U1277 : na210 port map( A => n2138, B => n2190, Y => n2196);
   U1278 : na210 port map( A => n1998, B => n1995, Y => n2195);
   U1279 : na310 port map( A => n2197, B => n2198, C => n2199, Y => n2191);
   U1280 : no210 port map( A => rst, B => n2200, Y => n2199);
   U1281 : na210 port map( A => n2022, B => n2201, Y => n2198);
   U1282 : na210 port map( A => n2167, B => n2202, Y => n2201);
   U1283 : mu111 port map( A => n1880, B => n2203, S => cur_state_6_port, Y => 
                           n2197);
   U1284 : na210 port map( A => n2204, B => n1929, Y => n2203);
   U1285 : na210 port map( A => n2205, B => n2206, Y => n2194);
   U1286 : na210 port map( A => n2153, B => n1936, Y => n2206);
   U1287 : na210 port map( A => n2022, B => n1948, Y => n2205);
   U1288 : na210 port map( A => n2207, B => n2208, Y => n2192);
   U1289 : na310 port map( A => n2107, B => n1997, C => n2022, Y => n2208);
   U1290 : na210 port map( A => n2153, B => n2204, Y => n2207);
   U1291 : iv110 port map( A => n2209, Y => n2204);
   U1292 : no210 port map( A => n2210, B => n2034, Y => n2153);
   U1293 : mu111 port map( A => n2211, B => inv_inputs_7_port, S => rst, Y => 
                           n1872);
   U1294 : iv110 port map( A => inputs(7), Y => n2211);
   U1295 : mu111 port map( A => n2212, B => inv_inputs_6_port, S => rst, Y => 
                           n1871);
   U1296 : iv110 port map( A => inputs(6), Y => n2212);
   U1297 : iv110 port map( A => n2213, Y => n1870);
   U1298 : mu111 port map( A => inputs(5), B => n2214, S => rst, Y => n2213);
   U1299 : mu111 port map( A => n2215, B => inv_inputs_4_port, S => rst, Y => 
                           n1869);
   U1300 : iv110 port map( A => inputs(4), Y => n2215);
   U1301 : mu111 port map( A => n2216, B => inv_inputs_3_port, S => rst, Y => 
                           n1868);
   U1302 : iv110 port map( A => inputs(3), Y => n2216);
   U1303 : mu111 port map( A => n2217, B => inv_inputs_2_port, S => rst, Y => 
                           n1867);
   U1304 : iv110 port map( A => inputs(2), Y => n2217);
   U1305 : iv110 port map( A => n2218, Y => n1866);
   U1306 : mu111 port map( A => inputs(1), B => n2033, S => rst, Y => n2218);
   U1307 : iv110 port map( A => n2219, Y => n1865);
   U1308 : mu111 port map( A => inputs(0), B => n2035, S => rst, Y => n2219);
   U1309 : iv110 port map( A => inv_inputs_0_port, Y => n2035);
   U1310 : na210 port map( A => n2220, B => n2221, Y => n1864);
   U1311 : na310 port map( A => n1909, B => n1907, C => n2222, Y => n2221);
   U1312 : no210 port map( A => rst, B => n2223, Y => n2222);
   U1313 : na210 port map( A => cur_timer_1_time_0_port, B => n2224, Y => n2220
                           );
   U1314 : na210 port map( A => n2225, B => n1882, Y => n2224);
   U1315 : iv110 port map( A => n1910, Y => n2225);
   U1316 : na310 port map( A => n1909, B => n2226, C => n2227, Y => n1910);
   U1317 : no310 port map( A => n2228, B => n2223, C => n2229, Y => n2227);
   U1318 : no210 port map( A => cur_state_5_port, B => n2230, Y => n2229);
   U1319 : no210 port map( A => cur_state_1_port, B => cur_state_6_port, Y => 
                           n2230);
   U1320 : iv110 port map( A => n1908, Y => n2223);
   U1321 : na210 port map( A => n1907, B => n2231, Y => n1908);
   U1322 : no210 port map( A => n2152, B => n2015, Y => n2228);
   U1323 : na210 port map( A => cur_state_4_port, B => n1888, Y => n2226);
   U1324 : na210 port map( A => n2232, B => n2233, Y => n1863);
   U1325 : na210 port map( A => cur_timer_1_time_1_port, B => n2234, Y => n2233
                           );
   U1326 : na210 port map( A => n1881, B => n1990, Y => n2234);
   U1327 : na210 port map( A => n1904, B => n1883, Y => n2232);
   U1328 : na210 port map( A => n2235, B => n2236, Y => n1904);
   U1329 : na310 port map( A => n1958, B => n2237, C => n2238, Y => n2236);
   U1330 : iv110 port map( A => n2239, Y => n1958);
   U1331 : na210 port map( A => n2240, B => n1990, Y => n2235);
   U1332 : na310 port map( A => n2241, B => n2242, C => n2243, Y => n2240);
   U1333 : na210 port map( A => n2244, B => n2245, Y => n2243);
   U1334 : na210 port map( A => cur_timer_1_time_1_port, B => n2246, Y => n2242
                           );
   U1335 : na310 port map( A => n2237, B => n1880, C => n2190, Y => n2246);
   U1336 : iv110 port map( A => n2188, Y => n2190);
   U1337 : na210 port map( A => n2107, B => n2247, Y => n2241);
   U1338 : na210 port map( A => n1893, B => n2248, Y => n1862);
   U1339 : na210 port map( A => rst, B => cur_timer_1_time_7_port, Y => n2248);
   U1340 : na210 port map( A => cur_timer_1_time_7_port, B => n2249, Y => n1893
                           );
   U1341 : na210 port map( A => n1894, B => n2250, Y => n1861);
   U1342 : na210 port map( A => rst, B => cur_timer_1_time_6_port, Y => n2250);
   U1343 : na210 port map( A => cur_timer_1_time_6_port, B => n2249, Y => n1894
                           );
   U1344 : na210 port map( A => n1895, B => n2251, Y => n1860);
   U1345 : na210 port map( A => rst, B => cur_timer_1_time_5_port, Y => n2251);
   U1346 : na210 port map( A => cur_timer_1_time_5_port, B => n2249, Y => n1895
                           );
   U1347 : na310 port map( A => n2252, B => n1990, C => n2253, Y => n2249);
   U1348 : no210 port map( A => n2254, B => n2255, Y => n2253);
   U1349 : iv110 port map( A => n2256, Y => n2255);
   U1350 : mu111 port map( A => n2107, B => n2257, S => n2237, Y => n2256);
   U1351 : no210 port map( A => cur_state_3_port, B => n1949, Y => n2254);
   U1352 : na210 port map( A => n2245, B => n2258, Y => n2252);
   U1353 : na210 port map( A => n2259, B => n2260, Y => n1859);
   U1354 : na210 port map( A => cur_draw_score_draw, B => rst, Y => n2260);
   U1355 : na210 port map( A => n2261, B => n2262, Y => n1858);
   U1356 : na310 port map( A => n2263, B => n1882, C => n2264, Y => n2262);
   U1357 : iv110 port map( A => n2265, Y => n2264);
   U1358 : na210 port map( A => cur_rot_0_port, B => n2266, Y => n2261);
   U1359 : na210 port map( A => n2267, B => n2268, Y => n1857);
   U1360 : na310 port map( A => n1890, B => n1881, C => n2269, Y => n2268);
   U1361 : mu111 port map( A => n2270, B => n2271, S => cur_rot_0_port, Y => 
                           n2269);
   U1362 : na210 port map( A => cur_rot_new_0_port, B => n2272, Y => n2267);
   U1363 : na210 port map( A => n2273, B => n2274, Y => n1856);
   U1364 : na310 port map( A => n2263, B => n1883, C => n2275, Y => n2274);
   U1365 : iv110 port map( A => n2276, Y => n2275);
   U1366 : na210 port map( A => cur_rot_1_port, B => n2266, Y => n2273);
   U1367 : na310 port map( A => n2263, B => n2154, C => n2277, Y => n2266);
   U1368 : na210 port map( A => n2278, B => n2279, Y => n1855);
   U1369 : na210 port map( A => n2280, B => n1882, Y => n2279);
   U1370 : na210 port map( A => n2281, B => n2282, Y => n2280);
   U1371 : na210 port map( A => n2283, B => cur_rot_1_port, Y => n2282);
   U1372 : na210 port map( A => n2284, B => n2270, Y => n2281);
   U1373 : mu111 port map( A => n2285, B => n2286, S => n2287, Y => n2284);
   U1374 : ex210 port map( A => cur_rot_1_port, B => cur_rot_0_port, Y => n2287
                           );
   U1375 : na210 port map( A => n2288, B => n2021, Y => n2286);
   U1376 : na210 port map( A => cur_state_6_port, B => n1890, Y => n2288);
   U1377 : no210 port map( A => cur_state_6_port, B => n2289, Y => n2285);
   U1378 : na210 port map( A => cur_rot_new_1_port, B => n2272, Y => n2278);
   U1379 : na210 port map( A => n2290, B => n1881, Y => n2272);
   U1380 : iv110 port map( A => n2291, Y => n2290);
   U1381 : na210 port map( A => n2292, B => n2293, Y => n1854);
   U1382 : na310 port map( A => n2294, B => n1883, C => n2295, Y => n2293);
   U1383 : na210 port map( A => n2296, B => n2202, Y => n2294);
   U1384 : na210 port map( A => n2297, B => n2298, Y => n2296);
   U1385 : na210 port map( A => cur_x_0_port, B => n2299, Y => n2292);
   U1386 : na210 port map( A => n2300, B => n1890, Y => n2299);
   U1387 : mu111 port map( A => n2301, B => cur_x_new_1_port, S => rst, Y => 
                           n1853);
   U1388 : na210 port map( A => n2302, B => n2303, Y => n1852);
   U1389 : na310 port map( A => n2304, B => n1882, C => n2305, Y => n2303);
   U1390 : na210 port map( A => n2306, B => n2307, Y => n2304);
   U1391 : na210 port map( A => n2297, B => n2301, Y => n2307);
   U1392 : iv110 port map( A => n2308, Y => n2297);
   U1393 : na210 port map( A => n1929, B => cur_state_5_port, Y => n2306);
   U1394 : na210 port map( A => cur_x_1_port, B => n2309, Y => n2302);
   U1395 : mu111 port map( A => n2310, B => cur_x_new_2_port, S => rst, Y => 
                           n1851);
   U1396 : na210 port map( A => n2311, B => n2312, Y => n1850);
   U1397 : na310 port map( A => n2310, B => n1881, C => n2313, Y => n2312);
   U1398 : no210 port map( A => n2308, B => n2314, Y => n2313);
   U1399 : na210 port map( A => cur_x_2_port, B => n2309, Y => n2311);
   U1400 : na310 port map( A => n2277, B => n2315, C => n2305, Y => n2309);
   U1401 : iv110 port map( A => n2314, Y => n2305);
   U1402 : na210 port map( A => n2295, B => n2316, Y => n2314);
   U1403 : na210 port map( A => cur_state_5_port, B => n2047, Y => n2316);
   U1404 : na210 port map( A => cur_state_5_port, B => n2102, Y => n2315);
   U1405 : mu111 port map( A => n2298, B => cur_x_new_0_port, S => rst, Y => 
                           n1849);
   U1406 : na210 port map( A => n2317, B => n2318, Y => n1848);
   U1407 : na210 port map( A => cur_new_piece, B => n2319, Y => n2318);
   U1408 : na210 port map( A => n2320, B => n1883, Y => n2319);
   U1409 : iv110 port map( A => n1922, Y => n2320);
   U1410 : na310 port map( A => n1929, B => n2321, C => n2322, Y => n1922);
   U1411 : na210 port map( A => cur_state_6_port, B => n1930, Y => n2321);
   U1412 : na210 port map( A => n2323, B => n1882, Y => n2317);
   U1413 : iv110 port map( A => n1920, Y => n2323);
   U1414 : na210 port map( A => n2322, B => n2324, Y => n1920);
   U1415 : na210 port map( A => n2325, B => n1938, Y => n2324);
   U1416 : no210 port map( A => n2326, B => n2327, Y => n2322);
   U1417 : no210 port map( A => n1998, B => n2238, Y => n2327);
   U1418 : na210 port map( A => n2328, B => n2329, Y => n1847);
   U1419 : na210 port map( A => cur_timer_1_time_4_port, B => n2330, Y => n2329
                           );
   U1420 : na210 port map( A => n2328, B => n2331, Y => n1846);
   U1421 : na210 port map( A => cur_timer_1_time_3_port, B => n2330, Y => n2331
                           );
   U1422 : na210 port map( A => n2328, B => n2332, Y => n1845);
   U1423 : na210 port map( A => cur_timer_1_time_2_port, B => n2330, Y => n2332
                           );
   U1424 : na210 port map( A => n2333, B => n1881, Y => n2330);
   U1425 : iv110 port map( A => n1898, Y => n2333);
   U1426 : na310 port map( A => n2334, B => n2335, C => n2336, Y => n1898);
   U1427 : no210 port map( A => cur_state_4_port, B => n1998, Y => n2336);
   U1428 : na210 port map( A => n2188, B => n1888, Y => n2335);
   U1429 : na210 port map( A => n2337, B => n1883, Y => n2328);
   U1430 : iv110 port map( A => n1896, Y => n2337);
   U1431 : na210 port map( A => n2334, B => n2338, Y => n1896);
   U1432 : na210 port map( A => n1938, B => n2339, Y => n2338);
   U1433 : na210 port map( A => cur_state_5_port, B => n2340, Y => n2339);
   U1434 : na210 port map( A => n1880, B => n2231, Y => n2340);
   U1435 : na210 port map( A => n1989, B => n1929, Y => n1938);
   U1436 : iv110 port map( A => n2341, Y => n2334);
   U1437 : na210 port map( A => n1909, B => n2342, Y => n2341);
   U1438 : na210 port map( A => n1907, B => n1966, Y => n2342);
   U1439 : no210 port map( A => n2343, B => n1903, Y => n1909);
   U1440 : iv110 port map( A => n1990, Y => n1903);
   U1441 : no310 port map( A => n1888, B => n2244, C => n1940, Y => n2343);
   U1442 : na310 port map( A => n2344, B => n2345, C => n2346, Y => n1844);
   U1443 : na210 port map( A => cur_y_0_port, B => n2347, Y => n2346);
   U1444 : na210 port map( A => n2348, B => n2349, Y => n2345);
   U1445 : na210 port map( A => n2350, B => cur_y_new_0_port, Y => n2344);
   U1446 : mu111 port map( A => n2349, B => cur_y_new_0_port, S => rst, Y => 
                           n1843);
   U1447 : mu111 port map( A => n2351, B => cur_y_new_1_port, S => rst, Y => 
                           n1842);
   U1448 : na310 port map( A => n2352, B => n2353, C => n2354, Y => n1841);
   U1449 : na210 port map( A => cur_y_1_port, B => n2347, Y => n2354);
   U1450 : na210 port map( A => n2348, B => n2351, Y => n2353);
   U1451 : na210 port map( A => cur_y_new_1_port, B => n2350, Y => n2352);
   U1452 : mu111 port map( A => n2355, B => cur_y_new_2_port, S => rst, Y => 
                           n1840);
   U1453 : na310 port map( A => n2356, B => n2357, C => n2358, Y => n1839);
   U1454 : na210 port map( A => cur_y_2_port, B => n2347, Y => n2358);
   U1455 : na210 port map( A => n2348, B => n2355, Y => n2357);
   U1456 : na210 port map( A => cur_y_new_2_port, B => n2350, Y => n2356);
   U1457 : mu111 port map( A => n2359, B => cur_y_new_3_port, S => rst, Y => 
                           n1838);
   U1458 : na310 port map( A => n2360, B => n2361, C => n2362, Y => n1837);
   U1459 : na210 port map( A => cur_y_3_port, B => n2347, Y => n2362);
   U1460 : na310 port map( A => n2300, B => n2363, C => n2364, Y => n2347);
   U1461 : no210 port map( A => n2326, B => n2365, Y => n2364);
   U1462 : no210 port map( A => n2366, B => n1968, Y => n2365);
   U1463 : no210 port map( A => n2167, B => n2019, Y => n2366);
   U1464 : na210 port map( A => n1982, B => n2102, Y => n2363);
   U1465 : iv110 port map( A => n2367, Y => n2300);
   U1466 : na210 port map( A => n2295, B => n2277, Y => n2367);
   U1467 : no210 port map( A => rst, B => n2368, Y => n2277);
   U1468 : iv110 port map( A => n2369, Y => n2368);
   U1469 : na210 port map( A => n2348, B => n2359, Y => n2361);
   U1470 : no210 port map( A => n2370, B => n2308, Y => n2348);
   U1471 : na210 port map( A => cur_y_new_3_port, B => n2350, Y => n2360);
   U1472 : no310 port map( A => n2370, B => n2019, C => n2371, Y => n2350);
   U1473 : na210 port map( A => n2372, B => n2078, Y => n2371);
   U1474 : na310 port map( A => n2007, B => n1882, C => n2295, Y => n2370);
   U1475 : no210 port map( A => cur_state_3_port, B => n2373, Y => n2295);
   U1476 : no210 port map( A => n2263, B => cur_state_5_port, Y => n2373);
   U1477 : no210 port map( A => n2130, B => n2374, Y => n2263);
   U1478 : no210 port map( A => n2032, B => n1993, Y => n2374);
   U1479 : na210 port map( A => n2375, B => n2376, Y => n1836);
   U1480 : na210 port map( A => n2377, B => cur_future_piece_2_port, Y => n2376
                           );
   U1481 : na210 port map( A => cur_piece_2_port, B => n2378, Y => n2375);
   U1482 : na210 port map( A => n2379, B => n2380, Y => n1835);
   U1483 : na210 port map( A => n2377, B => cur_future_piece_1_port, Y => n2380
                           );
   U1484 : na210 port map( A => cur_piece_1_port, B => n2378, Y => n2379);
   U1485 : na210 port map( A => n2381, B => n2382, Y => n1834);
   U1486 : na210 port map( A => n2377, B => cur_future_piece_0_port, Y => n2382
                           );
   U1487 : no310 port map( A => n2015, B => rst, C => n2202, Y => n2377);
   U1488 : na210 port map( A => cur_piece_0_port, B => n2378, Y => n2381);
   U1489 : na310 port map( A => n1880, B => n1881, C => n2383, Y => n2378);
   U1490 : mu111 port map( A => n2160, B => n2001, S => cur_state_5_port, Y => 
                           n2383);
   U1491 : iv110 port map( A => n2202, Y => n2001);
   U1492 : na210 port map( A => n1974, B => n1929, Y => n2202);
   U1493 : na210 port map( A => n2384, B => n2385, Y => n1833);
   U1494 : iv110 port map( A => n2386, Y => n2385);
   U1495 : no310 port map( A => n2387, B => n2388, C => n2389, Y => n2386);
   U1496 : na210 port map( A => n1883, B => n2390, Y => n2389);
   U1497 : na210 port map( A => cur_lut_piece_type_2_port, B => n2391, Y => 
                           n2384);
   U1498 : na210 port map( A => n2392, B => n1882, Y => n2391);
   U1499 : iv110 port map( A => n2393, Y => n2392);
   U1500 : na210 port map( A => n2394, B => n2395, Y => n1832);
   U1501 : na310 port map( A => n2396, B => n1881, C => n2397, Y => n2395);
   U1502 : na210 port map( A => cur_lut_piece_type_1_port, B => n2398, Y => 
                           n2394);
   U1503 : na210 port map( A => n2399, B => n2400, Y => n1831);
   U1504 : na310 port map( A => n2401, B => n1883, C => n2397, Y => n2400);
   U1505 : na210 port map( A => cur_lut_piece_type_0_port, B => n2398, Y => 
                           n2399);
   U1506 : na210 port map( A => n2402, B => n1882, Y => n2398);
   U1507 : iv110 port map( A => n2403, Y => n2402);
   U1508 : na210 port map( A => n2404, B => n2405, Y => n1830);
   U1509 : na310 port map( A => n2092, B => n1881, C => n2406, Y => n2405);
   U1510 : na210 port map( A => cur_check_start, B => n2407, Y => n2404);
   U1511 : na210 port map( A => n2408, B => n1883, Y => n2407);
   U1512 : iv110 port map( A => n2409, Y => n2408);
   U1513 : na210 port map( A => n2410, B => n2411, Y => n1829);
   U1514 : na210 port map( A => n2412, B => n1882, Y => n2411);
   U1515 : na210 port map( A => cur_lut_y_3_port, B => n2413, Y => n2410);
   U1516 : na210 port map( A => n2414, B => n2415, Y => n1828);
   U1517 : na210 port map( A => n2416, B => n1881, Y => n2415);
   U1518 : na210 port map( A => cur_lut_y_2_port, B => n2413, Y => n2414);
   U1519 : na210 port map( A => n2417, B => n2418, Y => n1827);
   U1520 : na210 port map( A => n2419, B => n1883, Y => n2418);
   U1521 : na210 port map( A => cur_lut_y_1_port, B => n2413, Y => n2417);
   U1522 : na210 port map( A => n2420, B => n2421, Y => n1826);
   U1523 : na210 port map( A => n2422, B => n1882, Y => n2421);
   U1524 : na210 port map( A => cur_lut_y_0_port, B => n2413, Y => n2420);
   U1525 : na210 port map( A => n2423, B => n1881, Y => n2413);
   U1526 : iv110 port map( A => n2424, Y => n2423);
   U1527 : na210 port map( A => n2425, B => n2426, Y => n1825);
   U1528 : na210 port map( A => n2427, B => n2428, Y => n2426);
   U1529 : na210 port map( A => cur_lut_rot_1_port, B => n2429, Y => n2425);
   U1530 : na210 port map( A => n2430, B => n2431, Y => n1824);
   U1531 : na210 port map( A => n2427, B => n2432, Y => n2431);
   U1532 : na210 port map( A => cur_lut_x_0_port, B => n2429, Y => n2430);
   U1533 : na210 port map( A => n2433, B => n2434, Y => n1823);
   U1534 : na210 port map( A => n2427, B => n2435, Y => n2434);
   U1535 : na210 port map( A => cur_lut_x_1_port, B => n2429, Y => n2433);
   U1536 : na210 port map( A => n2436, B => n2437, Y => n1822);
   U1537 : na210 port map( A => n2427, B => n2438, Y => n2437);
   U1538 : na210 port map( A => cur_lut_x_2_port, B => n2429, Y => n2436);
   U1539 : na210 port map( A => n2439, B => n2440, Y => n1821);
   U1540 : na210 port map( A => n2427, B => n2441, Y => n2440);
   U1541 : no210 port map( A => n2442, B => rst, Y => n2427);
   U1542 : na210 port map( A => cur_lut_rot_0_port, B => n2429, Y => n2439);
   U1543 : na210 port map( A => n2443, B => n1883, Y => n2429);
   U1544 : iv110 port map( A => n2444, Y => n2443);
   U1545 : na210 port map( A => n2445, B => n2446, Y => n1820);
   U1546 : na210 port map( A => cur_draw_erase_start, B => n2447, Y => n2446);
   U1547 : na210 port map( A => n2448, B => n1882, Y => n2447);
   U1548 : iv110 port map( A => n2449, Y => n2448);
   U1549 : na210 port map( A => n2450, B => n1881, Y => n2445);
   U1550 : na210 port map( A => n2451, B => n2452, Y => n1819);
   U1551 : iv110 port map( A => n2453, Y => n2451);
   U1552 : mu111 port map( A => n2454, B => cur_draw_erase_draw, S => rst, Y =>
                           n2453);
   U1553 : na210 port map( A => n2455, B => n2456, Y => n1818);
   U1554 : na310 port map( A => n2457, B => n1883, C => n2245, Y => n2456);
   U1555 : na210 port map( A => cur_clear_shift_start, B => n2458, Y => n2455);
   U1556 : na210 port map( A => n2459, B => n1882, Y => n2458);
   U1557 : iv110 port map( A => n2460, Y => n2459);
   U1558 : na210 port map( A => n2461, B => n2462, Y => n1817);
   U1559 : na310 port map( A => n1915, B => n1881, C => n1914, Y => n2462);
   U1560 : na210 port map( A => n2463, B => n2464, Y => n1914);
   U1561 : na210 port map( A => n2465, B => n1889, Y => n2464);
   U1562 : mu111 port map( A => n2466, B => cur_timer_1_start, S => n2467, Y =>
                           n2465);
   U1563 : no210 port map( A => n2468, B => n2469, Y => n2467);
   U1564 : mu111 port map( A => n2152, B => n2244, S => cur_state_5_port, Y => 
                           n2469);
   U1565 : no210 port map( A => n1968, B => n2167, Y => n2468);
   U1566 : no210 port map( A => n1949, B => n1930, Y => n2466);
   U1567 : na210 port map( A => n2470, B => n2078, Y => n2463);
   U1568 : na210 port map( A => cur_timer_1_start, B => n2471, Y => n2461);
   U1569 : na210 port map( A => n2472, B => n1883, Y => n2471);
   U1570 : na210 port map( A => n2473, B => n2474, Y => n1816);
   U1571 : na310 port map( A => n1915, B => n1882, C => n1918, Y => n2474);
   U1572 : na210 port map( A => n2475, B => n2325, Y => n1918);
   U1573 : na210 port map( A => n1982, B => n2476, Y => n2325);
   U1574 : na210 port map( A => n2102, B => n1995, Y => n2476);
   U1575 : iv110 port map( A => n2092, Y => n1982);
   U1576 : na210 port map( A => n2107, B => n1907, Y => n2475);
   U1577 : na210 port map( A => cur_timer_1_reset, B => n2477, Y => n2473);
   U1578 : na210 port map( A => n2478, B => n1881, Y => n2477);
   U1579 : iv110 port map( A => n1919, Y => n2478);
   U1580 : na310 port map( A => n2479, B => n2289, C => n2472, Y => n1919);
   U1581 : iv110 port map( A => n1913, Y => n2472);
   U1582 : na210 port map( A => n1915, B => n2257, Y => n1913);
   U1583 : na210 port map( A => n1888, B => n2480, Y => n2257);
   U1584 : na210 port map( A => n2034, B => n1995, Y => n2480);
   U1585 : na210 port map( A => n1984, B => n2209, Y => n1915);
   U1586 : na210 port map( A => n2154, B => n1947, Y => n2209);
   U1587 : na210 port map( A => n1889, B => n2102, Y => n2479);
   U1588 : na210 port map( A => n2481, B => n2482, Y => n166);
   U1589 : na310 port map( A => cur_state_6_port, B => n1947, C => n2483, Y => 
                           n2482);
   U1590 : no210 port map( A => n1889, B => n2247, Y => n2483);
   U1591 : na310 port map( A => n2245, B => n2484, C => n2138, Y => n2481);
   U1592 : na210 port map( A => n2020, B => n2485, Y => n2484);
   U1593 : na210 port map( A => n2019, B => n1949, Y => n2485);
   U1594 : na310 port map( A => n2486, B => n2487, C => n2488, Y => n159);
   U1595 : no310 port map( A => n2489, B => n2200, C => n2490, Y => n2488);
   U1596 : no310 port map( A => n2018, B => n1929, C => n2021, Y => n2490);
   U1597 : no210 port map( A => n2491, B => n2110, Y => n2489);
   U1598 : no210 port map( A => n2492, B => n1993, Y => n2491);
   U1599 : no210 port map( A => cur_state_1_port, B => n2056, Y => n2492);
   U1600 : no210 port map( A => cur_state_4_port, B => n2493, Y => n2056);
   U1601 : no210 port map( A => n2214, B => n2123, Y => n2493);
   U1602 : na310 port map( A => n2494, B => n2495, C => n2496, Y => n2123);
   U1603 : no310 port map( A => n2497, B => n2498, C => n2499, Y => n2496);
   U1604 : iv110 port map( A => cur_timer_1_time_3_port, Y => n2499);
   U1605 : iv110 port map( A => cur_timer_1_time_4_port, Y => n2498);
   U1606 : na210 port map( A => cur_timer_1_time_1_port, B => 
                           cur_timer_1_time_2_port, Y => n2497);
   U1607 : no210 port map( A => cur_timer_1_time_7_port, B => 
                           cur_timer_1_time_6_port, Y => n2495);
   U1608 : no210 port map( A => cur_timer_1_time_5_port, B => 
                           cur_timer_1_time_0_port, Y => n2494);
   U1609 : iv110 port map( A => inv_inputs_5_port, Y => n2214);
   U1610 : na210 port map( A => cur_state_4_port, B => n2500, Y => n2487);
   U1611 : iv110 port map( A => n2501, Y => n2500);
   U1612 : no210 port map( A => n1998, B => n2502, Y => n2501);
   U1613 : na210 port map( A => n1889, B => n2503, Y => n2486);
   U1614 : na310 port map( A => n2504, B => n2505, C => n2506, Y => n2503);
   U1615 : no310 port map( A => n2507, B => n2508, C => n2509, Y => n2506);
   U1616 : no310 port map( A => n1968, B => n1892, C => n2510, Y => n2509);
   U1617 : no210 port map( A => n2511, B => cur_state_4_port, Y => n2510);
   U1618 : no210 port map( A => cur_state_1_port, B => n2019, Y => n2511);
   U1619 : iv110 port map( A => check_empty, Y => n2019);
   U1620 : no210 port map( A => n2512, B => n2089, Y => n2507);
   U1621 : no210 port map( A => n2513, B => n2091, Y => n2512);
   U1622 : no210 port map( A => n1940, B => n2140, Y => n2513);
   U1623 : na210 port map( A => cur_state_4_port, B => n1997, Y => n2140);
   U1624 : na210 port map( A => n1936, B => n2034, Y => n2505);
   U1625 : no210 port map( A => n2514, B => n2515, Y => n2504);
   U1626 : no210 port map( A => n1993, B => n2121, Y => n2515);
   U1627 : no210 port map( A => n2516, B => n1949, Y => n2514);
   U1628 : no210 port map( A => n2517, B => n1974, Y => n2516);
   U1629 : no310 port map( A => n2518, B => cur_state_5_port, C => n2519, Y => 
                           n2517);
   U1630 : iv110 port map( A => n2004, Y => n2519);
   U1631 : na310 port map( A => n2520, B => n2521, C => n2522, Y => n2004);
   U1632 : no310 port map( A => inv_inputs_0_port, B => inv_inputs_2_port, C =>
                           inv_inputs_1_port, Y => n2522);
   U1633 : no210 port map( A => inv_inputs_7_port, B => inv_inputs_6_port, Y =>
                           n2521);
   U1634 : no210 port map( A => inv_inputs_5_port, B => inv_inputs_3_port, Y =>
                           n2520);
   U1635 : no210 port map( A => n2523, B => n1947, Y => n2518);
   U1636 : no210 port map( A => n1892, B => n2033, Y => n2523);
   U1637 : iv110 port map( A => inv_inputs_1_port, Y => n2033);
   U1638 : na210 port map( A => n2524, B => n2525, Y => lut_y(3));
   U1639 : na210 port map( A => cur_lut_y_3_port, B => n2424, Y => n2525);
   U1640 : iv110 port map( A => n2412, Y => n2524);
   U1641 : na210 port map( A => n2526, B => n2527, Y => n2412);
   U1642 : na210 port map( A => n2528, B => n2359, Y => n2527);
   U1643 : na210 port map( A => n2529, B => n2530, Y => n2359);
   U1644 : na210 port map( A => cur_y_new_3_port, B => n2531, Y => n2530);
   U1645 : mu111 port map( A => n2532, B => n2533, S => cur_y_3_port, Y => 
                           n2529);
   U1646 : no210 port map( A => n2534, B => n2535, Y => n2533);
   U1647 : no210 port map( A => cur_y_2_port, B => n2536, Y => n2534);
   U1648 : na210 port map( A => n2537, B => cur_y_2_port, Y => n2532);
   U1649 : iv110 port map( A => n2538, Y => n2537);
   U1650 : na210 port map( A => n2539, B => cur_y_3_port, Y => n2526);
   U1651 : na210 port map( A => n2540, B => n2541, Y => lut_y(2));
   U1652 : na210 port map( A => cur_lut_y_2_port, B => n2424, Y => n2541);
   U1653 : iv110 port map( A => n2416, Y => n2540);
   U1654 : na210 port map( A => n2542, B => n2543, Y => n2416);
   U1655 : na210 port map( A => n2528, B => n2355, Y => n2543);
   U1656 : na210 port map( A => n2544, B => n2545, Y => n2355);
   U1657 : na210 port map( A => cur_y_new_2_port, B => n2531, Y => n2545);
   U1658 : mu111 port map( A => n2538, B => n2546, S => cur_y_2_port, Y => 
                           n2544);
   U1659 : iv110 port map( A => n2535, Y => n2546);
   U1660 : na210 port map( A => n2547, B => n2548, Y => n2535);
   U1661 : na210 port map( A => n2549, B => n2550, Y => n2548);
   U1662 : na310 port map( A => n2549, B => cur_y_0_port, C => cur_y_1_port, Y 
                           => n2538);
   U1663 : na210 port map( A => n2539, B => cur_y_2_port, Y => n2542);
   U1664 : na210 port map( A => n2551, B => n2552, Y => lut_y(1));
   U1665 : na210 port map( A => cur_lut_y_1_port, B => n2424, Y => n2552);
   U1666 : iv110 port map( A => n2419, Y => n2551);
   U1667 : na210 port map( A => n2553, B => n2554, Y => n2419);
   U1668 : na210 port map( A => n2528, B => n2351, Y => n2554);
   U1669 : na210 port map( A => n2555, B => n2556, Y => n2351);
   U1670 : na210 port map( A => cur_y_new_1_port, B => n2531, Y => n2556);
   U1671 : mu111 port map( A => n2547, B => n2557, S => n2550, Y => n2555);
   U1672 : iv110 port map( A => cur_y_1_port, Y => n2550);
   U1673 : na210 port map( A => n2549, B => cur_y_0_port, Y => n2557);
   U1674 : no210 port map( A => n2558, B => n2559, Y => n2547);
   U1675 : no210 port map( A => n2536, B => cur_y_0_port, Y => n2559);
   U1676 : iv110 port map( A => n2549, Y => n2536);
   U1677 : na210 port map( A => n2539, B => cur_y_1_port, Y => n2553);
   U1678 : na210 port map( A => n2560, B => n2561, Y => lut_y(0));
   U1679 : na210 port map( A => cur_lut_y_0_port, B => n2424, Y => n2561);
   U1680 : na310 port map( A => n2562, B => n2563, C => n2564, Y => n2424);
   U1681 : no210 port map( A => n2565, B => n2566, Y => n2564);
   U1682 : no210 port map( A => cur_state_4_port, B => n2567, Y => n2566);
   U1683 : no310 port map( A => n2021, B => n1892, C => n2568, Y => n2565);
   U1684 : na210 port map( A => n2569, B => cur_state_1_port, Y => n2563);
   U1685 : iv110 port map( A => n2422, Y => n2560);
   U1686 : na210 port map( A => n2570, B => n2571, Y => n2422);
   U1687 : na210 port map( A => n2539, B => cur_y_0_port, Y => n2571);
   U1688 : iv110 port map( A => n2572, Y => n2539);
   U1689 : na210 port map( A => n2562, B => n2573, Y => n2572);
   U1690 : na210 port map( A => n2574, B => n1880, Y => n2573);
   U1691 : no310 port map( A => n2575, B => n1989, C => n2388, Y => n2562);
   U1692 : iv110 port map( A => n2576, Y => n2388);
   U1693 : no210 port map( A => n1888, B => n2508, Y => n2575);
   U1694 : no310 port map( A => n1892, B => n1891, C => n2167, Y => n2508);
   U1695 : na210 port map( A => n2528, B => n2349, Y => n2570);
   U1696 : na210 port map( A => n2577, B => n2578, Y => n2349);
   U1697 : na210 port map( A => cur_y_new_0_port, B => n2531, Y => n2578);
   U1698 : na310 port map( A => n2579, B => n2580, C => n2581, Y => n2531);
   U1699 : na210 port map( A => n2154, B => n2582, Y => n2581);
   U1700 : na210 port map( A => n1889, B => n2583, Y => n2580);
   U1701 : na210 port map( A => n1936, B => n1976, Y => n2583);
   U1702 : na210 port map( A => n1998, B => n2003, Y => n2579);
   U1703 : iv110 port map( A => n2584, Y => n2577);
   U1704 : mu111 port map( A => n2549, B => n2558, S => cur_y_0_port, Y => 
                           n2584);
   U1705 : na310 port map( A => n2585, B => n2586, C => n2587, Y => n2558);
   U1706 : na210 port map( A => n2569, B => n2107, Y => n2587);
   U1707 : na310 port map( A => n1889, B => n1976, C => n1936, Y => n2586);
   U1708 : iv110 port map( A => n2110, Y => n1936);
   U1709 : na210 port map( A => n1974, B => n1940, Y => n2110);
   U1710 : na210 port map( A => n2502, B => n1993, Y => n2585);
   U1711 : no210 port map( A => n2003, B => n2015, Y => n2549);
   U1712 : na210 port map( A => n1993, B => n1947, Y => n2003);
   U1713 : iv110 port map( A => n2588, Y => n2528);
   U1714 : na310 port map( A => n2576, B => cur_state_4_port, C => n2589, Y => 
                           n2588);
   U1715 : no310 port map( A => n2567, B => n1889, C => n1989, Y => n2589);
   U1716 : no210 port map( A => n2372, B => n2590, Y => n2567);
   U1717 : no210 port map( A => n2308, B => cur_state_1_port, Y => n2590);
   U1718 : na210 port map( A => n2591, B => n2592, Y => lut_x(2));
   U1719 : na210 port map( A => n2593, B => n2438, Y => n2592);
   U1720 : na210 port map( A => n2594, B => n2595, Y => n2438);
   U1721 : na210 port map( A => n2569, B => n2310, Y => n2595);
   U1722 : na310 port map( A => n2596, B => n2597, C => n2598, Y => n2310);
   U1723 : na210 port map( A => cur_x_new_2_port, B => n2291, Y => n2598);
   U1724 : na210 port map( A => n2599, B => n2283, Y => n2597);
   U1725 : mu111 port map( A => n2600, B => n2601, S => cur_x_2_port, Y => 
                           n2599);
   U1726 : ex210 port map( A => n2602, B => n2603, Y => n2601);
   U1727 : iv110 port map( A => n2604, Y => n2600);
   U1728 : mu111 port map( A => n2602, B => n2200, S => n2603, Y => n2604);
   U1729 : iv110 port map( A => n2605, Y => n2603);
   U1730 : na210 port map( A => cur_x_2_port, B => n2606, Y => n2596);
   U1731 : na210 port map( A => cur_x_2_port, B => n2607, Y => n2594);
   U1732 : na210 port map( A => cur_lut_x_2_port, B => n2444, Y => n2591);
   U1733 : na210 port map( A => n2608, B => n2609, Y => lut_x(1));
   U1734 : na210 port map( A => n2593, B => n2435, Y => n2609);
   U1735 : na210 port map( A => n2610, B => n2611, Y => n2435);
   U1736 : na210 port map( A => n2569, B => n2301, Y => n2611);
   U1737 : na310 port map( A => n2612, B => n2613, C => n2614, Y => n2301);
   U1738 : na210 port map( A => cur_x_new_1_port, B => n2291, Y => n2614);
   U1739 : na210 port map( A => n2283, B => n2615, Y => n2613);
   U1740 : na210 port map( A => n2602, B => n2616, Y => n2615);
   U1741 : na210 port map( A => n2617, B => n2618, Y => n2616);
   U1742 : ex210 port map( A => cur_x_1_port, B => cur_x_0_port, Y => n2617);
   U1743 : na210 port map( A => n2200, B => n2619, Y => n2602);
   U1744 : na210 port map( A => n2605, B => n2620, Y => n2619);
   U1745 : na210 port map( A => n2621, B => n2622, Y => n2620);
   U1746 : iv110 port map( A => cur_x_1_port, Y => n2622);
   U1747 : iv110 port map( A => cur_x_0_port, Y => n2621);
   U1748 : na210 port map( A => cur_x_1_port, B => cur_x_0_port, Y => n2605);
   U1749 : iv110 port map( A => n2618, Y => n2200);
   U1750 : na210 port map( A => n2022, B => n1993, Y => n2618);
   U1751 : no210 port map( A => n2021, B => cur_state_6_port, Y => n2022);
   U1752 : iv110 port map( A => n2623, Y => n2283);
   U1753 : na210 port map( A => cur_x_1_port, B => n2606, Y => n2612);
   U1754 : iv110 port map( A => n2624, Y => n2606);
   U1755 : na210 port map( A => cur_x_1_port, B => n2607, Y => n2610);
   U1756 : na210 port map( A => cur_lut_x_1_port, B => n2444, Y => n2608);
   U1757 : na210 port map( A => n2625, B => n2626, Y => lut_x(0));
   U1758 : na210 port map( A => n2593, B => n2432, Y => n2626);
   U1759 : na210 port map( A => n2627, B => n2628, Y => n2432);
   U1760 : na210 port map( A => n2569, B => n2298, Y => n2628);
   U1761 : na210 port map( A => n2629, B => n2630, Y => n2298);
   U1762 : na210 port map( A => cur_x_new_0_port, B => n2291, Y => n2630);
   U1763 : na210 port map( A => n2631, B => n1940, Y => n2291);
   U1764 : mu111 port map( A => n2632, B => n2633, S => cur_state_3_port, Y => 
                           n2631);
   U1765 : no210 port map( A => n1973, B => n2047, Y => n2633);
   U1766 : iv110 port map( A => n2582, Y => n2632);
   U1767 : na310 port map( A => n2634, B => n2635, C => n2636, Y => n2582);
   U1768 : na210 port map( A => n1947, B => n2188, Y => n2636);
   U1769 : na210 port map( A => n1892, B => n2231, Y => n2635);
   U1770 : na210 port map( A => n2138, B => n1969, Y => n2634);
   U1771 : mu111 port map( A => n2623, B => n2624, S => cur_x_0_port, Y => 
                           n2629);
   U1772 : na210 port map( A => n2270, B => n1940, Y => n2624);
   U1773 : na210 port map( A => n2637, B => n2638, Y => n2270);
   U1774 : na310 port map( A => n1892, B => n1880, C => n2107, Y => n2638);
   U1775 : iv110 port map( A => n2231, Y => n2107);
   U1776 : na210 port map( A => n2152, B => n1949, Y => n2231);
   U1777 : iv110 port map( A => n1966, Y => n2152);
   U1778 : na210 port map( A => n2639, B => n2034, Y => n2637);
   U1779 : na210 port map( A => n2271, B => n1940, Y => n2623);
   U1780 : na210 port map( A => n2640, B => n2641, Y => n2271);
   U1781 : na310 port map( A => n1993, B => n1888, C => n2138, Y => n2641);
   U1782 : iv110 port map( A => n2189, Y => n2138);
   U1783 : na210 port map( A => n2639, B => n1885, Y => n2640);
   U1784 : no310 port map( A => n1880, B => n1973, C => n2047, Y => n2639);
   U1785 : iv110 port map( A => n1976, Y => n1973);
   U1786 : na210 port map( A => n1969, B => n2102, Y => n1976);
   U1787 : na210 port map( A => cur_x_0_port, B => n2607, Y => n2627);
   U1788 : na210 port map( A => cur_lut_x_0_port, B => n2444, Y => n2625);
   U1789 : na210 port map( A => n2642, B => n2643, Y => lut_rot(1));
   U1790 : na210 port map( A => n2593, B => n2428, Y => n2643);
   U1791 : na210 port map( A => n2644, B => n2276, Y => n2428);
   U1792 : na210 port map( A => cur_rot_new_1_port, B => n2569, Y => n2276);
   U1793 : na210 port map( A => cur_rot_1_port, B => n2607, Y => n2644);
   U1794 : na210 port map( A => cur_lut_rot_1_port, B => n2444, Y => n2642);
   U1795 : na210 port map( A => n2645, B => n2646, Y => lut_rot(0));
   U1796 : na210 port map( A => n2593, B => n2441, Y => n2646);
   U1797 : na210 port map( A => n2647, B => n2265, Y => n2441);
   U1798 : na210 port map( A => cur_rot_new_0_port, B => n2569, Y => n2265);
   U1799 : iv110 port map( A => n2648, Y => n2569);
   U1800 : na210 port map( A => cur_rot_0_port, B => n2607, Y => n2647);
   U1801 : na210 port map( A => n2649, B => n2574, Y => n2607);
   U1802 : na210 port map( A => n1998, B => n1930, Y => n2574);
   U1803 : na210 port map( A => cur_state_4_port, B => n2021, Y => n2649);
   U1804 : na210 port map( A => cur_lut_rot_0_port, B => n2444, Y => n2645);
   U1805 : na210 port map( A => n2593, B => n2650, Y => n2444);
   U1806 : na210 port map( A => n2651, B => n1949, Y => n2650);
   U1807 : na210 port map( A => n1888, B => n1968, Y => n2651);
   U1808 : iv110 port map( A => n2442, Y => n2593);
   U1809 : na310 port map( A => n2652, B => n2653, C => n2576, Y => n2442);
   U1810 : na310 port map( A => n2654, B => n2655, C => n2154, Y => n2653);
   U1811 : na210 port map( A => n2568, B => n1947, Y => n2655);
   U1812 : na210 port map( A => n1974, B => n2078, Y => n2654);
   U1813 : na210 port map( A => n1889, B => n2656, Y => n2652);
   U1814 : na210 port map( A => n1947, B => n2034, Y => n2656);
   U1815 : na210 port map( A => n2657, B => n2658, Y => lut_piece_type(2));
   U1816 : na310 port map( A => n2576, B => n2390, C => n2659, Y => n2658);
   U1817 : na210 port map( A => n2660, B => n2661, Y => n2390);
   U1818 : na210 port map( A => n2662, B => cur_future_piece_2_port, Y => n2661
                           );
   U1819 : na210 port map( A => cur_piece_2_port, B => n2663, Y => n2660);
   U1820 : na210 port map( A => cur_lut_piece_type_2_port, B => n2393, Y => 
                           n2657);
   U1821 : na310 port map( A => n2576, B => n2664, C => n2659, Y => n2393);
   U1822 : no210 port map( A => n2665, B => n2048, Y => n2576);
   U1823 : no210 port map( A => n2130, B => n1940, Y => n2665);
   U1824 : na210 port map( A => n2047, B => n2189, Y => n2130);
   U1825 : na210 port map( A => n2666, B => n2667, Y => lut_piece_type(1));
   U1826 : na210 port map( A => n2397, B => n2396, Y => n2667);
   U1827 : na210 port map( A => n2668, B => n2669, Y => n2396);
   U1828 : na210 port map( A => n2662, B => cur_future_piece_1_port, Y => n2669
                           );
   U1829 : na210 port map( A => cur_piece_1_port, B => n2663, Y => n2668);
   U1830 : na210 port map( A => cur_lut_piece_type_1_port, B => n2403, Y => 
                           n2666);
   U1831 : na210 port map( A => n2670, B => n2671, Y => lut_piece_type(0));
   U1832 : na210 port map( A => n2397, B => n2401, Y => n2671);
   U1833 : na210 port map( A => n2672, B => n2673, Y => n2401);
   U1834 : na210 port map( A => n2662, B => cur_future_piece_0_port, Y => n2673
                           );
   U1835 : no210 port map( A => n2663, B => n2020, Y => n2662);
   U1836 : na210 port map( A => cur_piece_0_port, B => n2663, Y => n2672);
   U1837 : iv110 port map( A => n2674, Y => n2663);
   U1838 : na210 port map( A => cur_lut_piece_type_0_port, B => n2403, Y => 
                           n2670);
   U1839 : na210 port map( A => n2397, B => n2664, Y => n2403);
   U1840 : na210 port map( A => n2674, B => n2210, Y => n2664);
   U1841 : no210 port map( A => n2675, B => n1891, Y => n2674);
   U1842 : no310 port map( A => n2052, B => n2048, C => n2676, Y => n2397);
   U1843 : na210 port map( A => n2677, B => n2659, Y => n2676);
   U1844 : iv110 port map( A => n2387, Y => n2659);
   U1845 : na310 port map( A => n2678, B => n2679, C => n2680, Y => n2387);
   U1846 : no210 port map( A => n2681, B => n2502, Y => n2680);
   U1847 : no210 port map( A => n2189, B => n2021, Y => n2502);
   U1848 : no210 port map( A => n2244, B => n2308, Y => n2681);
   U1849 : na210 port map( A => n1889, B => n2682, Y => n2679);
   U1850 : na310 port map( A => n2032, B => n1940, C => n2675, Y => n2682);
   U1851 : na210 port map( A => n1949, B => n2675, Y => n2678);
   U1852 : na310 port map( A => n2308, B => n2007, C => n2683, Y => n2675);
   U1853 : na210 port map( A => n2244, B => n1889, Y => n2683);
   U1854 : iv110 port map( A => n2258, Y => n2244);
   U1855 : na210 port map( A => n1930, B => n2034, Y => n2258);
   U1856 : na210 port map( A => n1892, B => n1940, Y => n2308);
   U1857 : na210 port map( A => n1966, B => n2326, Y => n2677);
   U1858 : na210 port map( A => n1885, B => cur_state_0_port, Y => n1966);
   U1859 : no210 port map( A => n1940, B => n1885, Y => n2048);
   U1860 : iv110 port map( A => n2076, Y => n2052);
   U1861 : iv110 port map( A => n2259, Y => draw_score_draw);
   U1862 : na210 port map( A => cur_draw_score_draw, B => n2684, Y => n2259);
   U1863 : na210 port map( A => n2160, B => n2154, Y => n2684);
   U1864 : na210 port map( A => n2685, B => n2686, Y => draw_erase_start);
   U1865 : na210 port map( A => cur_draw_erase_start, B => n2449, Y => n2686);
   U1866 : na210 port map( A => n2687, B => n2688, Y => n2449);
   U1867 : na210 port map( A => n1892, B => n2689, Y => n2688);
   U1868 : na210 port map( A => n2015, B => n2690, Y => n2689);
   U1869 : na210 port map( A => n2470, B => n2020, Y => n2690);
   U1870 : iv110 port map( A => n2008, Y => n2470);
   U1871 : na210 port map( A => n1880, B => n1995, Y => n2008);
   U1872 : na210 port map( A => n1974, B => n1888, Y => n2687);
   U1873 : iv110 port map( A => n2450, Y => n2685);
   U1874 : na310 port map( A => n2691, B => n2692, C => n2693, Y => n2450);
   U1875 : na210 port map( A => n1889, B => n2694, Y => n2693);
   U1876 : na210 port map( A => n2695, B => n2696, Y => n2694);
   U1877 : na310 port map( A => n1993, B => n2697, C => n2698, Y => n2696);
   U1878 : iv110 port map( A => n2699, Y => n2698);
   U1879 : na210 port map( A => n2018, B => n2007, Y => n2697);
   U1880 : mu111 port map( A => n2700, B => n2701, S => n2702, Y => n2695);
   U1881 : no310 port map( A => n2699, B => n2326, C => n1948, Y => n2702);
   U1882 : na210 port map( A => n2703, B => n2189, Y => n2699);
   U1883 : na210 port map( A => cur_state_0_port, B => n2032, Y => n2189);
   U1884 : mu111 port map( A => n2074, B => n2704, S => n2705, Y => n2703);
   U1885 : no210 port map( A => n2706, B => n2707, Y => n2701);
   U1886 : no210 port map( A => n1892, B => n1993, Y => n2707);
   U1887 : no210 port map( A => n2705, B => n1949, Y => n2706);
   U1888 : no210 port map( A => n2091, B => n2708, Y => n2705);
   U1889 : no210 port map( A => n1885, B => n1891, Y => n2708);
   U1890 : no210 port map( A => n2034, B => n1940, Y => n2091);
   U1891 : na310 port map( A => n1993, B => n1998, C => n1948, Y => n2692);
   U1892 : iv110 port map( A => n2018, Y => n1948);
   U1893 : na210 port map( A => cur_state_0_port, B => n1892, Y => n2018);
   U1894 : iv110 port map( A => n2015, Y => n1998);
   U1895 : iv110 port map( A => n1969, Y => n1993);
   U1896 : na210 port map( A => n2238, B => n2709, Y => n2691);
   U1897 : na210 port map( A => n2710, B => n2711, Y => n2709);
   U1898 : na310 port map( A => n2092, B => n2071, C => n2712, Y => n2711);
   U1899 : na310 port map( A => n2713, B => n2239, C => n2714, Y => n2712);
   U1900 : na210 port map( A => n1946, B => n1930, Y => n2714);
   U1901 : na210 port map( A => n1929, B => cur_state_0_port, Y => n2239);
   U1902 : na210 port map( A => cur_draw_erase_start, B => n2188, Y => n2713);
   U1903 : na210 port map( A => n2715, B => n2716, Y => n2710);
   U1904 : na210 port map( A => n2717, B => n2167, Y => n2716);
   U1905 : mu111 port map( A => n2700, B => n1932, S => cur_state_1_port, Y => 
                           n2717);
   U1906 : na210 port map( A => n1997, B => n1949, Y => n1932);
   U1907 : iv110 port map( A => draw_erase_ready, Y => n1997);
   U1908 : iv110 port map( A => cur_draw_erase_start, Y => n2700);
   U1909 : na210 port map( A => n2092, B => n2071, Y => n2715);
   U1910 : iv110 port map( A => n2718, Y => n2238);
   U1911 : na210 port map( A => n2719, B => n2452, Y => draw_erase_draw);
   U1912 : na310 port map( A => n1891, B => n1956, C => cur_draw_erase_draw, Y 
                           => n2452);
   U1913 : iv110 port map( A => n2454, Y => n2719);
   U1914 : na310 port map( A => n2720, B => n2721, C => n2722, Y => n2454);
   U1915 : no210 port map( A => n2723, B => n2724, Y => n2722);
   U1916 : no210 port map( A => n1969, B => n2725, Y => n2724);
   U1917 : mu111 port map( A => n2076, B => n2726, S => cur_state_3_port, Y => 
                           n2725);
   U1918 : no210 port map( A => n1972, B => n2727, Y => n2726);
   U1919 : no210 port map( A => n1940, B => n2089, Y => n2727);
   U1920 : iv110 port map( A => n2121, Y => n1972);
   U1921 : na210 port map( A => n1989, B => n1892, Y => n2121);
   U1922 : iv110 port map( A => n2071, Y => n1989);
   U1923 : na210 port map( A => n2372, B => n1892, Y => n2076);
   U1924 : iv110 port map( A => n1968, Y => n2372);
   U1925 : na210 port map( A => cur_state_0_port, B => n1891, Y => n1968);
   U1926 : no310 port map( A => n2728, B => n2089, C => n2020, Y => n2723);
   U1927 : na210 port map( A => cur_draw_erase_draw, B => n2729, Y => n2721);
   U1928 : na310 port map( A => n2730, B => n2648, C => n2731, Y => n2729);
   U1929 : no210 port map( A => n2732, B => n2733, Y => n2731);
   U1930 : no210 port map( A => n2568, B => n2728, Y => n2733);
   U1931 : iv110 port map( A => n2210, Y => n2568);
   U1932 : na210 port map( A => n1995, B => n1949, Y => n2210);
   U1933 : no210 port map( A => n2734, B => n1880, Y => n2732);
   U1934 : no210 port map( A => n2735, B => cur_state_0_port, Y => n2734);
   U1935 : no210 port map( A => n1892, B => n1949, Y => n2735);
   U1936 : na210 port map( A => n2154, B => n1892, Y => n2648);
   U1937 : iv110 port map( A => n2021, Y => n2154);
   U1938 : na210 port map( A => n2736, B => n2167, Y => n2730);
   U1939 : na210 port map( A => n1984, B => n1930, Y => n2736);
   U1940 : na210 port map( A => n2023, B => n1907, Y => n2720);
   U1941 : iv110 port map( A => n2289, Y => n1907);
   U1942 : iv110 port map( A => n1956, Y => n2023);
   U1943 : na210 port map( A => n2078, B => n1947, Y => n1956);
   U1944 : iv110 port map( A => n2089, Y => n1947);
   U1945 : na210 port map( A => n2737, B => n2738, Y => clear_shift_start);
   U1946 : na210 port map( A => cur_clear_shift_start, B => n2460, Y => n2738);
   U1947 : na310 port map( A => n2237, B => n2457, C => n2160, Y => n2460);
   U1948 : no210 port map( A => n2089, B => n2188, Y => n2160);
   U1949 : na210 port map( A => n2032, B => n1930, Y => n2089);
   U1950 : iv110 port map( A => n2247, Y => n2237);
   U1951 : na210 port map( A => n2245, B => n2457, Y => n2737);
   U1952 : na210 port map( A => n1889, B => n2739, Y => n2457);
   U1953 : na210 port map( A => n1946, B => n1974, Y => n2739);
   U1954 : iv110 port map( A => n2020, Y => n1946);
   U1955 : no210 port map( A => n2247, B => n1888, Y => n2245);
   U1956 : na210 port map( A => n2015, B => n2289, Y => n2247);
   U1957 : na210 port map( A => n2740, B => n2741, Y => check_start);
   U1958 : na210 port map( A => cur_check_start, B => n2409, Y => n2741);
   U1959 : na310 port map( A => n2071, B => n2289, C => n2092, Y => n2409);
   U1960 : na210 port map( A => n1889, B => n1940, Y => n2289);
   U1961 : na210 port map( A => cur_state_0_port, B => n1940, Y => n2071);
   U1962 : na210 port map( A => n2406, B => n2092, Y => n2740);
   U1963 : na210 port map( A => n1891, B => n1930, Y => n2092);
   U1964 : na310 port map( A => n2742, B => n2743, C => n2744, Y => n2406);
   U1965 : no210 port map( A => n2745, B => n2746, Y => n2744);
   U1966 : no310 port map( A => n1969, B => n1940, C => n2718, Y => n2746);
   U1967 : na210 port map( A => n1885, B => cur_state_4_port, Y => n1969);
   U1968 : no310 port map( A => n2020, B => n2032, C => n2015, Y => n2745);
   U1969 : na210 port map( A => n1891, B => n1880, Y => n2015);
   U1970 : na210 port map( A => n1885, B => n1949, Y => n2020);
   U1971 : na210 port map( A => n2747, B => n2169, Y => n2743);
   U1972 : iv110 port map( A => n1927, Y => n2169);
   U1973 : na210 port map( A => n2078, B => n1892, Y => n1927);
   U1974 : na210 port map( A => cur_check_start, B => n2748, Y => n2742);
   U1975 : na310 port map( A => n2749, B => n2750, C => n2751, Y => n2748);
   U1976 : no310 port map( A => n2752, B => n2045, C => n2753, Y => n2751);
   U1977 : no210 port map( A => n2078, B => n2074, Y => n2753);
   U1978 : na210 port map( A => n1891, B => n1892, Y => n2074);
   U1979 : iv110 port map( A => n2167, Y => n2078);
   U1980 : na210 port map( A => cur_state_4_port, B => n2034, Y => n2167);
   U1981 : iv110 port map( A => n2704, Y => n2045);
   U1982 : na210 port map( A => n1974, B => n1949, Y => n2704);
   U1983 : iv110 port map( A => n2047, Y => n1974);
   U1984 : na210 port map( A => n1892, B => n1930, Y => n2047);
   U1985 : iv110 port map( A => cur_state_0_port, Y => n1930);
   U1986 : no210 port map( A => n2728, B => n2369, Y => n2752);
   U1987 : na210 port map( A => n2032, B => n2188, Y => n2369);
   U1988 : na210 port map( A => n1929, B => n1995, Y => n2188);
   U1989 : iv110 port map( A => cur_state_6_port, Y => n1995);
   U1990 : iv110 port map( A => n2102, Y => n1929);
   U1991 : iv110 port map( A => n2747, Y => n2728);
   U1992 : no210 port map( A => n2021, B => cur_state_0_port, Y => n2747);
   U1993 : na210 port map( A => n1940, B => n1888, Y => n2021);
   U1994 : iv110 port map( A => n1891, Y => n1940);
   U1995 : na210 port map( A => n2326, B => n2102, Y => n2750);
   U1996 : na210 port map( A => n1949, B => n2034, Y => n2102);
   U1997 : iv110 port map( A => n1885, Y => n2034);
   U1998 : iv110 port map( A => cur_state_4_port, Y => n1949);
   U1999 : iv110 port map( A => n2007, Y => n2326);
   U2000 : na210 port map( A => n1891, B => n2032, Y => n2007);
   U2001 : na210 port map( A => n1891, B => n1990, Y => n2749);
   U2002 : na210 port map( A => n2718, B => n1984, Y => n1990);
   U2003 : na210 port map( A => n1889, B => n1892, Y => n1984);
   U2004 : na210 port map( A => n2032, B => n1880, Y => n2718);
   U2005 : iv110 port map( A => n1892, Y => n2032);

end synthesised;



