extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network log (terminal log_in_7_0_7, log_in_7_0_6, log_in_7_0_5, log_in_7_0_4, 
                      log_in_7_0_3, log_in_7_0_2, log_in_7_0_1, log_in_7_0_0, 
                      log_out_7_0_7, log_out_7_0_6, log_out_7_0_5, 
                      log_out_7_0_4, log_out_7_0_3, log_out_7_0_2, 
                      log_out_7_0_1, log_out_7_0_0, vss, vdd)
{
   net {log_out_7_0_7, log_in_7_0_7};
   net {log_out_7_0_6, log_out_6_port};
   net {log_out_7_0_5, log_out_5_port};
   net {log_out_7_0_4, log_out_4_port};
   net {log_out_7_0_3, log_out_3_port};
   net {log_out_7_0_2, log_out_2_port};
   net {log_out_7_0_1, log_out_1_port};
   net {log_out_7_0_0, log_out_0_port};
   {U16} iv110 (n13, log_out_6_port, vss, vdd);
   {U17} iv110 (n14, log_out_4_port, vss, vdd);
   {U18} iv110 (n15, log_out_0_port, vss, vdd);
   {U19} no210 (log_in_7_0_0, log_out_1_port, n15, vss, vdd);
   {U20} iv110 (n16, log_out_1_port, vss, vdd);
   {U21} no210 (log_out_2_port, log_in_7_0_1, n16, vss, vdd);
   {U22} iv110 (n17, log_out_2_port, vss, vdd);
   {U23} no210 (log_in_7_0_2, log_out_3_port, n17, vss, vdd);
   {U24} na210 (n14, n18, log_out_3_port, vss, vdd);
   {U25} iv110 (log_in_7_0_3, n18, vss, vdd);
   {U26} no210 (log_in_7_0_4, log_out_5_port, n14, vss, vdd);
   {U27} na210 (n13, n19, log_out_5_port, vss, vdd);
   {U28} iv110 (log_in_7_0_5, n19, vss, vdd);
   {U29} no210 (log_in_7_0_6, log_in_7_0_7, n13, vss, vdd);
}



