extern network score (terminal clk, rst, increase, output_7_0_7, output_7_0_6, 
                               output_7_0_5, output_7_0_4, output_7_0_3, 
                               output_7_0_2, output_7_0_1, output_7_0_0, vss, 
                               vdd)
extern network log (terminal log_in_7_0_7, log_in_7_0_6, log_in_7_0_5, 
                             log_in_7_0_4, log_in_7_0_3, log_in_7_0_2, 
                             log_in_7_0_1, log_in_7_0_0, log_out_7_0_7, 
                             log_out_7_0_6, log_out_7_0_5, log_out_7_0_4, 
                             log_out_7_0_3, log_out_7_0_2, log_out_7_0_1, 
                             log_out_7_0_0, vss, vdd)
network log_score (terminal clk, rst, increase, output_7_0_7, output_7_0_6, 
                            output_7_0_5, output_7_0_4, output_7_0_3, 
                            output_7_0_2, output_7_0_1, output_7_0_0, vss, vdd)
{
   {L1} score (clk, rst, increase, score_to_log_7_port, score_to_log_6_port, 
               score_to_log_5_port, score_to_log_4_port, score_to_log_3_port, 
               score_to_log_2_port, score_to_log_1_port, score_to_log_0_port, 
               vss, vdd);
   {L2} log (score_to_log_7_port, score_to_log_6_port, score_to_log_5_port, 
             score_to_log_4_port, score_to_log_3_port, score_to_log_2_port, 
             score_to_log_1_port, score_to_log_0_port, output_7_0_7, 
             output_7_0_6, output_7_0_5, output_7_0_4, output_7_0_3, 
             output_7_0_2, output_7_0_1, output_7_0_0, vss, vdd);
}



