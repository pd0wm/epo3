extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network timer_det (terminal cnt_val_4_0_4, cnt_val_4_0_3, cnt_val_4_0_2, 
                            cnt_val_4_0_1, cnt_val_4_0_0, time, done, vss, vdd)
{
   {U12} no210 (n11, n12, done, vss, vdd);
   {U13} mu111 (n13, n14, time, n12, vss, vdd);
   {U14} na310 (cnt_val_4_0_4, cnt_val_4_0_3, n15, n14, vss, vdd);
   {U15} no210 (cnt_val_4_0_0, n16, n15, vss, vdd);
   {U16} na310 (cnt_val_4_0_0, n16, n17, n13, vss, vdd);
   {U17} no210 (cnt_val_4_0_4, cnt_val_4_0_3, n17, vss, vdd);
   {U18} iv110 (cnt_val_4_0_2, n16, vss, vdd);
   {U19} iv110 (cnt_val_4_0_1, n11, vss, vdd);
}



