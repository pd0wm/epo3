extern network rom_mux2 (terminal data_1, data_2, selector, output, vss, vdd)
network rom_mux24 (terminal data_1_3_0_3, data_1_3_0_2, data_1_3_0_1, 
                            data_1_3_0_0, data_2_3_0_3, data_2_3_0_2, 
                            data_2_3_0_1, data_2_3_0_0, selector, output_3_0_3, 
                            output_3_0_2, output_3_0_1, output_3_0_0, vss, vdd)
{
   {bit1} rom_mux2 (data_1_3_0_0, data_2_3_0_0, selector, output_3_0_0, vss, 
                    vdd);
   {bit2} rom_mux2 (data_1_3_0_1, data_2_3_0_1, selector, output_3_0_1, vss, 
                    vdd);
   {bit3} rom_mux2 (data_1_3_0_2, data_2_3_0_2, selector, output_3_0_2, vss, 
                    vdd);
   {bit4} rom_mux2 (data_1_3_0_3, data_2_3_0_3, selector, output_3_0_3, vss, 
                    vdd);
}



