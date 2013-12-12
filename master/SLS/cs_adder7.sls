extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_adder7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, 
                            i_6_0_1, i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, 
                            o_6_0_3, o_6_0_2, o_6_0_1, o_6_0_0, vss, vdd)
{
   net {o_6_0_6, o_6_port};
   net {o_6_0_5, o_5_port};
   net {o_6_0_4, o_4_port};
   net {o_6_0_3, o_3_port};
   net {o_6_0_2, i_6_0_2};
   net {o_6_0_1, i_6_0_1};
   net {o_6_0_0, i_6_0_0};
   {U7} ex210 (i_6_0_6, n5, o_6_port, vss, vdd);
   {U8} no210 (i_6_0_5, n6, n5, vss, vdd);
   {U9} ex210 (i_6_0_5, n7, o_5_port, vss, vdd);
   {U10} na210 (n6, n8, o_4_port, vss, vdd);
   {U11} na210 (i_6_0_4, i_6_0_3, n8, vss, vdd);
   {U12} iv110 (n7, n6, vss, vdd);
   {U13} no210 (i_6_0_4, i_6_0_3, n7, vss, vdd);
   {U14} iv110 (i_6_0_3, o_3_port, vss, vdd);
}



