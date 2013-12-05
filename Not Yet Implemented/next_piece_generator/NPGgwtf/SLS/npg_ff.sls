extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
network npg_ff (terminal clk, rst, d, q, vss, vdd)
{
   {q_reg} dfr11 (d, rst, clk, q, vss, vdd);
}



