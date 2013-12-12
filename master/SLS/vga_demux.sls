extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_demux (terminal def_7_0_7, def_7_0_6, def_7_0_5, def_7_0_4, 
                            def_7_0_3, def_7_0_2, def_7_0_1, def_7_0_0, s1, 
                            di1_7_0_7, di1_7_0_6, di1_7_0_5, di1_7_0_4, 
                            di1_7_0_3, di1_7_0_2, di1_7_0_1, di1_7_0_0, s2, 
                            di2_7_0_7, di2_7_0_6, di2_7_0_5, di2_7_0_4, 
                            di2_7_0_3, di2_7_0_2, di2_7_0_1, di2_7_0_0, 
                            do_7_0_7, do_7_0_6, do_7_0_5, do_7_0_4, do_7_0_3, 
                            do_7_0_2, do_7_0_1, do_7_0_0, vss, vdd)
{
   {U36} na310 (n28, n29, n30, do_7_0_7, vss, vdd);
   {U37} na210 (s1, di1_7_0_7, n30, vss, vdd);
   {U38} na210 (def_7_0_7, n31, n29, vss, vdd);
   {U39} na210 (di2_7_0_7, n32, n28, vss, vdd);
   {U40} na310 (n33, n34, n35, do_7_0_6, vss, vdd);
   {U41} na210 (di1_7_0_6, s1, n35, vss, vdd);
   {U42} na210 (def_7_0_6, n31, n34, vss, vdd);
   {U43} na210 (di2_7_0_6, n32, n33, vss, vdd);
   {U44} na310 (n36, n37, n38, do_7_0_5, vss, vdd);
   {U45} na210 (di1_7_0_5, s1, n38, vss, vdd);
   {U46} na210 (def_7_0_5, n31, n37, vss, vdd);
   {U47} na210 (di2_7_0_5, n32, n36, vss, vdd);
   {U48} na310 (n39, n40, n41, do_7_0_4, vss, vdd);
   {U49} na210 (di1_7_0_4, s1, n41, vss, vdd);
   {U50} na210 (def_7_0_4, n31, n40, vss, vdd);
   {U51} na210 (di2_7_0_4, n32, n39, vss, vdd);
   {U52} na310 (n42, n43, n44, do_7_0_3, vss, vdd);
   {U53} na210 (di1_7_0_3, s1, n44, vss, vdd);
   {U54} na210 (def_7_0_3, n31, n43, vss, vdd);
   {U55} na210 (di2_7_0_3, n32, n42, vss, vdd);
   {U56} na310 (n45, n46, n47, do_7_0_2, vss, vdd);
   {U57} na210 (di1_7_0_2, s1, n47, vss, vdd);
   {U58} na210 (def_7_0_2, n31, n46, vss, vdd);
   {U59} na210 (di2_7_0_2, n32, n45, vss, vdd);
   {U60} na310 (n48, n49, n50, do_7_0_1, vss, vdd);
   {U61} na210 (di1_7_0_1, s1, n50, vss, vdd);
   {U62} na210 (def_7_0_1, n31, n49, vss, vdd);
   {U63} na210 (di2_7_0_1, n32, n48, vss, vdd);
   {U64} na310 (n51, n52, n53, do_7_0_0, vss, vdd);
   {U65} na210 (di1_7_0_0, s1, n53, vss, vdd);
   {U66} na210 (def_7_0_0, n31, n52, vss, vdd);
   {U67} no210 (s1, s2, n31, vss, vdd);
   {U68} na210 (di2_7_0_0, n32, n51, vss, vdd);
   {U69} no210 (n54, s1, n32, vss, vdd);
   {U70} iv110 (s2, n54, vss, vdd);
}



