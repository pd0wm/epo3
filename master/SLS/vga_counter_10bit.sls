extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_counter_10bit (terminal clk, rst, rst_ext, en, val_9_0_9, 
                                    val_9_0_8, val_9_0_7, val_9_0_6, val_9_0_5, 
                                    val_9_0_4, val_9_0_3, val_9_0_2, val_9_0_1, 
                                    val_9_0_0, vss, vdd)
{
   net {val_9_0_9, val_9_port};
   net {val_9_0_8, val_8_port};
   net {val_9_0_7, val_7_port};
   net {val_9_0_6, val_6_port};
   net {val_9_0_5, val_5_port};
   net {val_9_0_4, val_4_port};
   net {val_9_0_3, val_3_port};
   net {val_9_0_2, val_2_port};
   net {val_9_0_1, val_1_port};
   net {val_9_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n32, n53, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n31, n53, clk, val_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n30, n53, clk, val_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n29, n53, clk, val_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n28, n53, clk, val_4_port, vss, vdd);
   {state_reg_5_inst} dfr11 (n27, n53, clk, val_5_port, vss, vdd);
   {state_reg_6_inst} dfr11 (n26, n53, clk, val_6_port, vss, vdd);
   {state_reg_7_inst} dfr11 (n25, n53, clk, val_7_port, vss, vdd);
   {state_reg_8_inst} dfr11 (n24, n53, clk, val_8_port, vss, vdd);
   {state_reg_9_inst} dfr11 (n23, n53, clk, val_9_port, vss, vdd);
   {U36} iv110 (n34, n53, vss, vdd);
   {U37} no210 (rst, rst_ext, n34, vss, vdd);
   {U38} ex210 (val_0_port, en, n32, vss, vdd);
   {U39} ex210 (n35, n36, n31, vss, vdd);
   {U40} ex210 (val_2_port, n37, n30, vss, vdd);
   {U41} no210 (n35, n36, n37, vss, vdd);
   {U42} na210 (en, val_0_port, n36, vss, vdd);
   {U43} iv110 (val_1_port, n35, vss, vdd);
   {U44} ex210 (val_3_port, n38, n29, vss, vdd);
   {U45} ex210 (n39, n40, n28, vss, vdd);
   {U46} na210 (n38, val_3_port, n40, vss, vdd);
   {U47} no210 (n41, n42, n38, vss, vdd);
   {U48} iv110 (val_4_port, n39, vss, vdd);
   {U49} ex210 (val_5_port, n43, n27, vss, vdd);
   {U50} iv110 (n44, n26, vss, vdd);
   {U51} ex210 (val_6_port, n45, n44, vss, vdd);
   {U52} na210 (val_5_port, n43, n45, vss, vdd);
   {U53} no210 (n46, n42, n43, vss, vdd);
   {U54} ex210 (val_7_port, n47, n25, vss, vdd);
   {U55} ex210 (n48, n49, n24, vss, vdd);
   {U56} ex210 (val_9_port, n50, n23, vss, vdd);
   {U57} no210 (n48, n49, n50, vss, vdd);
   {U58} na210 (n47, val_7_port, n49, vss, vdd);
   {U59} no310 (n46, n42, n51, n47, vss, vdd);
   {U60} na210 (val_5_port, val_6_port, n51, vss, vdd);
   {U61} iv110 (en, n42, vss, vdd);
   {U62} na310 (val_3_port, n52, val_4_port, n46, vss, vdd);
   {U63} iv110 (n41, n52, vss, vdd);
   {U64} na310 (val_1_port, val_0_port, val_2_port, n41, vss, vdd);
   {U65} iv110 (val_8_port, n48, vss, vdd);
}



