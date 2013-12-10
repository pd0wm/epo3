extern network mu111 (terminal A, B, S, Y, vss, vdd)
network rom_mux2 (terminal data_1, data_2, selector, output, vss, vdd)
{
   {U5} mu111 (data_1, data_2, selector, output, vss, vdd);
}



