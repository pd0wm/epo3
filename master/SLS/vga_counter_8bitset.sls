extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
network vga_counter_8bitset (terminal clk, rst, rst_ext, en, set, di_7_0_7, 
                                      di_7_0_6, di_7_0_5, di_7_0_4, di_7_0_3, 
                                      di_7_0_2, di_7_0_1, di_7_0_0, val_7_0_7, 
                                      val_7_0_6, val_7_0_5, val_7_0_4, 
                                      val_7_0_3, val_7_0_2, val_7_0_1, 
                                      val_7_0_0, vss, vdd)
{
   net {val_7_0_7, val_7_port};
   net {val_7_0_6, val_6_port};
   net {val_7_0_5, val_5_port};
   net {val_7_0_4, val_4_port};
   net {val_7_0_3, val_3_port};
   net {val_7_0_2, val_2_port};
   net {val_7_0_1, val_1_port};
   net {val_7_0_0, val_0_port};
   {state_reg_0_inst} dfr11 (n36, n87, clk, val_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n35, n87, clk, val_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n34, n87, clk, val_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n33, n87, clk, val_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n32, n87, clk, val_4_port, vss, vdd);
   {state_reg_5_inst} dfr11 (n31, n87, clk, val_5_port, vss, vdd);
   {state_reg_6_inst} dfr11 (n30, n87, clk, val_6_port, vss, vdd);
   {state_reg_7_inst} dfr11 (n29, n87, clk, val_7_port, vss, vdd);
   {U39} iv110 (n37, n87, vss, vdd);
   {U40} no210 (rst, rst_ext, n37, vss, vdd);
   {U41} na210 (n38, n39, n36, vss, vdd);
   {U42} na210 (set, di_7_0_0, n39, vss, vdd);
   {U43} mu111 (n40, n41, val_0_port, n38, vss, vdd);
   {U44} na210 (n42, n43, n35, vss, vdd);
   {U45} na210 (di_7_0_1, set, n43, vss, vdd);
   {U46} mu111 (n44, n45, val_1_port, n42, vss, vdd);
   {U47} na210 (n46, val_0_port, n44, vss, vdd);
   {U48} na210 (n47, n48, n34, vss, vdd);
   {U49} na210 (di_7_0_2, set, n48, vss, vdd);
   {U50} mu111 (n49, n50, val_2_port, n47, vss, vdd);
   {U51} no210 (n51, n52, n50, vss, vdd);
   {U52} iv110 (n45, n52, vss, vdd);
   {U53} no210 (n53, n54, n45, vss, vdd);
   {U54} no210 (n40, val_0_port, n54, vss, vdd);
   {U55} no210 (val_1_port, n40, n51, vss, vdd);
   {U56} na310 (n46, val_0_port, val_1_port, n49, vss, vdd);
   {U57} na210 (n55, n56, n33, vss, vdd);
   {U58} na210 (di_7_0_3, set, n56, vss, vdd);
   {U59} mu111 (n57, n58, val_3_port, n55, vss, vdd);
   {U60} iv110 (n59, n58, vss, vdd);
   {U61} na210 (n60, n46, n57, vss, vdd);
   {U62} na210 (n61, n62, n32, vss, vdd);
   {U63} na210 (di_7_0_4, set, n62, vss, vdd);
   {U64} mu111 (n63, n64, val_4_port, n61, vss, vdd);
   {U65} no210 (n65, n59, n64, vss, vdd);
   {U66} na210 (n41, n66, n59, vss, vdd);
   {U67} na210 (n46, n67, n66, vss, vdd);
   {U68} iv110 (n53, n41, vss, vdd);
   {U69} no210 (val_3_port, n40, n65, vss, vdd);
   {U70} na310 (n60, n46, val_3_port, n63, vss, vdd);
   {U71} na210 (n68, n69, n31, vss, vdd);
   {U72} na210 (di_7_0_5, set, n69, vss, vdd);
   {U73} mu111 (n70, n71, n72, n68, vss, vdd);
   {U74} na210 (n73, n46, n71, vss, vdd);
   {U75} na210 (n74, n75, n30, vss, vdd);
   {U76} na210 (di_7_0_6, set, n75, vss, vdd);
   {U77} iv110 (n76, n74, vss, vdd);
   {U78} mu111 (n77, n78, val_6_port, n76, vss, vdd);
   {U79} na210 (n79, n80, n29, vss, vdd);
   {U80} na210 (di_7_0_7, set, n80, vss, vdd);
   {U81} mu111 (n81, n82, val_7_port, n79, vss, vdd);
   {U82} no210 (n83, n78, n82, vss, vdd);
   {U83} na210 (n70, n84, n78, vss, vdd);
   {U84} na210 (n46, n72, n84, vss, vdd);
   {U85} no210 (n53, n85, n70, vss, vdd);
   {U86} no210 (n40, n73, n85, vss, vdd);
   {U87} iv110 (n86, n73, vss, vdd);
   {U88} no210 (val_6_port, n40, n83, vss, vdd);
   {U89} na210 (n77, val_6_port, n81, vss, vdd);
   {U90} no310 (n86, n40, n72, n77, vss, vdd);
   {U91} iv110 (val_5_port, n72, vss, vdd);
   {U92} iv110 (n46, n40, vss, vdd);
   {U93} no210 (n53, set, n46, vss, vdd);
   {U94} no210 (set, en, n53, vss, vdd);
   {U95} na310 (val_3_port, n60, val_4_port, n86, vss, vdd);
   {U96} iv110 (n67, n60, vss, vdd);
   {U97} na310 (val_1_port, val_0_port, val_2_port, n67, vss, vdd);
}



