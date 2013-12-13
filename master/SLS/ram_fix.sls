extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network ram_fix (terminal draw_erase_start, draw_score_draw, clear_shift_start, 
                          check_start, we, vss, vdd)
{
   {we_tri} tinv10 (n1, n4, we, vss, vdd);
   net {n1, vdd};
   {U6} no310 (n5, clear_shift_start, check_start, n4, vss, vdd);
   {U7} iv110 (n6, n5, vss, vdd);
   {U8} no210 (draw_score_draw, draw_erase_start, n6, vss, vdd);
}



