extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network vga_counter_4bit (terminal clk, rst, rst_ext, en, val_3_0_3, val_3_0_2, 
                                   val_3_0_1, val_3_0_0, vss, vdd)
{
   net {val_3_0_3, val_3_port};
   net {val_3_0_2, val_2_port};
   net {val_3_0_1, val_1_port};
   net {val_3_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n10, n11, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n9, n11, clk, val_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n8, n11, clk, val_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n7, n11, clk, val_3_port, vss, vdd);
   {U14} ex210 (n12, n13, n9, vss, vdd);
   {U15} na210 (val_0_port, en, n13, vss, vdd);
   {U16} iv110 (val_1_port, n12, vss, vdd);
   {U17} ex210 (n14, n15, n8, vss, vdd);
   {U18} ex210 (val_3_port, n16, n7, vss, vdd);
   {U19} no210 (n14, n15, n16, vss, vdd);
   {U20} na310 (val_0_port, en, val_1_port, n15, vss, vdd);
   {U21} iv110 (val_2_port, n14, vss, vdd);
   {U22} iv110 (n17, n11, vss, vdd);
   {U23} no210 (rst, rst_ext, n17, vss, vdd);
   {U24} ex210 (val_0_port, en, n10, vss, vdd);
}



