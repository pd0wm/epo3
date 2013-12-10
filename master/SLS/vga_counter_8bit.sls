extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_counter_8bit (terminal clk, rst, rst_ext, en, val_7_0_7, val_7_0_6, 
                                   val_7_0_5, val_7_0_4, val_7_0_3, val_7_0_2, 
                                   val_7_0_1, val_7_0_0, vss, vdd)
{
   net {val_7_0_7, val_7_port};
   net {val_7_0_6, val_6_port};
   net {val_7_0_5, val_5_port};
   net {val_7_0_4, val_4_port};
   net {val_7_0_3, val_3_port};
   net {val_7_0_2, val_2_port};
   net {val_7_0_1, val_1_port};
   net {val_7_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n26, n42, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n25, n42, clk, val_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n24, n42, clk, val_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n23, n42, clk, val_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n22, n42, clk, val_4_port, vss, vdd);
   {state_reg_5_inst} dfr11 (n21, n42, clk, val_5_port, vss, vdd);
   {state_reg_6_inst} dfr11 (n20, n42, clk, val_6_port, vss, vdd);
   {state_reg_7_inst} dfr11 (n19, n42, clk, val_7_port, vss, vdd);
   {U30} iv110 (n28, n42, vss, vdd);
   {U31} no210 (rst, rst_ext, n28, vss, vdd);
   {U32} ex210 (val_0_port, en, n26, vss, vdd);
   {U33} ex210 (n29, n30, n25, vss, vdd);
   {U34} ex210 (val_2_port, n31, n24, vss, vdd);
   {U35} no210 (n29, n30, n31, vss, vdd);
   {U36} na210 (en, val_0_port, n30, vss, vdd);
   {U37} iv110 (val_1_port, n29, vss, vdd);
   {U38} ex210 (val_3_port, n32, n23, vss, vdd);
   {U39} iv110 (n33, n22, vss, vdd);
   {U40} ex210 (val_4_port, n34, n33, vss, vdd);
   {U41} na210 (n32, val_3_port, n34, vss, vdd);
   {U42} ex210 (val_5_port, n35, n21, vss, vdd);
   {U43} ex210 (n36, n37, n20, vss, vdd);
   {U44} ex210 (val_7_port, n38, n19, vss, vdd);
   {U45} no210 (n36, n37, n38, vss, vdd);
   {U46} na210 (n35, val_5_port, n37, vss, vdd);
   {U47} iv110 (n39, n35, vss, vdd);
   {U48} na310 (val_4_port, val_3_port, n32, n39, vss, vdd);
   {U49} no210 (n40, n41, n32, vss, vdd);
   {U50} na310 (val_1_port, val_0_port, val_2_port, n41, vss, vdd);
   {U51} iv110 (en, n40, vss, vdd);
   {U52} iv110 (val_6_port, n36, vss, vdd);
}



