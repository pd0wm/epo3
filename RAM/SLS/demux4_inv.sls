extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network demux4_inv (terminal di, do_3_0_3, do_3_0_2, do_3_0_1, do_3_0_0, 
                             s_1_0_1, s_1_0_0, vss, vdd)
{
   {U8} na310 (s_1_0_0, di, s_1_0_1, do_3_0_3, vss, vdd);
   {U9} na310 (di, n3, s_1_0_1, do_3_0_2, vss, vdd);
   {U10} na310 (di, n4, s_1_0_0, do_3_0_1, vss, vdd);
   {U11} na310 (n3, n4, di, do_3_0_0, vss, vdd);
   {U12} iv110 (s_1_0_1, n4, vss, vdd);
   {U13} iv110 (s_1_0_0, n3, vss, vdd);
}



