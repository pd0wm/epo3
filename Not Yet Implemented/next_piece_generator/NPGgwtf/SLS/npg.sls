extern network npg_mux2_1 (terminal out1, sel, in1, in2, vss, vdd)
extern network npg_ff (terminal clk, rst, d, q, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network npg (terminal clk, rst, button_seed, new_number, output_2_0_2, 
                      output_2_0_1, output_2_0_0, vss, vdd)
{
   net {output_2_0_2, output_2_port};
   net {output_2_0_1, output_1_port};
   net {output_2_0_0, output_0_port};
   {Button} npg_ff (clk, n2, button_xor_self, shift, vss, vdd);
   {M1} npg_mux2_1 (s5, shift, n4, output_2_port, vss, vdd);
   {L1} npg_ff (clk, rst, s5, output_2_port, vss, vdd);
   {M2} npg_mux2_1 (s6, shift, output_2_port, output_1_port, vss, vdd);
   {L2} npg_ff (clk, rst, s6, output_1_port, vss, vdd);
   {M3} npg_mux2_1 (s7, shift, output_1_port, output_0_port, vss, vdd);
   {L3} npg_ff (clk, rst, s7, output_0_port, vss, vdd);
   {U6} ex210 (n5, output_1_port, n4, vss, vdd);
   {U7} iv110 (output_0_port, n5, vss, vdd);
   {U8} iv110 (n6, n2, vss, vdd);
   {U9} no210 (new_number, rst, n6, vss, vdd);
   {U10} ex210 (shift, button_seed, button_xor_self, vss, vdd);
}



