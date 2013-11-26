extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network checkmask (terminal clk, reset, data, start, ram_in_7_0_7, 
                            ram_in_7_0_6, ram_in_7_0_5, ram_in_7_0_4, 
                            ram_in_7_0_3, ram_in_7_0_2, ram_in_7_0_1, 
                            ram_in_7_0_0, write, ready, empty, ram_out_7_0_7, 
                            ram_out_7_0_6, ram_out_7_0_5, ram_out_7_0_4, 
                            ram_out_7_0_3, ram_out_7_0_2, ram_out_7_0_1, 
                            ram_out_7_0_0, vss, vdd)
{
   net {ready, ready_port};
   net {write, vss};
   {state_reg_0_inst} dfr11 (next_state_0_port, reset, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, reset, clk, state_1_port, vss, 
                             vdd);
   {ram_out_tri_0_inst} tinv10 (n10, state_1_port, ram_out_7_0_0, vss, vdd);
   {ram_out_tri_1_inst} tinv10 (n9, state_1_port, ram_out_7_0_1, vss, vdd);
   {ram_out_tri_2_inst} tinv10 (n8, state_1_port, ram_out_7_0_2, vss, vdd);
   {ram_out_tri_3_inst} tinv10 (n7, state_1_port, ram_out_7_0_3, vss, vdd);
   {ram_out_tri_4_inst} tinv10 (n6, state_1_port, ram_out_7_0_4, vss, vdd);
   {ram_out_tri_5_inst} tinv10 (n5, state_1_port, ram_out_7_0_5, vss, vdd);
   {ram_out_tri_6_inst} tinv10 (n4, state_1_port, ram_out_7_0_6, vss, vdd);
   {ram_out_tri_7_inst} tinv10 (n3, state_1_port, ram_out_7_0_7, vss, vdd);
   {empty_tri} tinv10 (data, ready_port, empty, vss, vdd);
   {U16} iv110 (n12, ready_port, vss, vdd);
   {U17} na210 (state_0_port, state_1_port, n12, vss, vdd);
   {U18} ex210 (state_1_port, state_0_port, next_state_1_port, vss, vdd);
   {U19} no210 (state_0_port, n13, next_state_0_port, vss, vdd);
   {U20} no210 (start, state_1_port, n13, vss, vdd);
   {U21} iv110 (ram_in_7_0_1, n9, vss, vdd);
   {U22} iv110 (ram_in_7_0_2, n8, vss, vdd);
   {U23} iv110 (ram_in_7_0_3, n7, vss, vdd);
   {U24} iv110 (ram_in_7_0_4, n6, vss, vdd);
   {U25} iv110 (ram_in_7_0_5, n5, vss, vdd);
   {U26} iv110 (ram_in_7_0_6, n4, vss, vdd);
   {U27} iv110 (ram_in_7_0_7, n3, vss, vdd);
   {U28} iv110 (ram_in_7_0_0, n10, vss, vdd);
}



