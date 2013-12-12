extern network mu111 (terminal A, B, S, Y, vss, vdd)
network npg_mux2_1 (terminal out1, sel, in1, in2, vss, vdd)
{
   {U5} mu111 (in1, in2, sel, out1, vss, vdd);
}



