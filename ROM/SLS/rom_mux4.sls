extern network mu210 (terminal A, B, C, D, S1, S2, Y, vss, vdd)
network rom_mux4 (terminal input_1, input_2, input_3, input_4, selector_1_0_1, 
                           selector_1_0_0, output, vss, vdd)
{
   {U12} mu210 (input_1, input_3, input_2, input_4, selector_1_0_1, 
                selector_1_0_0, output, vss, vdd);
}



