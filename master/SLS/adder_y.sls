extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network adder_y (terminal y_3_0_3, y_3_0_2, y_3_0_1, y_3_0_0, rom_data_1_0_1, 
                          rom_data_1_0_0, next_piece, y_out_4_0_4, y_out_4_0_3, 
                          y_out_4_0_2, y_out_4_0_1, y_out_4_0_0, vss, vdd)
{
   {U22} no310 (n20, n21, n22, y_out_4_0_4, vss, vdd);
   {U23} ex210 (n21, n23, y_out_4_0_3, vss, vdd);
   {U24} ex210 (n20, n22, n23, vss, vdd);
   {U25} na210 (y_3_0_2, n24, n22, vss, vdd);
   {U26} iv110 (y_3_0_3, n20, vss, vdd);
   {U27} na210 (n25, n26, y_out_4_0_2, vss, vdd);
   {U28} na210 (n27, n28, n26, vss, vdd);
   {U29} na210 (n29, n30, n28, vss, vdd);
   {U30} iv110 (n21, n25, vss, vdd);
   {U31} no310 (n31, n27, n32, n21, vss, vdd);
   {U32} na210 (n33, n30, n32, vss, vdd);
   {U33} iv110 (n34, n33, vss, vdd);
   {U34} ex210 (n24, y_3_0_2, n27, vss, vdd);
   {U35} na210 (n35, n36, n24, vss, vdd);
   {U36} na310 (rom_data_1_0_0, n37, y_3_0_0, n36, vss, vdd);
   {U37} na210 (rom_data_1_0_1, y_3_0_1, n35, vss, vdd);
   {U38} ex210 (n38, n30, y_out_4_0_1, vss, vdd);
   {U39} ex210 (n39, n37, n30, vss, vdd);
   {U40} ex210 (rom_data_1_0_1, y_3_0_1, n37, vss, vdd);
   {U41} na210 (y_3_0_0, rom_data_1_0_0, n39, vss, vdd);
   {U42} na210 (n38, n40, y_out_4_0_0, vss, vdd);
   {U43} na210 (n31, n34, n40, vss, vdd);
   {U44} iv110 (n29, n38, vss, vdd);
   {U45} no210 (n34, n31, n29, vss, vdd);
   {U46} ex210 (y_3_0_0, rom_data_1_0_0, n31, vss, vdd);
   {U47} na310 (rom_data_1_0_0, n41, next_piece, n34, vss, vdd);
   {U48} iv110 (rom_data_1_0_1, n41, vss, vdd);
}



