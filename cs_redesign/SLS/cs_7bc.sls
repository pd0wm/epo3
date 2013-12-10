extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_7bc (terminal clk, rst, en, value_6_0_6, value_6_0_5, value_6_0_4, 
                         value_6_0_3, value_6_0_2, value_6_0_1, value_6_0_0, 
                         vss, vdd)
{
   net {value_6_0_6, value_6_port};
   net {value_6_0_5, value_5_port};
   net {value_6_0_4, value_4_port};
   net {value_6_0_3, value_3_port};
   net {value_6_0_2, value_2_port};
   net {value_6_0_1, value_1_port};
   net {value_6_0_0, value_0_port};
   {state_reg_0_inst} dfr11 (n22, rst, clk, value_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n21, rst, clk, value_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n20, rst, clk, value_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n19, rst, clk, value_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n18, rst, clk, value_4_port, vss, vdd);
   {state_reg_5_inst} dfr11 (n17, rst, clk, value_5_port, vss, vdd);
   {state_reg_6_inst} dfr11 (n16, rst, clk, value_6_port, vss, vdd);
   {U25} ex210 (value_0_port, en, n22, vss, vdd);
   {U26} ex210 (n23, n24, n21, vss, vdd);
   {U27} ex210 (value_2_port, n25, n20, vss, vdd);
   {U28} no210 (n23, n24, n25, vss, vdd);
   {U29} na210 (en, value_0_port, n24, vss, vdd);
   {U30} iv110 (value_1_port, n23, vss, vdd);
   {U31} ex210 (value_3_port, n26, n19, vss, vdd);
   {U32} iv110 (n27, n18, vss, vdd);
   {U33} ex210 (value_4_port, n28, n27, vss, vdd);
   {U34} na210 (n26, value_3_port, n28, vss, vdd);
   {U35} ex210 (n29, n30, n17, vss, vdd);
   {U36} ex210 (value_6_port, n31, n16, vss, vdd);
   {U37} no210 (n29, n30, n31, vss, vdd);
   {U38} na310 (value_4_port, value_3_port, n26, n30, vss, vdd);
   {U39} no210 (n32, n33, n26, vss, vdd);
   {U40} na310 (value_1_port, value_0_port, value_2_port, n33, vss, vdd);
   {U41} iv110 (en, n32, vss, vdd);
   {U42} iv110 (value_5_port, n29, vss, vdd);
}



