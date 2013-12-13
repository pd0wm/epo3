extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network timer_counter (terminal clk, rst, rst2, value_4_0_4, value_4_0_3, 
                                value_4_0_2, value_4_0_1, value_4_0_0, en, vss, 
                                vdd)
{
   net {value_4_0_4, value_4_port};
   net {value_4_0_3, value_3_port};
   net {value_4_0_2, value_2_port};
   net {value_4_0_1, value_1_port};
   net {value_4_0_0, value_0_port};
   {state_reg_0_inst} dfr11 (n17, n27, clk, value_0_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n16, n27, clk, value_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (n15, n27, clk, value_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n14, n27, clk, value_3_port, vss, vdd);
   {state_reg_4_inst} dfr11 (n13, n27, clk, value_4_port, vss, vdd);
   {U21} iv110 (n19, n27, vss, vdd);
   {U22} no210 (rst, rst2, n19, vss, vdd);
   {U23} ex210 (value_0_port, en, n17, vss, vdd);
   {U24} ex210 (n20, n21, n16, vss, vdd);
   {U25} ex210 (value_2_port, n22, n15, vss, vdd);
   {U26} no210 (n20, n21, n22, vss, vdd);
   {U27} iv110 (value_1_port, n20, vss, vdd);
   {U28} ex210 (n23, n24, n14, vss, vdd);
   {U29} ex210 (value_4_port, n25, n13, vss, vdd);
   {U30} no210 (n23, n24, n25, vss, vdd);
   {U31} na310 (value_2_port, value_1_port, n26, n24, vss, vdd);
   {U32} iv110 (n21, n26, vss, vdd);
   {U33} na210 (value_0_port, en, n21, vss, vdd);
   {U34} iv110 (value_3_port, n23, vss, vdd);
}



