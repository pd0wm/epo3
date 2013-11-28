extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network demux8_inv (terminal di, do_7_0_7, do_7_0_6, do_7_0_5, do_7_0_4, 
                             do_7_0_3, do_7_0_2, do_7_0_1, do_7_0_0, s_2_0_2, 
                             s_2_0_1, s_2_0_0, vss, vdd)
{
   {U23} na310 (di, s_2_0_2, n22, do_7_0_7, vss, vdd);
   {U24} no210 (n23, n24, n22, vss, vdd);
   {U25} na310 (s_2_0_1, n23, n25, do_7_0_6, vss, vdd);
   {U26} na310 (s_2_0_0, n26, n25, do_7_0_5, vss, vdd);
   {U27} na310 (n23, n26, n25, do_7_0_4, vss, vdd);
   {U28} no210 (n27, n28, n25, vss, vdd);
   {U29} na210 (n29, s_2_0_0, do_7_0_3, vss, vdd);
   {U30} na210 (n29, n23, do_7_0_2, vss, vdd);
   {U31} no310 (n26, s_2_0_2, n27, n29, vss, vdd);
   {U32} iv110 (s_2_0_1, n26, vss, vdd);
   {U33} na310 (di, s_2_0_0, n30, do_7_0_1, vss, vdd);
   {U34} no210 (s_2_0_2, s_2_0_1, n30, vss, vdd);
   {U35} na310 (n23, n28, n31, do_7_0_0, vss, vdd);
   {U36} no210 (n27, n24, n31, vss, vdd);
   {U37} ex210 (s_2_0_1, s_2_0_0, n24, vss, vdd);
   {U38} iv110 (di, n27, vss, vdd);
   {U39} iv110 (s_2_0_2, n28, vss, vdd);
   {U40} iv110 (s_2_0_0, n23, vss, vdd);
}



