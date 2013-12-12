extern network vga_counter_8bit (terminal clk, rst, rst_ext, en, val_7_0_7, 
                                          val_7_0_6, val_7_0_5, val_7_0_4, 
                                          val_7_0_3, val_7_0_2, val_7_0_1, 
                                          val_7_0_0, vss, vdd)
extern network vga_counter_10bit (terminal clk, rst, rst_ext, en, val_9_0_9, 
                                           val_9_0_8, val_9_0_7, val_9_0_6, 
                                           val_9_0_5, val_9_0_4, val_9_0_3, 
                                           val_9_0_2, val_9_0_1, val_9_0_0, 
                                           vss, vdd)
extern network vga_counter_resets (terminal pos_x_reset, pos_y_reset, 
                                            pos_y_enable, pos_x_7_0_7, 
                                            pos_x_7_0_6, pos_x_7_0_5, 
                                            pos_x_7_0_4, pos_x_7_0_3, 
                                            pos_x_7_0_2, pos_x_7_0_1, 
                                            pos_x_7_0_0, pos_y_9_0_9, 
                                            pos_y_9_0_8, pos_y_9_0_7, 
                                            pos_y_9_0_6, pos_y_9_0_5, 
                                            pos_y_9_0_4, pos_y_9_0_3, 
                                            pos_y_9_0_2, pos_y_9_0_1, 
                                            pos_y_9_0_0, vss, vdd)
network vga_counter (terminal clk, rst, pos_x_out_7_0_7, pos_x_out_7_0_6, 
                              pos_x_out_7_0_5, pos_x_out_7_0_4, 
                              pos_x_out_7_0_3, pos_x_out_7_0_2, 
                              pos_x_out_7_0_1, pos_x_out_7_0_0, 
                              pos_y_out_9_0_9, pos_y_out_9_0_8, 
                              pos_y_out_9_0_7, pos_y_out_9_0_6, 
                              pos_y_out_9_0_5, pos_y_out_9_0_4, 
                              pos_y_out_9_0_3, pos_y_out_9_0_2, 
                              pos_y_out_9_0_1, pos_y_out_9_0_0, vss, vdd)
{
   net {pos_x_out_7_0_7, pos_x_out_7_port};
   net {pos_x_out_7_0_6, pos_x_out_6_port};
   net {pos_x_out_7_0_5, pos_x_out_5_port};
   net {pos_x_out_7_0_4, pos_x_out_4_port};
   net {pos_x_out_7_0_3, pos_x_out_3_port};
   net {pos_x_out_7_0_2, pos_x_out_2_port};
   net {pos_x_out_7_0_1, pos_x_out_1_port};
   net {pos_x_out_7_0_0, pos_x_out_0_port};
   net {pos_y_out_9_0_9, pos_y_out_9_port};
   net {pos_y_out_9_0_8, pos_y_out_8_port};
   net {pos_y_out_9_0_7, pos_y_out_7_port};
   net {pos_y_out_9_0_6, pos_y_out_6_port};
   net {pos_y_out_9_0_5, pos_y_out_5_port};
   net {pos_y_out_9_0_4, pos_y_out_4_port};
   net {pos_y_out_9_0_3, pos_y_out_3_port};
   net {pos_y_out_9_0_2, pos_y_out_2_port};
   net {pos_y_out_9_0_1, pos_y_out_1_port};
   net {pos_y_out_9_0_0, pos_y_out_0_port};
   {pos_x_counter} vga_counter_8bit (clk, rst, pos_x_reset, X_Logic1_port, 
                                     pos_x_out_7_port, pos_x_out_6_port, 
                                     pos_x_out_5_port, pos_x_out_4_port, 
                                     pos_x_out_3_port, pos_x_out_2_port, 
                                     pos_x_out_1_port, pos_x_out_0_port, vss, 
                                     vdd);
   {pos_y_counter} vga_counter_10bit (clk, rst, pos_y_reset, pos_y_enable, 
                                      pos_y_out_9_port, pos_y_out_8_port, 
                                      pos_y_out_7_port, pos_y_out_6_port, 
                                      pos_y_out_5_port, pos_y_out_4_port, 
                                      pos_y_out_3_port, pos_y_out_2_port, 
                                      pos_y_out_1_port, pos_y_out_0_port, vss, 
                                      vdd);
   {resets} vga_counter_resets (pos_x_reset, pos_y_reset, pos_y_enable, 
                                pos_x_out_7_port, pos_x_out_6_port, 
                                pos_x_out_5_port, pos_x_out_4_port, 
                                pos_x_out_3_port, pos_x_out_2_port, 
                                pos_x_out_1_port, pos_x_out_0_port, 
                                pos_y_out_9_port, pos_y_out_8_port, 
                                pos_y_out_7_port, pos_y_out_6_port, 
                                pos_y_out_5_port, pos_y_out_4_port, 
                                pos_y_out_3_port, pos_y_out_2_port, 
                                pos_y_out_1_port, pos_y_out_0_port, vss, vdd);
   net {X_Logic1_port, vdd};
}



