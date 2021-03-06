extern network vga_counter (terminal clk, rst, pos_x_out_7_0_7, 
                                     pos_x_out_7_0_6, pos_x_out_7_0_5, 
                                     pos_x_out_7_0_4, pos_x_out_7_0_3, 
                                     pos_x_out_7_0_2, pos_x_out_7_0_1, 
                                     pos_x_out_7_0_0, pos_y_out_9_0_9, 
                                     pos_y_out_9_0_8, pos_y_out_9_0_7, 
                                     pos_y_out_9_0_6, pos_y_out_9_0_5, 
                                     pos_y_out_9_0_4, pos_y_out_9_0_3, 
                                     pos_y_out_9_0_2, pos_y_out_9_0_1, 
                                     pos_y_out_9_0_0, vss, vdd)
extern network vga_sync (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                                  pos_x_in_7_0_5, pos_x_in_7_0_4, 
                                  pos_x_in_7_0_3, pos_x_in_7_0_2, 
                                  pos_x_in_7_0_1, pos_x_in_7_0_0, 
                                  pos_y_in_9_0_9, pos_y_in_9_0_8, 
                                  pos_y_in_9_0_7, pos_y_in_9_0_6, 
                                  pos_y_in_9_0_5, pos_y_in_9_0_4, 
                                  pos_y_in_9_0_3, pos_y_in_9_0_2, 
                                  pos_y_in_9_0_1, pos_y_in_9_0_0, h_sync_out, 
                                  v_sync_out, vss, vdd)
extern network vga_triggers (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                                      pos_x_in_7_0_5, pos_x_in_7_0_4, 
                                      pos_x_in_7_0_3, pos_x_in_7_0_2, 
                                      pos_x_in_7_0_1, pos_x_in_7_0_0, 
                                      pos_y_in_9_0_9, pos_y_in_9_0_8, 
                                      pos_y_in_9_0_7, pos_y_in_9_0_6, 
                                      pos_y_in_9_0_5, pos_y_in_9_0_4, 
                                      pos_y_in_9_0_3, pos_y_in_9_0_2, 
                                      pos_y_in_9_0_1, pos_y_in_9_0_0, 
                                      new_line_out, new_frame_out, 
                                      end_frame_out, vss, vdd)
extern network vga_read (terminal clk, rst, in_field_in, in_np_in, in_score_in, 
                                  data_in, h_sync_in, v_sync_in, h_sync_out, 
                                  v_sync_out, red_out, green_out, blue_out, 
                                  vss, vdd)
extern network vga_field_trans (terminal clk, rst, mem_addr_reset_in_3_0_3, 
                                         mem_addr_reset_in_3_0_2, 
                                         mem_addr_reset_in_3_0_1, 
                                         mem_addr_reset_in_3_0_0, 
                                         mem_addr_out_7_0_7, 
                                         mem_addr_out_7_0_6, 
                                         mem_addr_out_7_0_5, 
                                         mem_addr_out_7_0_4, 
                                         mem_addr_out_7_0_3, 
                                         mem_addr_out_7_0_2, 
                                         mem_addr_out_7_0_1, 
                                         mem_addr_out_7_0_0, in_field_in, 
                                         new_line_in, new_frame_in, vss, vdd)
extern network vga_field_trans_reset (terminal clk, rst, 
                                               mem_addr_reset_out_3_0_3, 
                                               mem_addr_reset_out_3_0_2, 
                                               mem_addr_reset_out_3_0_1, 
                                               mem_addr_reset_out_3_0_0, 
                                               end_field_line_in, end_frame_in, 
                                               vss, vdd)
