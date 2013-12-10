extern network rom_mux4 (terminal input_1, input_2, input_3, input_4, 
                                  selector_1_0_1, selector_1_0_0, output, vss, 
                                  vdd)
network rom_mux44 (terminal data_1_3_0_3, data_1_3_0_2, data_1_3_0_1, 
                            data_1_3_0_0, data_2_3_0_3, data_2_3_0_2, 
                            data_2_3_0_1, data_2_3_0_0, data_3_3_0_3, 
                            data_3_3_0_2, data_3_3_0_1, data_3_3_0_0, 
                            data_4_3_0_3, data_4_3_0_2, data_4_3_0_1, 
                            data_4_3_0_0, selector_1_0_1, selector_1_0_0, 
                            output_3_0_3, output_3_0_2, output_3_0_1, 
                            output_3_0_0, vss, vdd)
{
   {bit1} rom_mux4 (data_1_3_0_0, data_2_3_0_0, data_3_3_0_0, data_4_3_0_0, 
                    selector_1_0_1, selector_1_0_0, output_3_0_0, vss, vdd);
   {bit2} rom_mux4 (data_1_3_0_1, data_2_3_0_1, data_3_3_0_1, data_4_3_0_1, 
                    selector_1_0_1, selector_1_0_0, output_3_0_1, vss, vdd);
   {bit3} rom_mux4 (data_1_3_0_2, data_2_3_0_2, data_3_3_0_2, data_4_3_0_2, 
                    selector_1_0_1, selector_1_0_0, output_3_0_2, vss, vdd);
   {bit4} rom_mux4 (data_1_3_0_3, data_2_3_0_3, data_3_3_0_3, data_4_3_0_3, 
                    selector_1_0_1, selector_1_0_0, output_3_0_3, vss, vdd);
}



