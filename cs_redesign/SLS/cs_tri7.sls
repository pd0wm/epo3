extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_tri7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, i_6_0_1, 
                          i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, o_6_0_3, o_6_0_2, 
                          o_6_0_1, o_6_0_0, e, vss, vdd)
{
   {o_tri_0_inst} tinv10 (n7, e, o_6_0_0, vss, vdd);
   {o_tri_1_inst} tinv10 (n6, e, o_6_0_1, vss, vdd);
   {o_tri_2_inst} tinv10 (n5, e, o_6_0_2, vss, vdd);
   {o_tri_3_inst} tinv10 (n4, e, o_6_0_3, vss, vdd);
   {o_tri_4_inst} tinv10 (n3, e, o_6_0_4, vss, vdd);
   {o_tri_5_inst} tinv10 (n2, e, o_6_0_5, vss, vdd);
   {o_tri_6_inst} tinv10 (n1, e, o_6_0_6, vss, vdd);
   {U8} iv110 (i_6_0_0, n7, vss, vdd);
   {U9} iv110 (i_6_0_1, n6, vss, vdd);
   {U10} iv110 (i_6_0_2, n5, vss, vdd);
   {U11} iv110 (i_6_0_3, n4, vss, vdd);
   {U12} iv110 (i_6_0_4, n3, vss, vdd);
   {U13} iv110 (i_6_0_5, n2, vss, vdd);
   {U14} iv110 (i_6_0_6, n1, vss, vdd);
}



