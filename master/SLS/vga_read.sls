extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
network vga_read (terminal clk, rst, in_field_in, in_np_in, in_score_in, 
                           data_in, h_sync_in, v_sync_in, h_sync_out, 
                           v_sync_out, red_out, green_out, blue_out, vss, vdd)
{
   {h_sync_buf_reg} dfa11 (h_sync_in, clk, rst, h_sync_buf, vss, vdd);
   {v_sync_buf_reg} dfa11 (v_sync_in, clk, rst, v_sync_buf, vss, vdd);
   {in_field_buf_reg} dfa11 (in_field_in, clk, rst, in_field_buf, vss, vdd);
   {in_np_buf_reg} dfa11 (in_np_in, clk, rst, in_np_buf, vss, vdd);
   {in_score_buf_reg} dfa11 (in_score_in, clk, rst, in_score_buf, vss, vdd);
   {v_sync_out_reg} dfa11 (v_sync_buf, clk, rst, v_sync_out, vss, vdd);
   {red_out_reg} dfa11 (red_next, clk, rst, red_out, vss, vdd);
   {green_out_reg} dfa11 (red_next, clk, rst, green_out, vss, vdd);
   {blue_out_reg} dfa11 (n1, clk, rst, blue_out, vss, vdd);
   {h_sync_out_reg} dfa11 (h_sync_buf, clk, rst, h_sync_out, vss, vdd);
   {U6} no210 (data_in, n3, red_next, vss, vdd);
   {U7} iv110 (n3, n1, vss, vdd);
   {U8} no310 (in_field_buf, in_score_buf, in_np_buf, n3, vss, vdd);
}



