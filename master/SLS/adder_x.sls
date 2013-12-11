extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network adder_x (terminal x_2_0_2, x_2_0_1, x_2_0_0, rom_data_1_0_1, 
                          rom_data_1_0_0, next_piece, x_out_3_0_3, x_out_3_0_2, 
                          x_out_3_0_1, x_out_3_0_0, vss, vdd)
{
   {U19} na210 (n21, n22, x_out_3_0_3, vss, vdd);
   {U20} na210 (n23, n24, n22, vss, vdd);
   {U21} na210 (x_2_0_2, n25, n21, vss, vdd);
   {U22} ex210 (n24, n23, x_out_3_0_2, vss, vdd);
   {U23} no310 (n26, rom_data_1_0_1, n27, n23, vss, vdd);
   {U24} iv110 (next_piece, n26, vss, vdd);
   {U25} ex210 (n25, x_2_0_2, n24, vss, vdd);
   {U26} na210 (n28, n29, n25, vss, vdd);
   {U27} na310 (rom_data_1_0_0, n30, x_2_0_0, n29, vss, vdd);
   {U28} na210 (rom_data_1_0_1, x_2_0_1, n28, vss, vdd);
   {U29} ex210 (n31, n30, x_out_3_0_1, vss, vdd);
   {U30} ex210 (rom_data_1_0_1, x_2_0_1, n30, vss, vdd);
   {U31} no210 (n27, n32, n31, vss, vdd);
   {U32} ex210 (n32, n27, x_out_3_0_0, vss, vdd);
   {U33} iv110 (rom_data_1_0_0, n27, vss, vdd);
   {U34} iv110 (x_2_0_0, n32, vss, vdd);
}



