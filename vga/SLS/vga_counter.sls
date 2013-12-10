extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network vga_counter (terminal clk, rst, pos_x_out_7_0_7, pos_x_out_7_0_6, 
                              pos_x_out_7_0_5, pos_x_out_7_0_4, 
                              pos_x_out_7_0_3, pos_x_out_7_0_2, 
                              pos_x_out_7_0_1, pos_x_out_7_0_0, 
                              pos_y_out_8_0_8, pos_y_out_8_0_7, 
                              pos_y_out_8_0_6, pos_y_out_8_0_5, 
                              pos_y_out_8_0_4, pos_y_out_8_0_3, 
                              pos_y_out_8_0_2, pos_y_out_8_0_1, 
                              pos_y_out_8_0_0, vss, vdd)
{
   net {pos_x_out_7_0_7, pos_x_out_7_port};
   net {pos_x_out_7_0_6, pos_x_out_6_port};
   net {pos_x_out_7_0_5, pos_x_out_5_port};
   net {pos_x_out_7_0_4, pos_x_out_4_port};
   net {pos_x_out_7_0_3, pos_x_out_3_port};
   net {pos_x_out_7_0_2, pos_x_out_2_port};
   net {pos_x_out_7_0_1, pos_x_out_1_port};
   net {pos_x_out_7_0_0, pos_x_out_0_port};
   net {pos_y_out_8_0_8, pos_y_out_8_port};
   net {pos_y_out_8_0_7, pos_y_out_7_port};
   net {pos_y_out_8_0_6, pos_y_out_6_port};
   net {pos_y_out_8_0_5, pos_y_out_5_port};
   net {pos_y_out_8_0_4, pos_y_out_4_port};
   net {pos_y_out_8_0_3, pos_y_out_3_port};
   net {pos_y_out_8_0_2, pos_y_out_2_port};
   net {pos_y_out_8_0_1, pos_y_out_1_port};
   net {pos_y_out_8_0_0, pos_y_out_0_port};
   {pos_x_reg_0_inst} dfa11 (pos_x_next_0_port, clk, rst, pos_x_out_0_port, 
                             vss, vdd);
   {pos_x_reg_7_inst} dfa11 (pos_x_next_7_port, clk, rst, pos_x_out_7_port, 
                             vss, vdd);
   {pos_x_reg_6_inst} dfa11 (pos_x_next_6_port, clk, rst, pos_x_out_6_port, 
                             vss, vdd);
   {pos_x_reg_5_inst} dfa11 (pos_x_next_5_port, clk, rst, pos_x_out_5_port, 
                             vss, vdd);
   {pos_x_reg_4_inst} dfa11 (pos_x_next_4_port, clk, rst, pos_x_out_4_port, 
                             vss, vdd);
   {pos_x_reg_3_inst} dfa11 (pos_x_next_3_port, clk, rst, pos_x_out_3_port, 
                             vss, vdd);
   {pos_x_reg_2_inst} dfa11 (pos_x_next_2_port, clk, rst, pos_x_out_2_port, 
                             vss, vdd);
   {pos_x_reg_1_inst} dfa11 (pos_x_next_1_port, clk, rst, pos_x_out_1_port, 
                             vss, vdd);
   {pos_y_reg_0_inst} dfa11 (pos_y_next_0_port, clk, rst, pos_y_out_0_port, 
                             vss, vdd);
   {pos_y_reg_1_inst} dfa11 (pos_y_next_1_port, clk, rst, pos_y_out_1_port, 
                             vss, vdd);
   {pos_y_reg_2_inst} dfa11 (pos_y_next_2_port, clk, rst, pos_y_out_2_port, 
                             vss, vdd);
   {pos_y_reg_3_inst} dfa11 (pos_y_next_3_port, clk, rst, pos_y_out_3_port, 
                             vss, vdd);
   {pos_y_reg_4_inst} dfa11 (pos_y_next_4_port, clk, rst, pos_y_out_4_port, 
                             vss, vdd);
   {pos_y_reg_5_inst} dfa11 (pos_y_next_5_port, clk, rst, pos_y_out_5_port, 
                             vss, vdd);
   {pos_y_reg_6_inst} dfa11 (pos_y_next_6_port, clk, rst, pos_y_out_6_port, 
                             vss, vdd);
   {pos_y_reg_7_inst} dfa11 (pos_y_next_7_port, clk, rst, pos_y_out_7_port, 
                             vss, vdd);
   {pos_y_reg_8_inst} dfa11 (pos_y_next_8_port, clk, rst, pos_y_out_8_port, 
                             vss, vdd);
   {U79} iv110 (n66, n61, vss, vdd);
   {U80} iv110 (n62, pos_y_next_8_port, vss, vdd);
   {U81} ex210 (pos_y_out_8_port, n63, n62, vss, vdd);
   {U82} na310 (n64, n65, n66, n63, vss, vdd);
   {U83} mu111 (n67, pos_y_out_7_port, n61, pos_y_next_7_port, vss, vdd);
   {U84} mu111 (n69, pos_y_out_6_port, n61, pos_y_next_6_port, vss, vdd);
   {U85} iv110 (n70, n69, vss, vdd);
   {U86} mu111 (n71, pos_y_out_5_port, n61, pos_y_next_5_port, vss, vdd);
   {U87} iv110 (n72, pos_y_next_4_port, vss, vdd);
   {U88} mu111 (n73, n74, n61, n72, vss, vdd);
   {U89} mu111 (n75, pos_y_out_3_port, n68, pos_y_next_3_port, vss, vdd);
   {U90} mu111 (n76, pos_y_out_2_port, n68, pos_y_next_2_port, vss, vdd);
   {U91} iv110 (n77, n76, vss, vdd);
   {U92} mu111 (n78, pos_y_out_1_port, n68, pos_y_next_1_port, vss, vdd);
   {U93} ex210 (n79, n80, n78, vss, vdd);
   {U94} mu111 (n81, pos_y_out_0_port, n68, pos_y_next_0_port, vss, vdd);
   {U95} no210 (n66, n82, pos_x_next_7_port, vss, vdd);
   {U96} iv110 (n67, n82, vss, vdd);
   {U97} ex210 (n64, n65, n67, vss, vdd);
   {U98} mu111 (pos_y_out_7_port, pos_x_out_7_port, n68, n65, vss, vdd);
   {U99} no210 (n66, n70, pos_x_next_6_port, vss, vdd);
   {U100} na210 (n83, n84, n70, vss, vdd);
   {U101} na210 (n85, n86, n84, vss, vdd);
   {U102} iv110 (n64, n83, vss, vdd);
   {U103} no210 (n86, n85, n64, vss, vdd);
   {U104} iv110 (n87, n85, vss, vdd);
   {U105} mu111 (pos_y_out_6_port, pos_x_out_6_port, n68, n87, vss, vdd);
   {U106} na210 (n88, n89, n86, vss, vdd);
   {U107} no210 (n66, n90, pos_x_next_5_port, vss, vdd);
   {U108} iv110 (n71, n90, vss, vdd);
   {U109} ex210 (n88, n89, n71, vss, vdd);
   {U110} na210 (n91, n92, n89, vss, vdd);
   {U111} na210 (pos_y_out_5_port, n66, n92, vss, vdd);
   {U112} iv110 (pos_x_out_5_port, n91, vss, vdd);
   {U113} no310 (n93, n94, n95, n88, vss, vdd);
   {U114} no210 (n66, n73, pos_x_next_4_port, vss, vdd);
   {U115} ex210 (n96, n93, n73, vss, vdd);
   {U116} no210 (pos_x_out_4_port, n97, n93, vss, vdd);
   {U117} no210 (n74, n61, n97, vss, vdd);
   {U118} iv110 (pos_y_out_4_port, n74, vss, vdd);
   {U119} no210 (n95, n94, n96, vss, vdd);
   {U120} iv110 (n98, pos_x_next_3_port, vss, vdd);
   {U121} na210 (n61, n75, n98, vss, vdd);
   {U122} ex210 (n95, n94, n75, vss, vdd);
   {U123} no210 (pos_x_out_3_port, n99, n94, vss, vdd);
   {U124} no210 (n100, n61, n99, vss, vdd);
   {U125} iv110 (pos_y_out_3_port, n100, vss, vdd);
   {U126} no210 (n66, n77, pos_x_next_2_port, vss, vdd);
   {U127} na210 (n95, n101, n77, vss, vdd);
   {U128} iv110 (n102, n101, vss, vdd);
   {U129} no210 (n103, n104, n102, vss, vdd);
   {U130} na210 (n104, n103, n95, vss, vdd);
   {U131} mu111 (pos_y_out_2_port, pos_x_out_2_port, n68, n103, vss, vdd);
   {U132} no210 (n81, n105, n104, vss, vdd);
   {U133} iv110 (n79, n105, vss, vdd);
   {U134} mu111 (n106, pos_x_next_0_port, n79, pos_x_next_1_port, vss, vdd);
   {U135} mu111 (pos_x_out_1_port, pos_y_out_1_port, n66, n79, vss, vdd);
   {U136} no210 (n66, n81, n106, vss, vdd);
   {U137} iv110 (n80, n81, vss, vdd);
   {U138} no210 (n80, n66, pos_x_next_0_port, vss, vdd);
   {U139} mu111 (pos_y_out_0_port, pos_x_out_0_port, n68, n80, vss, vdd);
   {U140} iv110 (n66, n68, vss, vdd);
   {U141} no210 (n107, n108, n66, vss, vdd);
   {U142} na310 (n109, n110, pos_x_out_0_port, n108, vss, vdd);
   {U143} iv110 (pos_x_out_3_port, n110, vss, vdd);
   {U144} no210 (pos_x_out_4_port, pos_x_out_5_port, n109, vss, vdd);
   {U145} na310 (n111, pos_x_out_6_port, pos_x_out_7_port, n107, vss, vdd);
   {U146} iv110 (n112, n111, vss, vdd);
   {U147} na210 (pos_x_out_2_port, pos_x_out_1_port, n112, vss, vdd);
}