extern network vga_field_check (terminal clk, rst, pos_x_in_7_0_7, 
                                         pos_x_in_7_0_6, pos_x_in_7_0_5, 
                                         pos_x_in_7_0_4, pos_x_in_7_0_3, 
                                         pos_x_in_7_0_2, pos_x_in_7_0_1, 
                                         pos_x_in_7_0_0, pos_y_in_9_0_9, 
                                         pos_y_in_9_0_8, pos_y_in_9_0_7, 
                                         pos_y_in_9_0_6, pos_y_in_9_0_5, 
                                         pos_y_in_9_0_4, pos_y_in_9_0_3, 
                                         pos_y_in_9_0_2, pos_y_in_9_0_1, 
                                         pos_y_in_9_0_0, in_field_out, 
                                         end_field_line_out, vss, vdd)
extern network vga_np_trans (terminal clk, rst, mem_addr_reset_in_1_0_1, 
                                      mem_addr_reset_in_1_0_0, 
                                      mem_addr_out_7_0_7, mem_addr_out_7_0_6, 
                                      mem_addr_out_7_0_5, mem_addr_out_7_0_4, 
                                      mem_addr_out_7_0_3, mem_addr_out_7_0_2, 
                                      mem_addr_out_7_0_1, mem_addr_out_7_0_0, 
                                      in_np_in, new_line_in, new_frame_in, vss, 
                                      vdd)
extern network vga_np_trans_reset (terminal clk, rst, mem_addr_reset_out_1_0_1, 
                                            mem_addr_reset_out_1_0_0, 
                                            end_np_line_in, end_frame_in, vss, 
                                            vdd)
extern network vga_np_check (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                                      pos_x_in_7_0_5, pos_x_in_7_0_4, 
                                      pos_x_in_7_0_3, pos_x_in_7_0_2, 
                                      pos_x_in_7_0_1, pos_x_in_7_0_0, 
                                      pos_y_in_9_0_9, pos_y_in_9_0_8, 
                                      pos_y_in_9_0_7, pos_y_in_9_0_6, 
                                      pos_y_in_9_0_5, pos_y_in_9_0_4, 
                                      pos_y_in_9_0_3, pos_y_in_9_0_2, 
                                      pos_y_in_9_0_1, pos_y_in_9_0_0, 
                                      in_np_out, end_np_line_out, vss, vdd)
extern network vga_score_trans (terminal clk, rst, mem_addr_out_7_0_7, 
                                         mem_addr_out_7_0_6, 
                                         mem_addr_out_7_0_5, 
                                         mem_addr_out_7_0_4, 
                                         mem_addr_out_7_0_3, 
                                         mem_addr_out_7_0_2, 
                                         mem_addr_out_7_0_1, 
                                         mem_addr_out_7_0_0, end_score_line_in, 
                                         end_frame_in, vss, vdd)
extern network vga_score_check (terminal clk, rst, pos_x_in_7_0_7, 
                                         pos_x_in_7_0_6, pos_x_in_7_0_5, 
                                         pos_x_in_7_0_4, pos_x_in_7_0_3, 
                                         pos_x_in_7_0_2, pos_x_in_7_0_1, 
                                         pos_x_in_7_0_0, pos_y_in_9_0_9, 
                                         pos_y_in_9_0_8, pos_y_in_9_0_7, 
                                         pos_y_in_9_0_6, pos_y_in_9_0_5, 
                                         pos_y_in_9_0_4, pos_y_in_9_0_3, 
                                         pos_y_in_9_0_2, pos_y_in_9_0_1, 
                                         pos_y_in_9_0_0, in_score_out, 
                                         end_score_line_out, vss, vdd)
