extern network no210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network demux5 (terminal di, do_4_0_4, do_4_0_3, do_4_0_2, do_4_0_1, do_4_0_0, 
                         s_2_0_2, s_2_0_1, s_2_0_0, vss, vdd)
{
   {U12} no210 (n6, n7, do_4_0_4, vss, vdd);
   {U13} iv110 (di, n6, vss, vdd);
   {U14} no310 (n8, n9, n10, do_4_0_3, vss, vdd);
   {U15} no310 (n8, s_2_0_0, n9, do_4_0_2, vss, vdd);
   {U16} iv110 (s_2_0_1, n8, vss, vdd);
   {U17} no310 (n10, s_2_0_1, n9, do_4_0_1, vss, vdd);
   {U18} iv110 (s_2_0_0, n10, vss, vdd);
   {U19} no310 (n9, s_2_0_1, s_2_0_0, do_4_0_0, vss, vdd);
   {U20} na210 (di, n7, n9, vss, vdd);
   {U21} iv110 (s_2_0_2, n7, vss, vdd);
}



