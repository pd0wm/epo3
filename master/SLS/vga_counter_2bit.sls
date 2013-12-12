extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_counter_2bit (terminal clk, rst, rst_ext, en, val_1_0_1, val_1_0_0, 
                                   vss, vdd)
{
   net {val_1_0_1, val_1_port};
   net {val_1_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n5, n6, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n4, n6, clk, val_1_port, vss, vdd);
   {U9} iv110 (n7, n6, vss, vdd);
   {U10} no210 (rst, rst_ext, n7, vss, vdd);
   {U11} ex210 (val_0_port, en, n5, vss, vdd);
   {U12} ex210 (n8, n9, n4, vss, vdd);
   {U13} na210 (val_0_port, en, n9, vss, vdd);
   {U14} iv110 (val_1_port, n8, vss, vdd);
}