extern network vga_demux (terminal def_7_0_7, def_7_0_6, def_7_0_5, def_7_0_4, 
                                   def_7_0_3, def_7_0_2, def_7_0_1, def_7_0_0, 
                                   s1, di1_7_0_7, di1_7_0_6, di1_7_0_5, 
                                   di1_7_0_4, di1_7_0_3, di1_7_0_2, di1_7_0_1, 
                                   di1_7_0_0, s2, di2_7_0_7, di2_7_0_6, 
                                   di2_7_0_5, di2_7_0_4, di2_7_0_3, di2_7_0_2, 
                                   di2_7_0_1, di2_7_0_0, do_7_0_7, do_7_0_6, 
                                   do_7_0_5, do_7_0_4, do_7_0_3, do_7_0_2, 
                                   do_7_0_1, do_7_0_0, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga (terminal clk, rst, mem_addr_7_0_7, mem_addr_7_0_6, mem_addr_7_0_5, 
                      mem_addr_7_0_4, mem_addr_7_0_3, mem_addr_7_0_2, 
                      mem_addr_7_0_1, mem_addr_7_0_0, data, h_sync, v_sync, 
                      red, green, blue, vss, vdd)
{
   {counter} vga_counter (clk, rst, pos_x_7_port, pos_x_6_port, pos_x_5_port, 
                          pos_x_4_port, pos_x_3_port, pos_x_2_port, 
                          pos_x_1_port, pos_x_0_port, pos_y_9_port, 
                          pos_y_8_port, pos_y_7_port, pos_y_6_port, 
                          pos_y_5_port, pos_y_4_port, pos_y_3_port, 
                          pos_y_2_port, pos_y_1_port, pos_y_0_port, vss, vdd);
   {sync} vga_sync (clk, rst, pos_x_7_port, pos_x_6_port, pos_x_5_port, 
                    pos_x_4_port, pos_x_3_port, pos_x_2_port, pos_x_1_port, 
                    pos_x_0_port, pos_y_9_port, pos_y_8_port, pos_y_7_port, 
                    pos_y_6_port, pos_y_5_port, pos_y_4_port, pos_y_3_port, 
                    pos_y_2_port, pos_y_1_port, pos_y_0_port, h_sync_buf, 
                    v_sync_buf, vss, vdd);
   {triggers} vga_triggers (clk, rst, pos_x_7_port, pos_x_6_port, pos_x_5_port, 
                            pos_x_4_port, pos_x_3_port, pos_x_2_port, 
                            pos_x_1_port, pos_x_0_port, pos_y_9_port, 
                            pos_y_8_port, pos_y_7_port, pos_y_6_port, 
                            pos_y_5_port, pos_y_4_port, pos_y_3_port, 
                            pos_y_2_port, pos_y_1_port, pos_y_0_port, new_line, 
                            new_frame, end_frame, vss, vdd);
   {read_and_output} vga_read (clk, rst, in_field, in_np, in_score, data, 
                               h_sync_buf, v_sync_buf, h_sync, v_sync, red, 
                               green, blue, vss, vdd);
   {field_translation} vga_field_trans (clk, rst, mem_addr_reset_field_3_port, 
                                        mem_addr_reset_field_2_port, 
                                        mem_addr_reset_field_1_port, 
                                        mem_addr_reset_field_0_port, 
                                        mem_addr_field_7_port, 
                                        mem_addr_field_6_port, 
                                        mem_addr_field_5_port, 
                                        mem_addr_field_4_port, 
                                        mem_addr_field_3_port, 
                                        mem_addr_field_2_port, 
                                        mem_addr_field_1_port, 
                                        mem_addr_field_0_port, in_field, 
                                        new_line, new_frame, vss, vdd);
   {field_translation_reset} vga_field_trans_reset (clk, rst, 
                                                    mem_addr_reset_field_3_port, 
                                                    mem_addr_reset_field_2_port, 
                                                    mem_addr_reset_field_1_port, 
                                                    mem_addr_reset_field_0_port, 
                                                    end_field_line, n2, vss, 
                                                    vdd);
   {field_check} vga_field_check (clk, rst, pos_x_7_port, pos_x_6_port, 
                                  pos_x_5_port, pos_x_4_port, pos_x_3_port, 
                                  pos_x_2_port, pos_x_1_port, pos_x_0_port, 
                                  pos_y_9_port, pos_y_8_port, pos_y_7_port, 
                                  pos_y_6_port, pos_y_5_port, pos_y_4_port, 
                                  pos_y_3_port, pos_y_2_port, pos_y_1_port, 
                                  pos_y_0_port, in_field, end_field_line, vss, 
                                  vdd);
   {np_translation} vga_np_trans (clk, rst, mem_addr_reset_np_1_port, 
                                  mem_addr_reset_np_0_port, mem_addr_np_7_port, 
                                  mem_addr_np_6_port, mem_addr_np_5_port, 
                                  mem_addr_np_4_port, mem_addr_np_3_port, 
                                  mem_addr_np_2_port, mem_addr_np_1_port, 
                                  mem_addr_np_0_port, in_np, new_line, 
                                  new_frame, vss, vdd);
   {np_translation_reset} vga_np_trans_reset (clk, rst, 
                                              mem_addr_reset_np_1_port, 
                                              mem_addr_reset_np_0_port, 
                                              end_np_line, end_frame, vss, vdd);
   {np_check} vga_np_check (clk, rst, pos_x_7_port, pos_x_6_port, pos_x_5_port, 
                            pos_x_4_port, pos_x_3_port, pos_x_2_port, 
                            pos_x_1_port, pos_x_0_port, pos_y_9_port, 
                            pos_y_8_port, pos_y_7_port, pos_y_6_port, 
                            pos_y_5_port, pos_y_4_port, pos_y_3_port, 
                            pos_y_2_port, pos_y_1_port, pos_y_0_port, in_np, 
                            end_np_line, vss, vdd);
   {score_translation} vga_score_trans (clk, rst, mem_addr_score_7_port, 
                                        mem_addr_score_6_port, 
                                        mem_addr_score_5_port, 
                                        mem_addr_score_4_port, 
                                        mem_addr_score_3_port, 
                                        mem_addr_score_2_port, 
                                        mem_addr_score_1_port, 
                                        mem_addr_score_0_port, end_score_line, 
                                        end_frame, vss, vdd);
   {score_check} vga_score_check (clk, rst, pos_x_7_port, pos_x_6_port, 
                                  pos_x_5_port, pos_x_4_port, pos_x_3_port, 
                                  pos_x_2_port, pos_x_1_port, pos_x_0_port, 
                                  pos_y_9_port, pos_y_8_port, pos_y_7_port, 
                                  pos_y_6_port, pos_y_5_port, pos_y_4_port, 
                                  pos_y_3_port, pos_y_2_port, pos_y_1_port, 
                                  pos_y_0_port, in_score, end_score_line, vss, 
                                  vdd);
   {mem_addr_demux} vga_demux (mem_addr_field_7_port, mem_addr_field_6_port, 
                               mem_addr_field_5_port, mem_addr_field_4_port, 
                               mem_addr_field_3_port, mem_addr_field_2_port, 
                               mem_addr_field_1_port, mem_addr_field_0_port, 
                               in_np, mem_addr_np_7_port, mem_addr_np_6_port, 
                               mem_addr_np_5_port, mem_addr_np_4_port, 
                               mem_addr_np_3_port, mem_addr_np_2_port, 
                               mem_addr_np_1_port, mem_addr_np_0_port, 
                               in_score, mem_addr_score_7_port, 
                               mem_addr_score_6_port, mem_addr_score_5_port, 
                               mem_addr_score_4_port, mem_addr_score_3_port, 
                               mem_addr_score_2_port, mem_addr_score_1_port, 
                               mem_addr_score_0_port, mem_addr_7_0_7, 
                               mem_addr_7_0_6, mem_addr_7_0_5, mem_addr_7_0_4, 
                               mem_addr_7_0_3, mem_addr_7_0_2, mem_addr_7_0_1, 
                               mem_addr_7_0_0, vss, vdd);
   {U1} iv110 (end_frame, n1, vss, vdd);
   {U2} iv110 (n1, n2, vss, vdd);
}



