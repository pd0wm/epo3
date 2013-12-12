extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network adder_x (terminal x_2_0_2, x_2_0_1, x_2_0_0, rom_data_3_0_3, 
                          rom_data_3_0_2, rom_data_3_0_1, rom_data_3_0_0, 
                          next_piece, x_out_3_0_3, x_out_3_0_2, x_out_3_0_1, 
                          x_out_3_0_0, vss, vdd)
{
   {U19} na210 (n22, n23, x_out_3_0_3, vss, vdd);
   {U20} na210 (n24, n25, n23, vss, vdd);
   {U21} na210 (x_2_0_2, n26, n22, vss, vdd);
   {U22} ex210 (n25, n24, x_out_3_0_2, vss, vdd);
   {U23} no310 (n27, rom_data_3_0_3, n28, n24, vss, vdd);
   {U24} iv110 (rom_data_3_0_2, n28, vss, vdd);
   {U25} iv110 (next_piece, n27, vss, vdd);
   {U26} ex210 (n26, x_2_0_2, n25, vss, vdd);
   {U27} na210 (n29, n30, n26, vss, vdd);
   {U28} na310 (rom_data_3_0_0, n31, x_2_0_0, n30, vss, vdd);
   {U29} na210 (rom_data_3_0_1, x_2_0_1, n29, vss, vdd);
   {U30} iv110 (n32, x_out_3_0_1, vss, vdd);
   {U31} ex210 (n33, n31, n32, vss, vdd);
   {U32} ex210 (rom_data_3_0_1, x_2_0_1, n31, vss, vdd);
   {U33} na210 (rom_data_3_0_0, x_2_0_0, n33, vss, vdd);
   {U34} ex210 (x_2_0_0, rom_data_3_0_0, x_out_3_0_0, vss, vdd);
}



