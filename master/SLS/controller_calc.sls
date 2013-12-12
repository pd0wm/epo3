extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network controller_calc (terminal old_x_2_0_2, old_x_2_0_1, old_x_2_0_0, 
                                  old_y_3_0_3, old_y_3_0_2, old_y_3_0_1, 
                                  old_y_3_0_0, old_rot_1_0_1, old_rot_1_0_0, 
                                  new_x_2_0_2, new_x_2_0_1, new_x_2_0_0, 
                                  new_y_3_0_3, new_y_3_0_2, new_y_3_0_1, 
                                  new_y_3_0_0, new_rot_1_0_1, new_rot_1_0_0, 
                                  add_sub, rot, x, y, vss, vdd)
{
   {U62} ex210 (old_y_3_0_3, n61, new_y_3_0_3, vss, vdd);
   {U63} no210 (n62, n63, n61, vss, vdd);
   {U64} ex210 (n64, n65, n63, vss, vdd);
   {U65} na210 (n66, n67, n65, vss, vdd);
   {U66} na210 (n68, n69, n67, vss, vdd);
   {U67} iv110 (old_y_3_0_2, n69, vss, vdd);
   {U68} na210 (n64, n70, n68, vss, vdd);
   {U69} na210 (n71, add_sub, n66, vss, vdd);
   {U70} iv110 (n70, n71, vss, vdd);
   {U71} ex210 (old_y_3_0_2, n72, new_y_3_0_2, vss, vdd);
   {U72} no210 (n73, n62, n72, vss, vdd);
   {U73} ex210 (n70, add_sub, n73, vss, vdd);
   {U74} na210 (n74, n75, n70, vss, vdd);
   {U75} na210 (old_y_3_0_1, n76, n75, vss, vdd);
   {U76} na210 (add_sub, n77, n76, vss, vdd);
   {U77} na210 (old_y_3_0_0, n64, n74, vss, vdd);
   {U78} ex210 (old_y_3_0_1, n78, new_y_3_0_1, vss, vdd);
   {U79} no210 (n62, n79, n78, vss, vdd);
   {U80} ex210 (n77, n64, n79, vss, vdd);
   {U81} ex210 (n77, n62, new_y_3_0_0, vss, vdd);
   {U82} na310 (n80, n81, y, n62, vss, vdd);
   {U83} iv110 (old_y_3_0_0, n77, vss, vdd);
   {U84} mu111 (n82, n83, old_x_2_0_2, new_x_2_0_2, vss, vdd);
   {U85} na210 (n84, n85, n83, vss, vdd);
   {U86} ex210 (n86, n87, n85, vss, vdd);
   {U87} no210 (n88, n89, n82, vss, vdd);
   {U88} iv110 (n84, n89, vss, vdd);
   {U89} mu111 (n64, n86, n87, n88, vss, vdd);
   {U90} na210 (n90, n91, new_x_2_0_1, vss, vdd);
   {U91} na210 (n84, n92, n91, vss, vdd);
   {U92} na210 (n86, n93, n92, vss, vdd);
   {U93} na310 (add_sub, n94, old_x_2_0_0, n93, vss, vdd);
   {U94} na210 (n95, n64, n86, vss, vdd);
   {U95} iv110 (add_sub, n64, vss, vdd);
   {U96} na210 (n87, n96, n95, vss, vdd);
   {U97} na210 (n97, n94, n96, vss, vdd);
   {U98} iv110 (old_x_2_0_1, n94, vss, vdd);
   {U99} na210 (old_x_2_0_1, old_x_2_0_0, n87, vss, vdd);
   {U100} na210 (old_x_2_0_1, n98, n90, vss, vdd);
   {U101} na210 (n84, n99, n98, vss, vdd);
   {U102} na210 (add_sub, n97, n99, vss, vdd);
   {U103} iv110 (old_x_2_0_0, n97, vss, vdd);
   {U104} ex210 (old_x_2_0_0, n84, new_x_2_0_0, vss, vdd);
   {U105} no210 (n81, rot, n84, vss, vdd);
   {U106} iv110 (x, n81, vss, vdd);
   {U107} ex210 (old_rot_1_0_1, n100, new_rot_1_0_1, vss, vdd);
   {U108} no210 (n80, n101, n100, vss, vdd);
   {U109} ex210 (old_rot_1_0_0, add_sub, n101, vss, vdd);
   {U110} iv110 (rot, n80, vss, vdd);
   {U111} ex210 (rot, old_rot_1_0_0, new_rot_1_0_0, vss, vdd);
}



