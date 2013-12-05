extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network tri_buff (terminal sel, inp_7_0_7, inp_7_0_6, inp_7_0_5, inp_7_0_4, 
                           inp_7_0_3, inp_7_0_2, inp_7_0_1, inp_7_0_0, 
                           outp_7_0_7, outp_7_0_6, outp_7_0_5, outp_7_0_4, 
                           outp_7_0_3, outp_7_0_2, outp_7_0_1, outp_7_0_0, vss, 
                           vdd)
{
   {outp_tri_0_inst} tinv10 (n8, sel, outp_7_0_0, vss, vdd);
   {outp_tri_1_inst} tinv10 (n7, sel, outp_7_0_1, vss, vdd);
   {outp_tri_2_inst} tinv10 (n6, sel, outp_7_0_2, vss, vdd);
   {outp_tri_3_inst} tinv10 (n5, sel, outp_7_0_3, vss, vdd);
   {outp_tri_4_inst} tinv10 (n4, sel, outp_7_0_4, vss, vdd);
   {outp_tri_5_inst} tinv10 (n3, sel, outp_7_0_5, vss, vdd);
   {outp_tri_6_inst} tinv10 (n2, sel, outp_7_0_6, vss, vdd);
   {outp_tri_7_inst} tinv10 (n1, sel, outp_7_0_7, vss, vdd);
   {U9} iv110 (inp_7_0_0, n8, vss, vdd);
   {U10} iv110 (inp_7_0_1, n7, vss, vdd);
   {U11} iv110 (inp_7_0_2, n6, vss, vdd);
   {U12} iv110 (inp_7_0_3, n5, vss, vdd);
   {U13} iv110 (inp_7_0_4, n4, vss, vdd);
   {U14} iv110 (inp_7_0_5, n3, vss, vdd);
   {U15} iv110 (inp_7_0_6, n2, vss, vdd);
   {U16} iv110 (inp_7_0_7, n1, vss, vdd);
}



