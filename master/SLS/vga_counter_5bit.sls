extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_counter_5bit (terminal clk, rst, rst_ext, en, val_4_0_4, val_4_0_3, 
                                   val_4_0_2, val_4_0_1, val_4_0_0, vss, vdd)
{
   net {val_4_0_4, val_4_port};
   net {val_4_0_3, val_3_port};
   net {val_4_0_2, val_2_port};
   net {val_4_0_1, val_1_port};
   net {val_4_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n17, n27, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n16, n27, clk, val_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n15, n27, clk, val_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n14, n27, clk, val_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n13, n27, clk, val_4_port, vss, vdd);
   {U21} iv110 (n19, n27, vss, vdd);
   {U22} no210 (rst, rst_ext, n19, vss, vdd);
   {U23} ex210 (val_0_port, en, n17, vss, vdd);
   {U24} ex210 (n20, n21, n16, vss, vdd);
   {U25} ex210 (val_2_port, n22, n15, vss, vdd);
   {U26} no210 (n20, n21, n22, vss, vdd);
   {U27} iv110 (val_1_port, n20, vss, vdd);
   {U28} ex210 (n23, n24, n14, vss, vdd);
   {U29} ex210 (val_4_port, n25, n13, vss, vdd);
   {U30} no210 (n23, n24, n25, vss, vdd);
   {U31} na310 (val_2_port, val_1_port, n26, n24, vss, vdd);
   {U32} iv110 (n21, n26, vss, vdd);
   {U33} na210 (val_0_port, en, n21, vss, vdd);
   {U34} iv110 (val_3_port, n23, vss, vdd);
}



