extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_7bcws (terminal clk, rst, en, set, value_6_0_6, value_6_0_5, 
                           value_6_0_4, value_6_0_3, value_6_0_2, value_6_0_1, 
                           value_6_0_0, data_6_0_6, data_6_0_5, data_6_0_4, 
                           data_6_0_3, data_6_0_2, data_6_0_1, data_6_0_0, vss, 
                           vdd)
{
   net {value_6_0_6, value_6_port};
   net {value_6_0_5, value_5_port};
   net {value_6_0_4, value_4_port};
   net {value_6_0_3, value_3_port};
   net {value_6_0_2, value_2_port};
   net {value_6_0_1, value_1_port};
   net {value_6_0_0, value_0_port};
   {state_reg_0_inst} dfr11 (n30, rst, clk, value_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n29, rst, clk, value_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n28, rst, clk, value_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n27, rst, clk, value_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n26, rst, clk, value_4_port, vss, vdd);
   {state_reg_5_inst} dfr11 (n25, rst, clk, value_5_port, vss, vdd);
   {state_reg_6_inst} dfr11 (n24, rst, clk, value_6_port, vss, vdd);
   {U33} na210 (n31, n32, n30, vss, vdd);
   {U34} na210 (data_6_0_0, n33, n32, vss, vdd);
   {U35} iv110 (n34, n31, vss, vdd);
   {U36} mu111 (n35, en, n36, n34, vss, vdd);
   {U37} na210 (n37, n38, n29, vss, vdd);
   {U38} na210 (data_6_0_1, n33, n38, vss, vdd);
   {U39} mu111 (n39, n40, value_1_port, n37, vss, vdd);
   {U40} na210 (en, n36, n39, vss, vdd);
   {U41} na310 (n41, n42, n43, n28, vss, vdd);
   {U42} na210 (value_2_port, n44, n42, vss, vdd);
   {U43} na210 (n40, n45, n44, vss, vdd);
   {U44} na210 (value_1_port, en, n45, vss, vdd);
   {U45} no210 (n35, n46, n40, vss, vdd);
   {U46} no210 (n47, n36, n46, vss, vdd);
   {U47} iv110 (value_0_port, n36, vss, vdd);
   {U48} na210 (data_6_0_2, n33, n41, vss, vdd);
   {U49} na210 (n48, n49, n27, vss, vdd);
   {U50} na210 (data_6_0_3, n33, n49, vss, vdd);
   {U51} mu111 (n43, n50, value_3_port, n48, vss, vdd);
   {U52} na210 (n51, en, n43, vss, vdd);
   {U53} na310 (n52, n53, n54, n26, vss, vdd);
   {U54} na210 (n55, en, n54, vss, vdd);
   {U55} na210 (value_4_port, n56, n53, vss, vdd);
   {U56} na210 (n50, n57, n56, vss, vdd);
   {U57} na210 (value_3_port, en, n57, vss, vdd);
   {U58} no210 (n35, n58, n50, vss, vdd);
   {U59} no210 (n47, n51, n58, vss, vdd);
   {U60} na210 (data_6_0_4, n33, n52, vss, vdd);
   {U61} na310 (n59, n60, n61, n25, vss, vdd);
   {U62} na210 (data_6_0_5, n33, n61, vss, vdd);
   {U63} na210 (value_5_port, n62, n59, vss, vdd);
   {U64} na210 (n63, n64, n24, vss, vdd);
   {U65} na210 (data_6_0_6, n33, n64, vss, vdd);
   {U66} no210 (n35, en, n33, vss, vdd);
   {U67} mu111 (n60, n65, value_6_port, n63, vss, vdd);
   {U68} no210 (n66, n62, n65, vss, vdd);
   {U69} iv110 (n67, n62, vss, vdd);
   {U70} no210 (n35, n68, n67, vss, vdd);
   {U71} no210 (n47, n55, n68, vss, vdd);
   {U72} no210 (set, en, n35, vss, vdd);
   {U73} no210 (n47, n69, n66, vss, vdd);
   {U74} iv110 (en, n47, vss, vdd);
   {U75} na310 (en, n69, n55, n60, vss, vdd);
   {U76} no310 (value_3_port, value_4_port, n70, n55, vss, vdd);
   {U77} iv110 (n51, n70, vss, vdd);
   {U78} no310 (value_1_port, value_2_port, value_0_port, n51, vss, vdd);
   {U79} iv110 (value_5_port, n69, vss, vdd);
}



