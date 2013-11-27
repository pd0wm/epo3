extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network dec8 (terminal do_7_0_7, do_7_0_6, do_7_0_5, do_7_0_4, do_7_0_3, 
                       do_7_0_2, do_7_0_1, do_7_0_0, s_2_0_2, s_2_0_1, s_2_0_0, 
                       vss, vdd)
{
   {U17} no210 (s_2_0_0, n15, do_7_0_6, vss, vdd);
   {U18} no210 (n16, n17, do_7_0_5, vss, vdd);
   {U19} no210 (s_2_0_0, n16, do_7_0_4, vss, vdd);
   {U20} no210 (n17, n18, do_7_0_3, vss, vdd);
   {U21} no210 (s_2_0_0, n18, do_7_0_2, vss, vdd);
   {U22} no310 (n19, n20, n17, do_7_0_1, vss, vdd);
   {U23} no310 (n19, s_2_0_0, n20, do_7_0_0, vss, vdd);
   {U24} iv110 (n15, n20, vss, vdd);
   {U25} na210 (n16, n18, n19, vss, vdd);
   {U26} na210 (s_2_0_1, n21, n18, vss, vdd);
   {U27} iv110 (n22, n16, vss, vdd);
   {U28} no210 (n21, s_2_0_1, n22, vss, vdd);
   {U29} iv110 (s_2_0_2, n21, vss, vdd);
   {U30} no210 (n15, n17, do_7_0_7, vss, vdd);
   {U31} iv110 (s_2_0_0, n17, vss, vdd);
   {U32} na210 (s_2_0_2, s_2_0_1, n15, vss, vdd);
}



