extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_counter_3bit (terminal clk, rst, rst_ext, en, val_2_0_2, val_2_0_1, 
                                   val_2_0_0, vss, vdd)
{
   net {val_2_0_2, val_2_port};
   net {val_2_0_1, val_1_port};
   net {val_2_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n7, n8, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n6, n8, clk, val_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n5, n8, clk, val_2_port, vss, vdd);
   {U11} iv110 (n9, n8, vss, vdd);
   {U12} no210 (rst, rst_ext, n9, vss, vdd);
   {U13} ex210 (val_0_port, en, n7, vss, vdd);
   {U14} ex210 (n10, n11, n6, vss, vdd);
   {U15} ex210 (val_2_port, n12, n5, vss, vdd);
   {U16} no210 (n10, n11, n12, vss, vdd);
   {U17} na210 (en, val_0_port, n11, vss, vdd);
   {U18} iv110 (val_1_port, n10, vss, vdd);
}



