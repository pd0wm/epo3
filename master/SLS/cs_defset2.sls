extern network tinv10 (terminal A, E, Y, vss, vdd)
network cs_defset2 (terminal en, out1, out2, vss, vdd)
{
   {out1_tri} tinv10 (n1, en, out1, vss, vdd);
   {out2_tri} tinv10 (n1, en, out2, vss, vdd);
   net {n1, vdd};
}



