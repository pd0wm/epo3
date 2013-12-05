extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tbuf10 (terminal A, E, Y, vss, vdd)
extern network mu210 (terminal A, B, C, D, S1, S2, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network bit4 (terminal do_2, addr1_1, addr1_2, addr2_1, addr2_2, we1, we2, we3, 
                       we4, we_com, re_1, re_2, clk, rst, di, do_1, vss, vdd)
{
   {dfr11_0} dfr11 (net_8, rst, clk, net_2, vss, vdd);
   {dfr11_6} dfr11 (net_11, rst, clk, net_5, vss, vdd);
   {dfr11_7} dfr11 (net_10, rst, clk, net_4, vss, vdd);
   {dfr11_8} dfr11 (net_9, rst, clk, net_3, vss, vdd);
   {tbuf10_14} tbuf10 (net_6, re_1, do_1, vss, vdd);
   {tbuf10_15} tbuf10 (net_7, re_2, do_2, vss, vdd);
   {U46} na210 (n40, n41, net_9, vss, vdd);
   {U47} na210 (net_3, n42, n41, vss, vdd);
   {U48} na210 (n43, n44, n42, vss, vdd);
   {U49} na210 (n45, n44, n40, vss, vdd);
   {U50} iv110 (we2, n44, vss, vdd);
   {U51} na210 (n46, n47, net_8, vss, vdd);
   {U52} na210 (net_2, n48, n47, vss, vdd);
   {U53} na210 (n43, n49, n48, vss, vdd);
   {U54} na210 (n45, n49, n46, vss, vdd);
   {U55} iv110 (we1, n49, vss, vdd);
   {U56} mu210 (net_2, net_4, net_3, net_5, addr2_2, addr2_1, net_7, vss, vdd);
   {U57} mu210 (net_2, net_4, net_3, net_5, addr1_2, addr1_1, net_6, vss, vdd);
   {U58} na210 (n50, n51, net_11, vss, vdd);
   {U59} na210 (net_5, n52, n51, vss, vdd);
   {U60} na210 (n43, n53, n52, vss, vdd);
   {U61} na210 (n45, n53, n50, vss, vdd);
   {U62} iv110 (we4, n53, vss, vdd);
   {U63} na210 (n54, n55, net_10, vss, vdd);
   {U64} na210 (net_4, n56, n55, vss, vdd);
   {U65} na210 (n43, n57, n56, vss, vdd);
   {U66} na210 (n45, n57, n54, vss, vdd);
   {U67} iv110 (we3, n57, vss, vdd);
   {U68} iv110 (n58, n45, vss, vdd);
   {U69} na210 (di, n43, n58, vss, vdd);
   {U70} iv110 (we_com, n43, vss, vdd);
}



