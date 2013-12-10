extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network mu210 (terminal A, B, C, D, S1, S2, Y, vss, vdd)
network mux5 (terminal di_4_0_4, di_4_0_3, di_4_0_2, di_4_0_1, di_4_0_0, do, 
                       s_2_0_2, s_2_0_1, s_2_0_0, vss, vdd)
{
   {U16} mu111 (n15, di_4_0_4, s_2_0_2, do, vss, vdd);
   {U17} mu210 (di_4_0_0, di_4_0_2, di_4_0_1, di_4_0_3, s_2_0_1, s_2_0_0, n15, 
                vss, vdd);
}



