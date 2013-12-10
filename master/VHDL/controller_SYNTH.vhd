
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal cur_state_5_port, cur_state_4_port, cur_state_3_port, 
      cur_state_2_port, cur_state_1_port, cur_state_0_port, cur_piece_2_port, 
      cur_piece_1_port, cur_piece_0_port, cur_x_2_port, cur_x_1_port, 
      cur_x_0_port, cur_x_new_2_port, cur_x_new_1_port, cur_x_new_0_port, 
      cur_y_3_port, cur_y_2_port, cur_y_1_port, cur_y_0_port, cur_y_new_3_port,
      cur_y_new_2_port, cur_y_new_1_port, cur_y_new_0_port, cur_rot_1_port, 
      cur_rot_0_port, cur_rot_new_1_port, cur_rot_new_0_port, next_state_5_port
      , next_state_4_port, next_state_2_port, next_state_1_port, 
      next_state_0_port, cur_lut_x_2_port, cur_lut_x_1_port, cur_lut_x_0_port, 
      cur_lut_y_3_port, cur_lut_y_2_port, cur_lut_y_1_port, cur_lut_y_0_port, 
      cur_lut_rot_1_port, cur_lut_rot_0_port, cur_lut_piece_type_2_port, 
      cur_lut_piece_type_1_port, cur_lut_piece_type_0_port, cur_new_piece, 
      cur_check_start, cur_draw_erase_draw, cur_draw_erase_start, 
      cur_clear_shift_start, cur_draw_score_draw, cur_timer_1_time_7_port, 
      cur_timer_1_time_6_port, cur_timer_1_time_5_port, cur_timer_1_time_4_port
      , cur_timer_1_time_3_port, cur_timer_1_time_2_port, 
      cur_timer_1_time_1_port, cur_timer_1_time_0_port, cur_timer_1_start, 
      cur_timer_1_reset, cur_timer_2_time_7_port, cur_timer_2_time_6_port, 
      cur_timer_2_time_5_port, cur_timer_2_time_4_port, cur_timer_2_time_3_port
      , cur_timer_2_time_2_port, cur_timer_2_time_1_port, 
      cur_timer_2_time_0_port, cur_timer_2_start, cur_timer_2_reset, 
      inv_inputs_7_port, inv_inputs_6_port, inv_inputs_5_port, 
      inv_inputs_4_port, inv_inputs_3_port, inv_inputs_2_port, 
      inv_inputs_1_port, inv_inputs_0_port, n752, n753, n754, n755, n756, n757,
      n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, 
      n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, 
      n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, 
      n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, 
      n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, 
      n818, n819, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, 
      n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, 
      n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, 
      n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, 
      n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, 
      n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, 
      n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, 
      n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, 
      n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, 
      n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945, 
      n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, 
      n958, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, 
      n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981, 
      n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992, n993, 
      n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, 
      n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, 
      n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, 
      n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, 
      n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, 
      n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, 
      n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, 
      n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, 
      n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, 
      n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, 
      n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, 
      n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, 
      n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, 
      n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, 
      n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, 
      n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, 
      n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, 
      n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, 
      n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, 
      n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, 
      n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, 
      n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, 
      n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, 
      n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, 
      n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, 
      n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, 
      n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, 
      n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, 
      n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, 
      n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, 
      n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, 
      n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, 
      n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, 
      n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, 
      n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, 
      n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, 
      n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, 
      n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, 
      n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, 
      n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, 
      n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, 
      n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, 
      n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, 
      n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, 
      n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, 
      n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, 
      n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, 
      n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, 
      n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, 
      n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, 
      n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, 
      n1505, n1506 : std_logic;

begin
   
   inv_inputs_reg_7_inst : dfn10 port map( D => n818, CK => clk, Q => 
                           inv_inputs_7_port);
   inv_inputs_reg_6_inst : dfn10 port map( D => n817, CK => clk, Q => 
                           inv_inputs_6_port);
   inv_inputs_reg_5_inst : dfn10 port map( D => n816, CK => clk, Q => 
                           inv_inputs_5_port);
   inv_inputs_reg_4_inst : dfn10 port map( D => n815, CK => clk, Q => 
                           inv_inputs_4_port);
   inv_inputs_reg_3_inst : dfn10 port map( D => n814, CK => clk, Q => 
                           inv_inputs_3_port);
   inv_inputs_reg_2_inst : dfn10 port map( D => n813, CK => clk, Q => 
                           inv_inputs_2_port);
   inv_inputs_reg_1_inst : dfn10 port map( D => n812, CK => clk, Q => 
                           inv_inputs_1_port);
   inv_inputs_reg_0_inst : dfn10 port map( D => n811, CK => clk, Q => 
                           inv_inputs_0_port);
   cur_timer_2_start_reg : dfn10 port map( D => n810, CK => clk, Q => 
                           cur_timer_2_start);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_3_inst : dfr11 port map( D => n819, R => rst, CK => clk, Q => 
                           cur_state_3_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_draw_erase_start_reg : dfn10 port map( D => n809, CK => clk, Q => 
                           cur_draw_erase_start);
   cur_draw_erase_draw_reg : dfn10 port map( D => n808, CK => clk, Q => 
                           cur_draw_erase_draw);
   cur_timer_2_time_reg_7_inst : dfn10 port map( D => n807, CK => clk, Q => 
                           cur_timer_2_time_7_port);
   cur_timer_2_time_reg_6_inst : dfn10 port map( D => n806, CK => clk, Q => 
                           cur_timer_2_time_6_port);
   cur_timer_2_time_reg_5_inst : dfn10 port map( D => n805, CK => clk, Q => 
                           cur_timer_2_time_5_port);
   cur_timer_2_time_reg_4_inst : dfn10 port map( D => n804, CK => clk, Q => 
                           cur_timer_2_time_4_port);
   cur_timer_2_time_reg_3_inst : dfn10 port map( D => n803, CK => clk, Q => 
                           cur_timer_2_time_3_port);
   cur_timer_2_time_reg_2_inst : dfn10 port map( D => n802, CK => clk, Q => 
                           cur_timer_2_time_2_port);
   cur_timer_2_time_reg_1_inst : dfn10 port map( D => n801, CK => clk, Q => 
                           cur_timer_2_time_1_port);
   cur_timer_2_time_reg_0_inst : dfn10 port map( D => n800, CK => clk, Q => 
                           cur_timer_2_time_0_port);
   cur_timer_1_time_reg_7_inst : dfn10 port map( D => n799, CK => clk, Q => 
                           cur_timer_1_time_7_port);
   cur_timer_1_time_reg_6_inst : dfn10 port map( D => n798, CK => clk, Q => 
                           cur_timer_1_time_6_port);
   cur_timer_1_time_reg_5_inst : dfn10 port map( D => n797, CK => clk, Q => 
                           cur_timer_1_time_5_port);
   cur_timer_1_time_reg_4_inst : dfn10 port map( D => n796, CK => clk, Q => 
                           cur_timer_1_time_4_port);
   cur_timer_1_time_reg_3_inst : dfn10 port map( D => n795, CK => clk, Q => 
                           cur_timer_1_time_3_port);
   cur_timer_1_time_reg_2_inst : dfn10 port map( D => n794, CK => clk, Q => 
                           cur_timer_1_time_2_port);
   cur_timer_1_time_reg_1_inst : dfn10 port map( D => n793, CK => clk, Q => 
                           cur_timer_1_time_1_port);
   cur_timer_1_time_reg_0_inst : dfn10 port map( D => n792, CK => clk, Q => 
                           cur_timer_1_time_0_port);
   cur_timer_1_start_reg : dfn10 port map( D => n791, CK => clk, Q => 
                           cur_timer_1_start);
   cur_x_reg_0_inst : dfn10 port map( D => n790, CK => clk, Q => cur_x_0_port);
   cur_x_new_reg_0_inst : dfn10 port map( D => n789, CK => clk, Q => 
                           cur_x_new_0_port);
   cur_x_new_reg_1_inst : dfn10 port map( D => n788, CK => clk, Q => 
                           cur_x_new_1_port);
   cur_x_reg_1_inst : dfn10 port map( D => n787, CK => clk, Q => cur_x_1_port);
   cur_x_new_reg_2_inst : dfn10 port map( D => n786, CK => clk, Q => 
                           cur_x_new_2_port);
   cur_x_reg_2_inst : dfn10 port map( D => n785, CK => clk, Q => cur_x_2_port);
   cur_y_reg_0_inst : dfn10 port map( D => n784, CK => clk, Q => cur_y_0_port);
   cur_y_new_reg_1_inst : dfn10 port map( D => n783, CK => clk, Q => 
                           cur_y_new_1_port);
   cur_y_reg_1_inst : dfn10 port map( D => n782, CK => clk, Q => cur_y_1_port);
   cur_y_new_reg_0_inst : dfn10 port map( D => n781, CK => clk, Q => 
                           cur_y_new_0_port);
   cur_y_new_reg_2_inst : dfn10 port map( D => n780, CK => clk, Q => 
                           cur_y_new_2_port);
   cur_y_reg_2_inst : dfn10 port map( D => n779, CK => clk, Q => cur_y_2_port);
   cur_y_new_reg_3_inst : dfn10 port map( D => n778, CK => clk, Q => 
                           cur_y_new_3_port);
   cur_y_reg_3_inst : dfn10 port map( D => n777, CK => clk, Q => cur_y_3_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n776, CK => clk, Q => 
                           cur_rot_0_port);
   cur_rot_new_reg_1_inst : dfn10 port map( D => n775, CK => clk, Q => 
                           cur_rot_new_1_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n774, CK => clk, Q => 
                           cur_rot_1_port);
   cur_rot_new_reg_0_inst : dfn10 port map( D => n773, CK => clk, Q => 
                           cur_rot_new_0_port);
   cur_new_piece_reg : dfn10 port map( D => n772, CK => clk, Q => cur_new_piece
                           );
   cur_piece_reg_2_inst : dfn10 port map( D => n771, CK => clk, Q => 
                           cur_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n770, CK => clk, Q => 
                           cur_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n769, CK => clk, Q => 
                           cur_piece_0_port);
   cur_timer_1_reset_reg : dfn10 port map( D => n768, CK => clk, Q => 
                           cur_timer_1_reset);
   cur_draw_score_draw_reg : dfn10 port map( D => n767, CK => clk, Q => 
                           cur_draw_score_draw);
   cur_clear_shift_start_reg : dfn10 port map( D => n766, CK => clk, Q => 
                           cur_clear_shift_start);
   cur_lut_piece_type_reg_0_inst : dfn10 port map( D => n765, CK => clk, Q => 
                           cur_lut_piece_type_0_port);
   cur_lut_piece_type_reg_1_inst : dfn10 port map( D => n764, CK => clk, Q => 
                           cur_lut_piece_type_1_port);
   cur_lut_piece_type_reg_2_inst : dfn10 port map( D => n763, CK => clk, Q => 
                           cur_lut_piece_type_2_port);
   cur_lut_rot_reg_0_inst : dfn10 port map( D => n762, CK => clk, Q => 
                           cur_lut_rot_0_port);
   cur_lut_rot_reg_1_inst : dfn10 port map( D => n761, CK => clk, Q => 
                           cur_lut_rot_1_port);
   cur_lut_x_reg_0_inst : dfn10 port map( D => n760, CK => clk, Q => 
                           cur_lut_x_0_port);
   cur_lut_x_reg_1_inst : dfn10 port map( D => n759, CK => clk, Q => 
                           cur_lut_x_1_port);
   cur_lut_x_reg_2_inst : dfn10 port map( D => n758, CK => clk, Q => 
                           cur_lut_x_2_port);
   cur_lut_y_reg_0_inst : dfn10 port map( D => n757, CK => clk, Q => 
                           cur_lut_y_0_port);
   cur_lut_y_reg_1_inst : dfn10 port map( D => n756, CK => clk, Q => 
                           cur_lut_y_1_port);
   cur_lut_y_reg_2_inst : dfn10 port map( D => n755, CK => clk, Q => 
                           cur_lut_y_2_port);
   cur_lut_y_reg_3_inst : dfn10 port map( D => n754, CK => clk, Q => 
                           cur_lut_y_3_port);
   cur_check_start_reg : dfn10 port map( D => n753, CK => clk, Q => 
                           cur_check_start);
   cur_timer_2_reset_reg : dfn10 port map( D => n752, CK => clk, Q => 
                           cur_timer_2_reset);
   U859 : iv110 port map( A => rst, Y => n828);
   U860 : iv110 port map( A => rst, Y => n829);
   U861 : iv110 port map( A => rst, Y => n830);
   U862 : iv110 port map( A => n831, Y => timer_2_time(7));
   U863 : iv110 port map( A => n832, Y => timer_2_time(6));
   U864 : iv110 port map( A => n833, Y => timer_2_time(5));
   U865 : na210 port map( A => n834, B => n835, Y => timer_2_time(4));
   U866 : na210 port map( A => cur_timer_2_time_4_port, B => n836, Y => n835);
   U867 : na210 port map( A => n834, B => n837, Y => timer_2_time(3));
   U868 : na210 port map( A => cur_timer_2_time_3_port, B => n836, Y => n837);
   U869 : na210 port map( A => n834, B => n838, Y => timer_2_time(2));
   U870 : na210 port map( A => cur_timer_2_time_2_port, B => n836, Y => n838);
   U871 : na210 port map( A => n834, B => n839, Y => timer_2_time(1));
   U872 : na210 port map( A => cur_timer_2_time_1_port, B => n836, Y => n839);
   U873 : iv110 port map( A => n840, Y => timer_2_time(0));
   U874 : na210 port map( A => n841, B => n842, Y => timer_2_start);
   U875 : iv110 port map( A => n843, Y => n842);
   U876 : no210 port map( A => n844, B => n845, Y => n843);
   U877 : na210 port map( A => n846, B => n847, Y => timer_2_reset);
   U878 : na210 port map( A => cur_timer_2_reset, B => n848, Y => n847);
   U879 : iv110 port map( A => n849, Y => timer_1_time(7));
   U880 : iv110 port map( A => n850, Y => timer_1_time(6));
   U881 : iv110 port map( A => n851, Y => timer_1_time(5));
   U882 : na210 port map( A => n852, B => n853, Y => timer_1_time(4));
   U883 : na210 port map( A => cur_timer_1_time_4_port, B => n854, Y => n853);
   U884 : na210 port map( A => n852, B => n855, Y => timer_1_time(3));
   U885 : na210 port map( A => cur_timer_1_time_3_port, B => n854, Y => n855);
   U886 : na210 port map( A => n852, B => n856, Y => timer_1_time(2));
   U887 : na210 port map( A => cur_timer_1_time_2_port, B => n854, Y => n856);
   U888 : na210 port map( A => n852, B => n857, Y => timer_1_time(1));
   U889 : na210 port map( A => cur_timer_1_time_1_port, B => n854, Y => n857);
   U890 : iv110 port map( A => n858, Y => n852);
   U891 : iv110 port map( A => n859, Y => timer_1_time(0));
   U892 : na210 port map( A => n860, B => n861, Y => timer_1_start);
   U893 : na210 port map( A => cur_timer_1_start, B => n862, Y => n861);
   U894 : na210 port map( A => n846, B => n863, Y => timer_1_reset);
   U895 : na210 port map( A => cur_timer_1_reset, B => n848, Y => n863);
   U896 : iv110 port map( A => n864, Y => n848);
   U897 : na310 port map( A => n865, B => n866, C => n867, Y => 
                           next_state_5_port);
   U898 : no210 port map( A => n868, B => n869, Y => n867);
   U899 : iv110 port map( A => n870, Y => n869);
   U900 : no310 port map( A => n871, B => n872, C => n873, Y => n870);
   U901 : no210 port map( A => n874, B => inv_inputs_3_port, Y => n873);
   U902 : no210 port map( A => n875, B => n876, Y => n871);
   U903 : na310 port map( A => n877, B => n878, C => n879, Y => n868);
   U904 : no310 port map( A => n880, B => n881, C => n882, Y => n866);
   U905 : no210 port map( A => clear_shift_ready, B => n883, Y => n881);
   U906 : no310 port map( A => n884, B => n885, C => n886, Y => n865);
   U907 : na310 port map( A => n887, B => n888, C => n889, Y => 
                           next_state_4_port);
   U908 : no310 port map( A => n890, B => n891, C => n892, Y => n889);
   U909 : no210 port map( A => n893, B => n894, Y => n892);
   U910 : no210 port map( A => n895, B => n875, Y => n891);
   U911 : na310 port map( A => n896, B => n897, C => n898, Y => n890);
   U912 : na210 port map( A => n899, B => n900, Y => n898);
   U913 : na210 port map( A => timer_1_done, B => n844, Y => n900);
   U914 : no310 port map( A => n901, B => n902, C => n903, Y => n888);
   U915 : no210 port map( A => n904, B => n905, Y => n887);
   U916 : na310 port map( A => n906, B => n907, C => n908, Y => 
                           next_state_2_port);
   U917 : no210 port map( A => n909, B => n910, Y => n908);
   U918 : na310 port map( A => n911, B => n912, C => n913, Y => n910);
   U919 : na210 port map( A => check_empty, B => n914, Y => n912);
   U920 : na210 port map( A => timer_2_done, B => n915, Y => n911);
   U921 : na310 port map( A => n916, B => n874, C => n917, Y => n909);
   U922 : no310 port map( A => n905, B => n918, C => n885, Y => n907);
   U923 : na310 port map( A => n919, B => n920, C => n921, Y => n885);
   U924 : iv110 port map( A => n922, Y => n921);
   U925 : na310 port map( A => n841, B => n923, C => n924, Y => n922);
   U926 : na210 port map( A => n925, B => n926, Y => n920);
   U927 : no210 port map( A => n927, B => n928, Y => n919);
   U928 : na310 port map( A => n929, B => n930, C => n931, Y => n905);
   U929 : no310 port map( A => n932, B => n933, C => n934, Y => n931);
   U930 : no210 port map( A => n935, B => n936, Y => n934);
   U931 : na210 port map( A => n937, B => n938, Y => n932);
   U932 : no210 port map( A => n939, B => n940, Y => n929);
   U933 : no210 port map( A => n883, B => n941, Y => n940);
   U934 : iv110 port map( A => clear_shift_ready, Y => n941);
   U935 : no210 port map( A => inv_inputs_0_port, B => n942, Y => n939);
   U936 : no310 port map( A => n943, B => n944, C => n945, Y => n906);
   U937 : mu111 port map( A => n946, B => n947, S => draw_erase_ready, Y => 
                           n943);
   U938 : na210 port map( A => n948, B => n949, Y => n947);
   U939 : iv110 port map( A => n950, Y => n946);
   U940 : na310 port map( A => n951, B => n952, C => n953, Y => 
                           next_state_1_port);
   U941 : no310 port map( A => n954, B => n955, C => n956, Y => n953);
   U942 : na210 port map( A => n957, B => n958, Y => n956);
   U943 : iv110 port map( A => n959, Y => n955);
   U944 : na310 port map( A => n960, B => n876, C => n961, Y => n959);
   U945 : na310 port map( A => n923, B => n883, C => n962, Y => n954);
   U946 : iv110 port map( A => n963, Y => n962);
   U947 : na210 port map( A => n935, B => n964, Y => n963);
   U948 : no310 port map( A => n965, B => n966, C => n967, Y => n952);
   U949 : no210 port map( A => inv_inputs_2_port, B => n916, Y => n967);
   U950 : no210 port map( A => check_empty, B => n896, Y => n966);
   U951 : no210 port map( A => n968, B => n969, Y => n965);
   U952 : no310 port map( A => n970, B => n880, C => n971, Y => n951);
   U953 : na310 port map( A => n972, B => n973, C => n974, Y => n880);
   U954 : na310 port map( A => n975, B => n976, C => n977, Y => 
                           next_state_0_port);
   U955 : no210 port map( A => n978, B => n979, Y => n977);
   U956 : na310 port map( A => n980, B => n942, C => n981, Y => n979);
   U957 : na210 port map( A => check_empty, B => n982, Y => n981);
   U958 : na210 port map( A => n983, B => n896, Y => n982);
   U959 : na310 port map( A => timer_1_done, B => n844, C => n899, Y => n980);
   U960 : iv110 port map( A => cur_timer_2_start, Y => n844);
   U961 : na310 port map( A => n984, B => n878, C => n985, Y => n978);
   U962 : no210 port map( A => n915, B => n986, Y => n985);
   U963 : no310 port map( A => n987, B => n988, C => n989, Y => n976);
   U964 : no210 port map( A => n894, B => n973, Y => n989);
   U965 : no210 port map( A => n990, B => n991, Y => n988);
   U966 : no310 port map( A => n992, B => n993, C => n994, Y => n990);
   U967 : no210 port map( A => n916, B => n995, Y => n987);
   U968 : no310 port map( A => n996, B => n997, C => n971, Y => n975);
   U969 : na310 port map( A => n998, B => n999, C => n1000, Y => n971);
   U970 : no310 port map( A => n1001, B => n1002, C => n1003, Y => n1000);
   U971 : no210 port map( A => draw_erase_ready, B => n1004, Y => n1003);
   U972 : no210 port map( A => n874, B => n1005, Y => n1001);
   U973 : no210 port map( A => n1006, B => n944, Y => n998);
   U974 : na210 port map( A => n1007, B => n1008, Y => n944);
   U975 : na210 port map( A => n1009, B => n894, Y => n1008);
   U976 : iv110 port map( A => check_ready, Y => n894);
   U977 : iv110 port map( A => n1010, Y => n997);
   U978 : na210 port map( A => n1011, B => n1012, Y => n1010);
   U979 : na210 port map( A => n1013, B => n1014, Y => new_piece);
   U980 : na210 port map( A => cur_new_piece, B => n1015, Y => n1014);
   U981 : na310 port map( A => n1016, B => n1017, C => n1018, Y => n819);
   U982 : no310 port map( A => n1019, B => n904, C => n970, Y => n1018);
   U983 : na310 port map( A => n1020, B => n1021, C => n1022, Y => n970);
   U984 : no310 port map( A => n1023, B => n1024, C => n1025, Y => n1022);
   U985 : no210 port map( A => n942, B => n1026, Y => n1025);
   U986 : no210 port map( A => n994, B => n899, Y => n1020);
   U987 : iv110 port map( A => n879, Y => n899);
   U988 : iv110 port map( A => n1027, Y => n994);
   U989 : na310 port map( A => n983, B => n1028, C => n1029, Y => n904);
   U990 : na210 port map( A => n915, B => n969, Y => n1029);
   U991 : iv110 port map( A => timer_2_done, Y => n969);
   U992 : na310 port map( A => n1030, B => n913, C => n930, Y => n1019);
   U993 : no310 port map( A => n1002, B => n1031, C => n1032, Y => n930);
   U994 : na310 port map( A => n877, B => n984, C => n1033, Y => n1032);
   U995 : na310 port map( A => n960, B => n961, C => n895, Y => n984);
   U996 : iv110 port map( A => n876, Y => n895);
   U997 : na210 port map( A => n1034, B => n1035, Y => n876);
   U998 : no310 port map( A => n1036, B => inv_inputs_5_port, C => 
                           inv_inputs_4_port, Y => n1035);
   U999 : iv110 port map( A => n1037, Y => n1036);
   U1000 : no210 port map( A => inv_inputs_6_port, B => inv_inputs_7_port, Y =>
                           n1037);
   U1001 : no310 port map( A => n1038, B => inv_inputs_1_port, C => 
                           inv_inputs_0_port, Y => n1034);
   U1002 : na210 port map( A => n995, B => n1005, Y => n1038);
   U1003 : na210 port map( A => n1039, B => n960, Y => n877);
   U1004 : iv110 port map( A => n1040, Y => n1031);
   U1005 : no310 port map( A => n1041, B => n986, C => n1042, Y => n1017);
   U1006 : no310 port map( A => n1043, B => n1044, C => n1045, Y => n1016);
   U1007 : no210 port map( A => check_ready, B => n893, Y => n1045);
   U1008 : iv110 port map( A => n1009, Y => n893);
   U1009 : no210 port map( A => n1046, B => n991, Y => n1044);
   U1010 : iv110 port map( A => n1047, Y => n1046);
   U1011 : na210 port map( A => n950, B => n1048, Y => n1047);
   U1012 : mu111 port map( A => n1049, B => inv_inputs_7_port, S => rst, Y => 
                           n818);
   U1013 : iv110 port map( A => inputs(7), Y => n1049);
   U1014 : mu111 port map( A => n1050, B => inv_inputs_6_port, S => rst, Y => 
                           n817);
   U1015 : iv110 port map( A => inputs(6), Y => n1050);
   U1016 : mu111 port map( A => n1051, B => inv_inputs_5_port, S => rst, Y => 
                           n816);
   U1017 : iv110 port map( A => inputs(5), Y => n1051);
   U1018 : mu111 port map( A => n1052, B => inv_inputs_4_port, S => rst, Y => 
                           n815);
   U1019 : iv110 port map( A => inputs(4), Y => n1052);
   U1020 : iv110 port map( A => n1053, Y => n814);
   U1021 : mu111 port map( A => inputs(3), B => n1005, S => rst, Y => n1053);
   U1022 : iv110 port map( A => inv_inputs_3_port, Y => n1005);
   U1023 : iv110 port map( A => n1054, Y => n813);
   U1024 : mu111 port map( A => inputs(2), B => n995, S => rst, Y => n1054);
   U1025 : iv110 port map( A => inv_inputs_2_port, Y => n995);
   U1026 : iv110 port map( A => n1055, Y => n812);
   U1027 : mu111 port map( A => inputs(1), B => n936, S => rst, Y => n1055);
   U1028 : iv110 port map( A => inv_inputs_1_port, Y => n936);
   U1029 : iv110 port map( A => n1056, Y => n811);
   U1030 : mu111 port map( A => inputs(0), B => n1026, S => rst, Y => n1056);
   U1031 : iv110 port map( A => inv_inputs_0_port, Y => n1026);
   U1032 : na210 port map( A => n1057, B => n1058, Y => n810);
   U1033 : na210 port map( A => cur_timer_2_start, B => n1059, Y => n1058);
   U1034 : na210 port map( A => n845, B => n829, Y => n1059);
   U1035 : no310 port map( A => n1060, B => n882, C => n1061, Y => n845);
   U1036 : na210 port map( A => n1062, B => n1063, Y => n1061);
   U1037 : na210 port map( A => n1064, B => n828, Y => n1057);
   U1038 : na210 port map( A => n1065, B => n1066, Y => n809);
   U1039 : na210 port map( A => cur_draw_erase_start, B => n1067, Y => n1066);
   U1040 : na210 port map( A => n1068, B => n830, Y => n1067);
   U1041 : iv110 port map( A => n1069, Y => n1068);
   U1042 : iv110 port map( A => n1070, Y => n1065);
   U1043 : no210 port map( A => n1071, B => rst, Y => n1070);
   U1044 : na210 port map( A => n1072, B => n1073, Y => n808);
   U1045 : na210 port map( A => cur_draw_erase_draw, B => n1074, Y => n1073);
   U1046 : na210 port map( A => n1075, B => n829, Y => n1074);
   U1047 : iv110 port map( A => n1076, Y => n1075);
   U1048 : na210 port map( A => n1077, B => n828, Y => n1072);
   U1049 : iv110 port map( A => n1078, Y => n1077);
   U1050 : na210 port map( A => n831, B => n1079, Y => n807);
   U1051 : na210 port map( A => rst, B => cur_timer_2_time_7_port, Y => n1079);
   U1052 : na210 port map( A => cur_timer_2_time_7_port, B => n836, Y => n831);
   U1053 : na210 port map( A => n832, B => n1080, Y => n806);
   U1054 : na210 port map( A => rst, B => cur_timer_2_time_6_port, Y => n1080);
   U1055 : na210 port map( A => cur_timer_2_time_6_port, B => n836, Y => n832);
   U1056 : na210 port map( A => n833, B => n1081, Y => n805);
   U1057 : na210 port map( A => rst, B => cur_timer_2_time_5_port, Y => n1081);
   U1058 : na210 port map( A => cur_timer_2_time_5_port, B => n836, Y => n833);
   U1059 : na210 port map( A => n1082, B => n1083, Y => n804);
   U1060 : na210 port map( A => cur_timer_2_time_4_port, B => n1084, Y => n1083
                           );
   U1061 : na210 port map( A => n1082, B => n1085, Y => n803);
   U1062 : na210 port map( A => cur_timer_2_time_3_port, B => n1084, Y => n1085
                           );
   U1063 : na210 port map( A => n1082, B => n1086, Y => n802);
   U1064 : na210 port map( A => cur_timer_2_time_2_port, B => n1084, Y => n1086
                           );
   U1065 : na210 port map( A => n1082, B => n1087, Y => n801);
   U1066 : na210 port map( A => cur_timer_2_time_1_port, B => n1084, Y => n1087
                           );
   U1067 : na210 port map( A => n1088, B => n830, Y => n1084);
   U1068 : na210 port map( A => n1089, B => n829, Y => n1082);
   U1069 : na210 port map( A => n840, B => n1090, Y => n800);
   U1070 : na210 port map( A => rst, B => cur_timer_2_time_0_port, Y => n1090);
   U1071 : na210 port map( A => cur_timer_2_time_0_port, B => n836, Y => n840);
   U1072 : iv110 port map( A => n1088, Y => n836);
   U1073 : no310 port map( A => n1091, B => n1092, C => n901, Y => n1088);
   U1074 : na210 port map( A => n849, B => n1093, Y => n799);
   U1075 : na210 port map( A => rst, B => cur_timer_1_time_7_port, Y => n1093);
   U1076 : na210 port map( A => cur_timer_1_time_7_port, B => n854, Y => n849);
   U1077 : na210 port map( A => n850, B => n1094, Y => n798);
   U1078 : na210 port map( A => rst, B => cur_timer_1_time_6_port, Y => n1094);
   U1079 : na210 port map( A => cur_timer_1_time_6_port, B => n854, Y => n850);
   U1080 : na210 port map( A => n851, B => n1095, Y => n797);
   U1081 : na210 port map( A => rst, B => cur_timer_1_time_5_port, Y => n1095);
   U1082 : na210 port map( A => cur_timer_1_time_5_port, B => n854, Y => n851);
   U1083 : na210 port map( A => n1096, B => n1097, Y => n796);
   U1084 : na210 port map( A => cur_timer_1_time_4_port, B => n1098, Y => n1097
                           );
   U1085 : na210 port map( A => n1096, B => n1099, Y => n795);
   U1086 : na210 port map( A => cur_timer_1_time_3_port, B => n1098, Y => n1099
                           );
   U1087 : na210 port map( A => n1096, B => n1100, Y => n794);
   U1088 : na210 port map( A => cur_timer_1_time_2_port, B => n1098, Y => n1100
                           );
   U1089 : na210 port map( A => n1096, B => n1101, Y => n793);
   U1090 : na210 port map( A => cur_timer_1_time_1_port, B => n1098, Y => n1101
                           );
   U1091 : na210 port map( A => n1102, B => n828, Y => n1098);
   U1092 : iv110 port map( A => n854, Y => n1102);
   U1093 : na210 port map( A => n858, B => n830, Y => n1096);
   U1094 : na310 port map( A => n1028, B => n924, C => n834, Y => n858);
   U1095 : iv110 port map( A => n1089, Y => n834);
   U1096 : na210 port map( A => n846, B => n938, Y => n1089);
   U1097 : na210 port map( A => n859, B => n1103, Y => n792);
   U1098 : na210 port map( A => rst, B => cur_timer_1_time_0_port, Y => n1103);
   U1099 : na210 port map( A => cur_timer_1_time_0_port, B => n854, Y => n859);
   U1100 : na310 port map( A => n1104, B => n1105, C => n1106, Y => n854);
   U1101 : no310 port map( A => n1107, B => n1002, C => n872, Y => n1106);
   U1102 : na310 port map( A => n1033, B => n878, C => n958, Y => n1107);
   U1103 : no310 port map( A => n1108, B => n928, C => n1109, Y => n1105);
   U1104 : iv110 port map( A => n1110, Y => n1108);
   U1105 : no210 port map( A => n901, B => n1111, Y => n1104);
   U1106 : na210 port map( A => n1112, B => n1113, Y => n791);
   U1107 : na210 port map( A => cur_timer_1_start, B => n1114, Y => n1113);
   U1108 : na210 port map( A => n1115, B => n829, Y => n1114);
   U1109 : iv110 port map( A => n862, Y => n1115);
   U1110 : na310 port map( A => n1116, B => n1117, C => n1118, Y => n862);
   U1111 : no310 port map( A => n1064, B => n1119, C => n933, Y => n1118);
   U1112 : iv110 port map( A => n841, Y => n1064);
   U1113 : iv110 port map( A => n1092, Y => n1117);
   U1114 : na210 port map( A => n1110, B => n1120, Y => n1092);
   U1115 : no310 port map( A => n1121, B => n986, C => n1122, Y => n1110);
   U1116 : na210 port map( A => n1123, B => n1124, Y => n1122);
   U1117 : no210 port map( A => n1125, B => n1126, Y => n1116);
   U1118 : na210 port map( A => n1127, B => n828, Y => n1112);
   U1119 : iv110 port map( A => n860, Y => n1127);
   U1120 : no210 port map( A => n1128, B => n927, Y => n860);
   U1121 : na310 port map( A => n1129, B => n1130, C => n1131, Y => n790);
   U1122 : na210 port map( A => cur_x_new_0_port, B => n1132, Y => n1131);
   U1123 : na210 port map( A => cur_x_0_port, B => n1133, Y => n1129);
   U1124 : na210 port map( A => n1134, B => n1135, Y => n789);
   U1125 : na210 port map( A => cur_x_new_0_port, B => n1136, Y => n1135);
   U1126 : mu111 port map( A => n1137, B => n1138, S => cur_x_0_port, Y => 
                           n1134);
   U1127 : na210 port map( A => n1139, B => n1140, Y => n788);
   U1128 : na210 port map( A => n1141, B => n830, Y => n1140);
   U1129 : na310 port map( A => n1142, B => n1143, C => n1144, Y => n1141);
   U1130 : na210 port map( A => cur_x_1_port, B => n1145, Y => n1144);
   U1131 : na310 port map( A => n1146, B => n1147, C => n1148, Y => n1142);
   U1132 : na210 port map( A => cur_x_new_1_port, B => n1136, Y => n1139);
   U1133 : na310 port map( A => n1149, B => n1130, C => n1150, Y => n787);
   U1134 : na210 port map( A => cur_x_new_1_port, B => n1132, Y => n1150);
   U1135 : na210 port map( A => cur_x_1_port, B => n1133, Y => n1149);
   U1136 : na310 port map( A => n1151, B => n1152, C => n1153, Y => n786);
   U1137 : na210 port map( A => cur_x_new_2_port, B => n1136, Y => n1153);
   U1138 : iv110 port map( A => n1154, Y => n1152);
   U1139 : no210 port map( A => n1155, B => n1137, Y => n1154);
   U1140 : mu111 port map( A => n1156, B => n1157, S => cur_x_2_port, Y => 
                           n1155);
   U1141 : ex210 port map( A => n1143, B => n1147, Y => n1157);
   U1142 : mu111 port map( A => n1158, B => n1143, S => n1147, Y => n1156);
   U1143 : na210 port map( A => n1158, B => n1159, Y => n1143);
   U1144 : na210 port map( A => n1147, B => n1146, Y => n1159);
   U1145 : iv110 port map( A => n1160, Y => n1146);
   U1146 : no210 port map( A => cur_x_1_port, B => cur_x_0_port, Y => n1160);
   U1147 : na210 port map( A => cur_x_1_port, B => cur_x_0_port, Y => n1147);
   U1148 : na210 port map( A => cur_x_2_port, B => n1161, Y => n1151);
   U1149 : iv110 port map( A => n1138, Y => n1161);
   U1150 : na210 port map( A => n1162, B => n1163, Y => n785);
   U1151 : na210 port map( A => cur_x_2_port, B => n1133, Y => n1163);
   U1152 : iv110 port map( A => n1164, Y => n1133);
   U1153 : no210 port map( A => n1165, B => n903, Y => n1164);
   U1154 : na210 port map( A => cur_x_new_2_port, B => n1132, Y => n1162);
   U1155 : na310 port map( A => n1166, B => n1167, C => n1168, Y => n784);
   U1156 : na210 port map( A => n1132, B => n1169, Y => n1168);
   U1157 : na210 port map( A => cur_y_new_0_port, B => n1170, Y => n1167);
   U1158 : na210 port map( A => cur_y_0_port, B => n1171, Y => n1166);
   U1159 : mu111 port map( A => n1172, B => cur_y_new_1_port, S => rst, Y => 
                           n783);
   U1160 : na310 port map( A => n1173, B => n1174, C => n1175, Y => n782);
   U1161 : na210 port map( A => n1132, B => n1172, Y => n1175);
   U1162 : na210 port map( A => cur_y_new_1_port, B => n1170, Y => n1174);
   U1163 : na210 port map( A => cur_y_1_port, B => n1171, Y => n1173);
   U1164 : mu111 port map( A => n1169, B => cur_y_new_0_port, S => rst, Y => 
                           n781);
   U1165 : mu111 port map( A => n1176, B => cur_y_new_2_port, S => rst, Y => 
                           n780);
   U1166 : na310 port map( A => n1177, B => n1178, C => n1179, Y => n779);
   U1167 : na210 port map( A => n1132, B => n1176, Y => n1179);
   U1168 : na210 port map( A => cur_y_new_2_port, B => n1170, Y => n1178);
   U1169 : na210 port map( A => cur_y_2_port, B => n1171, Y => n1177);
   U1170 : mu111 port map( A => n1180, B => cur_y_new_3_port, S => rst, Y => 
                           n778);
   U1171 : na310 port map( A => n1181, B => n1182, C => n1183, Y => n777);
   U1172 : na210 port map( A => n1132, B => n1180, Y => n1183);
   U1173 : na210 port map( A => cur_y_new_3_port, B => n1170, Y => n1182);
   U1174 : no310 port map( A => n1184, B => rst, C => n926, Y => n1170);
   U1175 : na210 port map( A => cur_y_3_port, B => n1171, Y => n1181);
   U1176 : iv110 port map( A => n1185, Y => n1171);
   U1177 : no310 port map( A => n1165, B => n996, C => n1186, Y => n1185);
   U1178 : na210 port map( A => n957, B => n1187, Y => n1186);
   U1179 : iv110 port map( A => n1006, Y => n1187);
   U1180 : na210 port map( A => n917, B => n1188, Y => n996);
   U1181 : na210 port map( A => n914, B => n926, Y => n1188);
   U1182 : iv110 port map( A => check_empty, Y => n926);
   U1183 : na310 port map( A => n1189, B => n1190, C => n1191, Y => n1165);
   U1184 : no210 port map( A => rst, B => n872, Y => n1191);
   U1185 : na210 port map( A => n1192, B => n1193, Y => n776);
   U1186 : na210 port map( A => cur_rot_0_port, B => n1194, Y => n1193);
   U1187 : na210 port map( A => cur_rot_new_0_port, B => n1132, Y => n1192);
   U1188 : mu111 port map( A => n1195, B => cur_rot_new_1_port, S => rst, Y => 
                           n775);
   U1189 : na210 port map( A => n1196, B => n1197, Y => n774);
   U1190 : na210 port map( A => cur_rot_1_port, B => n1194, Y => n1197);
   U1191 : na210 port map( A => n1198, B => n1199, Y => n1194);
   U1192 : na210 port map( A => n1132, B => n1195, Y => n1196);
   U1193 : no210 port map( A => n964, B => rst, Y => n1132);
   U1194 : na210 port map( A => n1200, B => n1201, Y => n773);
   U1195 : na210 port map( A => cur_rot_new_0_port, B => n1136, Y => n1201);
   U1196 : na210 port map( A => n1202, B => n829, Y => n1136);
   U1197 : mu111 port map( A => n1138, B => n1137, S => cur_rot_0_port, Y => 
                           n1200);
   U1198 : na210 port map( A => n1203, B => n828, Y => n1137);
   U1199 : na210 port map( A => n1145, B => n830, Y => n1138);
   U1200 : na210 port map( A => n1130, B => n1204, Y => n772);
   U1201 : na210 port map( A => cur_new_piece, B => n1205, Y => n1204);
   U1202 : na210 port map( A => n1206, B => n829, Y => n1205);
   U1203 : iv110 port map( A => n1015, Y => n1206);
   U1204 : na310 port map( A => n1189, B => n1190, C => n1207, Y => n1015);
   U1205 : no210 port map( A => n1208, B => n903, Y => n1207);
   U1206 : no310 port map( A => n1209, B => n1111, C => n1210, Y => n1189);
   U1207 : na310 port map( A => n1211, B => n878, C => n1027, Y => n1210);
   U1208 : na210 port map( A => n1212, B => n1213, Y => n771);
   U1209 : na210 port map( A => next_piece(2), B => n1214, Y => n1213);
   U1210 : na210 port map( A => cur_piece_2_port, B => n1215, Y => n1212);
   U1211 : na210 port map( A => n1216, B => n1217, Y => n770);
   U1212 : na210 port map( A => next_piece(1), B => n1214, Y => n1217);
   U1213 : na210 port map( A => cur_piece_1_port, B => n1215, Y => n1216);
   U1214 : na210 port map( A => n1218, B => n1219, Y => n769);
   U1215 : na210 port map( A => next_piece(0), B => n1214, Y => n1219);
   U1216 : iv110 port map( A => n1130, Y => n1214);
   U1217 : na210 port map( A => n1002, B => n828, Y => n1130);
   U1218 : na210 port map( A => cur_piece_0_port, B => n1215, Y => n1218);
   U1219 : na310 port map( A => n1198, B => n1211, C => n1220, Y => n1215);
   U1220 : no210 port map( A => n1208, B => n872, Y => n1220);
   U1221 : iv110 port map( A => n964, Y => n1208);
   U1222 : no310 port map( A => n1221, B => n1222, C => n1223, Y => n1198);
   U1223 : iv110 port map( A => n1224, Y => n1223);
   U1224 : no310 port map( A => n1225, B => n1226, C => n1227, Y => n1224);
   U1225 : na210 port map( A => n1228, B => n1030, Y => n1225);
   U1226 : iv110 port map( A => n886, Y => n1228);
   U1227 : na210 port map( A => n830, B => n1027, Y => n1222);
   U1228 : na210 port map( A => n1229, B => n1190, Y => n1221);
   U1229 : na210 port map( A => n1230, B => n1231, Y => n768);
   U1230 : na210 port map( A => cur_timer_1_reset, B => n1232, Y => n1231);
   U1231 : na210 port map( A => n1233, B => n1234, Y => n767);
   U1232 : na210 port map( A => cur_draw_score_draw, B => rst, Y => n1234);
   U1233 : na210 port map( A => n1235, B => n1236, Y => n766);
   U1234 : na210 port map( A => cur_clear_shift_start, B => n1237, Y => n1236);
   U1235 : na210 port map( A => n1238, B => n829, Y => n1237);
   U1236 : na210 port map( A => n1024, B => n828, Y => n1235);
   U1237 : na210 port map( A => n1239, B => n1240, Y => n765);
   U1238 : na210 port map( A => n1241, B => cur_piece_0_port, Y => n1240);
   U1239 : na210 port map( A => cur_lut_piece_type_0_port, B => n1242, Y => 
                           n1239);
   U1240 : na210 port map( A => n1243, B => n1244, Y => n764);
   U1241 : na210 port map( A => n1241, B => cur_piece_1_port, Y => n1244);
   U1242 : na210 port map( A => cur_lut_piece_type_1_port, B => n1242, Y => 
                           n1243);
   U1243 : na210 port map( A => n1245, B => n1246, Y => n763);
   U1244 : na210 port map( A => n1241, B => cur_piece_2_port, Y => n1246);
   U1245 : iv110 port map( A => n1247, Y => n1241);
   U1246 : na210 port map( A => n1248, B => n830, Y => n1247);
   U1247 : na210 port map( A => cur_lut_piece_type_2_port, B => n1242, Y => 
                           n1245);
   U1248 : na210 port map( A => n1249, B => n1250, Y => n762);
   U1249 : na210 port map( A => n1251, B => n829, Y => n1250);
   U1250 : na210 port map( A => cur_lut_rot_0_port, B => n1242, Y => n1249);
   U1251 : na210 port map( A => n1252, B => n1253, Y => n761);
   U1252 : na210 port map( A => n1254, B => n828, Y => n1253);
   U1253 : na210 port map( A => cur_lut_rot_1_port, B => n1242, Y => n1252);
   U1254 : na210 port map( A => n1255, B => n1256, Y => n760);
   U1255 : na210 port map( A => n1257, B => n830, Y => n1256);
   U1256 : na210 port map( A => cur_lut_x_0_port, B => n1242, Y => n1255);
   U1257 : na210 port map( A => n1258, B => n1259, Y => n759);
   U1258 : na210 port map( A => n1260, B => n829, Y => n1259);
   U1259 : na210 port map( A => cur_lut_x_1_port, B => n1242, Y => n1258);
   U1260 : na210 port map( A => n1261, B => n1262, Y => n758);
   U1261 : na210 port map( A => n1263, B => n828, Y => n1262);
   U1262 : na210 port map( A => cur_lut_x_2_port, B => n1242, Y => n1261);
   U1263 : na210 port map( A => n1264, B => n1265, Y => n757);
   U1264 : na210 port map( A => n1266, B => n830, Y => n1265);
   U1265 : na210 port map( A => cur_lut_y_0_port, B => n1242, Y => n1264);
   U1266 : na210 port map( A => n1267, B => n1268, Y => n756);
   U1267 : na210 port map( A => n1269, B => n829, Y => n1268);
   U1268 : na210 port map( A => cur_lut_y_1_port, B => n1242, Y => n1267);
   U1269 : na210 port map( A => n1270, B => n1271, Y => n755);
   U1270 : na210 port map( A => n1272, B => n828, Y => n1271);
   U1271 : na210 port map( A => cur_lut_y_2_port, B => n1242, Y => n1270);
   U1272 : na210 port map( A => n1273, B => n1274, Y => n754);
   U1273 : na210 port map( A => n1275, B => n830, Y => n1274);
   U1274 : na210 port map( A => cur_lut_y_3_port, B => n1242, Y => n1273);
   U1275 : na210 port map( A => n1276, B => n829, Y => n1242);
   U1276 : na210 port map( A => n1277, B => n1278, Y => n753);
   U1277 : na210 port map( A => cur_check_start, B => n1279, Y => n1278);
   U1278 : na210 port map( A => n1280, B => n828, Y => n1279);
   U1279 : na210 port map( A => n1281, B => n830, Y => n1277);
   U1280 : iv110 port map( A => n1282, Y => n1281);
   U1281 : na210 port map( A => n1230, B => n1283, Y => n752);
   U1282 : na210 port map( A => cur_timer_2_reset, B => n1232, Y => n1283);
   U1283 : na210 port map( A => n864, B => n829, Y => n1232);
   U1284 : no310 port map( A => n1091, B => n1121, C => n1284, Y => n864);
   U1285 : na310 port map( A => n1285, B => n1286, C => n1287, Y => n1121);
   U1286 : iv110 port map( A => n1288, Y => n1287);
   U1287 : na310 port map( A => n1062, B => n968, C => n883, Y => n1288);
   U1288 : no210 port map( A => n1289, B => n903, Y => n1285);
   U1289 : na210 port map( A => n1041, B => n828, Y => n1230);
   U1290 : na210 port map( A => n1290, B => n1291, Y => lut_y(3));
   U1291 : na210 port map( A => cur_lut_y_3_port, B => n1292, Y => n1291);
   U1292 : iv110 port map( A => n1275, Y => n1290);
   U1293 : na210 port map( A => n1293, B => n1294, Y => n1275);
   U1294 : na210 port map( A => n1180, B => n1295, Y => n1294);
   U1295 : na210 port map( A => n1296, B => n1297, Y => n1180);
   U1296 : na210 port map( A => cur_y_new_3_port, B => n1298, Y => n1297);
   U1297 : mu111 port map( A => n1299, B => n1300, S => cur_y_3_port, Y => 
                           n1296);
   U1298 : no210 port map( A => n1301, B => n1302, Y => n1300);
   U1299 : no210 port map( A => cur_y_2_port, B => n972, Y => n1301);
   U1300 : na310 port map( A => n1303, B => n1304, C => cur_y_2_port, Y => 
                           n1299);
   U1301 : na210 port map( A => cur_y_3_port, B => n1305, Y => n1293);
   U1302 : na210 port map( A => n1306, B => n1307, Y => lut_y(2));
   U1303 : na210 port map( A => cur_lut_y_2_port, B => n1292, Y => n1307);
   U1304 : iv110 port map( A => n1272, Y => n1306);
   U1305 : na210 port map( A => n1308, B => n1309, Y => n1272);
   U1306 : na210 port map( A => n1176, B => n1295, Y => n1309);
   U1307 : na210 port map( A => n1310, B => n1311, Y => n1176);
   U1308 : na210 port map( A => cur_y_new_2_port, B => n1298, Y => n1311);
   U1309 : mu111 port map( A => n1312, B => n1313, S => cur_y_2_port, Y => 
                           n1310);
   U1310 : iv110 port map( A => n1302, Y => n1313);
   U1311 : na210 port map( A => n1314, B => n1315, Y => n1302);
   U1312 : na210 port map( A => n1304, B => n1316, Y => n1315);
   U1313 : na210 port map( A => n1303, B => n1304, Y => n1312);
   U1314 : iv110 port map( A => n1316, Y => n1303);
   U1315 : na210 port map( A => cur_y_1_port, B => cur_y_0_port, Y => n1316);
   U1316 : na210 port map( A => cur_y_2_port, B => n1305, Y => n1308);
   U1317 : na210 port map( A => n1317, B => n1318, Y => lut_y(1));
   U1318 : na210 port map( A => cur_lut_y_1_port, B => n1292, Y => n1318);
   U1319 : iv110 port map( A => n1269, Y => n1317);
   U1320 : na210 port map( A => n1319, B => n1320, Y => n1269);
   U1321 : na210 port map( A => n1172, B => n1295, Y => n1320);
   U1322 : na210 port map( A => n1321, B => n1322, Y => n1172);
   U1323 : na210 port map( A => cur_y_new_1_port, B => n1298, Y => n1322);
   U1324 : mu111 port map( A => n1323, B => n1324, S => cur_y_1_port, Y => 
                           n1321);
   U1325 : no210 port map( A => n1325, B => n1023, Y => n1324);
   U1326 : iv110 port map( A => n1314, Y => n1023);
   U1327 : no210 port map( A => cur_y_0_port, B => n972, Y => n1325);
   U1328 : na210 port map( A => n1304, B => cur_y_0_port, Y => n1323);
   U1329 : na210 port map( A => cur_y_1_port, B => n1305, Y => n1319);
   U1330 : na210 port map( A => n1326, B => n1327, Y => lut_y(0));
   U1331 : na210 port map( A => cur_lut_y_0_port, B => n1292, Y => n1327);
   U1332 : iv110 port map( A => n1266, Y => n1326);
   U1333 : na210 port map( A => n1328, B => n1329, Y => n1266);
   U1334 : na210 port map( A => n1169, B => n1295, Y => n1329);
   U1335 : na210 port map( A => n1330, B => n1331, Y => n1169);
   U1336 : na210 port map( A => cur_y_new_0_port, B => n1298, Y => n1331);
   U1337 : na310 port map( A => n1332, B => n1333, C => n1334, Y => n1298);
   U1338 : no210 port map( A => n884, B => n1335, Y => n1334);
   U1339 : mu111 port map( A => n972, B => n1314, S => cur_y_0_port, Y => n1330
                           );
   U1340 : na210 port map( A => cur_y_0_port, B => n1305, Y => n1328);
   U1341 : na210 port map( A => n1336, B => n1337, Y => lut_x(2));
   U1342 : na210 port map( A => cur_lut_x_2_port, B => n1292, Y => n1337);
   U1343 : iv110 port map( A => n1263, Y => n1336);
   U1344 : na210 port map( A => n1338, B => n1339, Y => n1263);
   U1345 : na210 port map( A => cur_x_2_port, B => n1340, Y => n1339);
   U1346 : na210 port map( A => n1042, B => cur_x_new_2_port, Y => n1338);
   U1347 : na210 port map( A => n1341, B => n1342, Y => lut_x(1));
   U1348 : na210 port map( A => cur_lut_x_1_port, B => n1292, Y => n1342);
   U1349 : iv110 port map( A => n1260, Y => n1341);
   U1350 : na210 port map( A => n1343, B => n1344, Y => n1260);
   U1351 : na210 port map( A => cur_x_1_port, B => n1340, Y => n1344);
   U1352 : na210 port map( A => n1042, B => cur_x_new_1_port, Y => n1343);
   U1353 : na210 port map( A => n1345, B => n1346, Y => lut_x(0));
   U1354 : na210 port map( A => cur_lut_x_0_port, B => n1292, Y => n1346);
   U1355 : iv110 port map( A => n1257, Y => n1345);
   U1356 : na210 port map( A => n1347, B => n1348, Y => n1257);
   U1357 : na210 port map( A => cur_x_0_port, B => n1340, Y => n1348);
   U1358 : na210 port map( A => n1042, B => cur_x_new_0_port, Y => n1347);
   U1359 : na210 port map( A => n1349, B => n1350, Y => lut_rot(1));
   U1360 : na210 port map( A => cur_lut_rot_1_port, B => n1292, Y => n1350);
   U1361 : iv110 port map( A => n1254, Y => n1349);
   U1362 : na210 port map( A => n1351, B => n1352, Y => n1254);
   U1363 : na210 port map( A => n1042, B => n1195, Y => n1352);
   U1364 : na310 port map( A => n1353, B => n1354, C => n1355, Y => n1195);
   U1365 : na210 port map( A => cur_rot_1_port, B => n1203, Y => n1355);
   U1366 : na210 port map( A => n1356, B => n1145, Y => n1354);
   U1367 : iv110 port map( A => n1357, Y => n1356);
   U1368 : ex210 port map( A => n1358, B => n1359, Y => n1357);
   U1369 : ex210 port map( A => cur_rot_1_port, B => cur_rot_0_port, Y => n1359
                           );
   U1370 : na210 port map( A => cur_rot_new_1_port, B => n1360, Y => n1353);
   U1371 : iv110 port map( A => n1202, Y => n1360);
   U1372 : no310 port map( A => n1209, B => n903, C => n1361, Y => n1202);
   U1373 : iv110 port map( A => n1333, Y => n1361);
   U1374 : no310 port map( A => n1362, B => n1363, C => n1364, Y => n1333);
   U1375 : na310 port map( A => n1120, B => n1365, C => n875, Y => n1364);
   U1376 : na310 port map( A => n957, B => n917, C => n1366, Y => n903);
   U1377 : no210 port map( A => n914, B => n1006, Y => n1366);
   U1378 : na310 port map( A => n1367, B => n1368, C => n1369, Y => n1209);
   U1379 : no210 port map( A => n1289, B => n918, Y => n1369);
   U1380 : na310 port map( A => n1370, B => n1371, C => n972, Y => n1289);
   U1381 : iv110 port map( A => n1091, Y => n1368);
   U1382 : na310 port map( A => n1028, B => n958, C => n1372, Y => n1091);
   U1383 : iv110 port map( A => n1109, Y => n1372);
   U1384 : na210 port map( A => cur_rot_1_port, B => n1340, Y => n1351);
   U1385 : na210 port map( A => n1373, B => n1374, Y => lut_rot(0));
   U1386 : na210 port map( A => cur_lut_rot_0_port, B => n1292, Y => n1374);
   U1387 : iv110 port map( A => n1251, Y => n1373);
   U1388 : na210 port map( A => n1375, B => n1376, Y => n1251);
   U1389 : na210 port map( A => cur_rot_0_port, B => n1340, Y => n1376);
   U1390 : iv110 port map( A => n1377, Y => n1340);
   U1391 : na210 port map( A => n1042, B => cur_rot_new_0_port, Y => n1375);
   U1392 : iv110 port map( A => n1378, Y => n1042);
   U1393 : na210 port map( A => n1379, B => n1380, Y => lut_piece_type(2));
   U1394 : na210 port map( A => cur_piece_2_port, B => n1248, Y => n1380);
   U1395 : na210 port map( A => cur_lut_piece_type_2_port, B => n1292, Y => 
                           n1379);
   U1396 : na210 port map( A => n1381, B => n1382, Y => lut_piece_type(1));
   U1397 : na210 port map( A => cur_piece_1_port, B => n1248, Y => n1382);
   U1398 : na210 port map( A => cur_lut_piece_type_1_port, B => n1292, Y => 
                           n1381);
   U1399 : na210 port map( A => n1383, B => n1384, Y => lut_piece_type(0));
   U1400 : na210 port map( A => cur_piece_0_port, B => n1248, Y => n1384);
   U1401 : na210 port map( A => n1377, B => n1378, Y => n1248);
   U1402 : no210 port map( A => n1305, B => n1385, Y => n1377);
   U1403 : na210 port map( A => cur_lut_piece_type_0_port, B => n1292, Y => 
                           n1383);
   U1404 : iv110 port map( A => n1276, Y => n1292);
   U1405 : no310 port map( A => n1386, B => n1111, C => n1387, Y => n1276);
   U1406 : na210 port map( A => n896, B => n1184, Y => n1387);
   U1407 : iv110 port map( A => n1388, Y => n1111);
   U1408 : no310 port map( A => n925, B => n1389, C => n1390, Y => n1388);
   U1409 : iv110 port map( A => n1233, Y => draw_score_draw);
   U1410 : na210 port map( A => cur_draw_score_draw, B => n1391, Y => n1233);
   U1411 : na310 port map( A => n1332, B => n1367, C => n1392, Y => n1391);
   U1412 : no310 port map( A => n884, B => n1304, C => n1284, Y => n1392);
   U1413 : na310 port map( A => n1393, B => n1286, C => n1394, Y => n884);
   U1414 : no210 port map( A => n1385, B => n1006, Y => n1394);
   U1415 : iv110 port map( A => n1371, Y => n1385);
   U1416 : na210 port map( A => n1071, B => n1395, Y => draw_erase_start);
   U1417 : na210 port map( A => cur_draw_erase_start, B => n1069, Y => n1395);
   U1418 : na310 port map( A => n1396, B => n1397, C => n1398, Y => n1069);
   U1419 : no310 port map( A => n1399, B => n1002, C => n872, Y => n1398);
   U1420 : iv110 port map( A => n1400, Y => n872);
   U1421 : iv110 port map( A => n1013, Y => n1002);
   U1422 : na210 port map( A => n1040, B => n924, Y => n1399);
   U1423 : iv110 port map( A => n1401, Y => n1396);
   U1424 : na210 port map( A => n1063, B => n1367, Y => n1401);
   U1425 : iv110 port map( A => n1335, Y => n1367);
   U1426 : no310 port map( A => n1402, B => n1362, C => n1403, Y => n1071);
   U1427 : na310 port map( A => n1404, B => n1405, C => n1033, Y => n1403);
   U1428 : na210 port map( A => n991, B => n928, Y => n1404);
   U1429 : iv110 port map( A => n1406, Y => n928);
   U1430 : iv110 port map( A => draw_erase_ready, Y => n991);
   U1431 : na310 port map( A => n1407, B => n1408, C => n999, Y => n1362);
   U1432 : iv110 port map( A => n1409, Y => n999);
   U1433 : na310 port map( A => n897, B => n937, C => n1410, Y => n1409);
   U1434 : na210 port map( A => n1411, B => n1412, Y => n1410);
   U1435 : na210 port map( A => n1078, B => n1413, Y => draw_erase_draw);
   U1436 : na210 port map( A => cur_draw_erase_draw, B => n1076, Y => n1413);
   U1437 : na310 port map( A => n1414, B => n1397, C => n1415, Y => n1076);
   U1438 : no310 port map( A => n1416, B => n1109, C => n1417, Y => n1415);
   U1439 : na210 port map( A => n1028, B => n883, Y => n1416);
   U1440 : no310 port map( A => n1363, B => n1226, C => n1418, Y => n1397);
   U1441 : na310 port map( A => n1419, B => n917, C => n1007, Y => n1418);
   U1442 : iv110 port map( A => n1295, Y => n1007);
   U1443 : iv110 port map( A => n992, Y => n1419);
   U1444 : na210 port map( A => n1420, B => n1421, Y => n992);
   U1445 : na210 port map( A => n1422, B => n1423, Y => n1421);
   U1446 : na310 port map( A => n1424, B => n1048, C => n1393, Y => n1226);
   U1447 : iv110 port map( A => n1425, Y => n1393);
   U1448 : na310 port map( A => n1426, B => n1004, C => n1427, Y => n1363);
   U1449 : iv110 port map( A => n1428, Y => n1427);
   U1450 : na310 port map( A => n1429, B => n916, C => n1430, Y => n1428);
   U1451 : no210 port map( A => n1119, B => n993, Y => n1429);
   U1452 : no210 port map( A => n902, B => n1431, Y => n1004);
   U1453 : iv110 port map( A => n949, Y => n1431);
   U1454 : na210 port map( A => n1411, B => n1432, Y => n949);
   U1455 : no210 port map( A => n1433, B => n1434, Y => n1426);
   U1456 : no210 port map( A => n886, B => n945, Y => n1414);
   U1457 : na310 port map( A => n972, B => n875, C => n1314, Y => n945);
   U1458 : no210 port map( A => n1145, B => n1203, Y => n1314);
   U1459 : na210 port map( A => n1435, B => n1436, Y => n1203);
   U1460 : na210 port map( A => n1358, B => n1437, Y => n1145);
   U1461 : na210 port map( A => n1438, B => n1040, Y => n886);
   U1462 : no210 port map( A => n1402, B => n1439, Y => n1078);
   U1463 : iv110 port map( A => n897, Y => n1439);
   U1464 : na310 port map( A => n1229, B => n1365, C => n1440, Y => n1402);
   U1465 : na210 port map( A => n1441, B => n1423, Y => n1440);
   U1466 : na210 port map( A => n1062, B => n1442, Y => clear_shift_start);
   U1467 : na210 port map( A => cur_clear_shift_start, B => n1443, Y => n1442);
   U1468 : iv110 port map( A => n1238, Y => n1443);
   U1469 : no310 port map( A => n1060, B => n1041, C => n1227, Y => n1238);
   U1470 : na310 port map( A => n1444, B => n1030, C => n1445, Y => n1060);
   U1471 : no310 port map( A => n1006, B => n915, C => n986, Y => n1445);
   U1472 : iv110 port map( A => n1446, Y => n986);
   U1473 : iv110 port map( A => n968, Y => n915);
   U1474 : na210 port map( A => n1229, B => n1048, Y => n1006);
   U1475 : no310 port map( A => n918, B => n1304, C => n1447, Y => n1030);
   U1476 : na210 port map( A => n883, B => n1371, Y => n1447);
   U1477 : iv110 port map( A => n972, Y => n1304);
   U1478 : no210 port map( A => n1425, B => n1284, Y => n1444);
   U1479 : na310 port map( A => n1120, B => n1430, C => n1190, Y => n1284);
   U1480 : iv110 port map( A => n1448, Y => n1190);
   U1481 : na310 port map( A => n1124, B => n1123, C => n1021, Y => n1448);
   U1482 : no210 port map( A => n1119, B => n1128, Y => n1021);
   U1483 : iv110 port map( A => n1365, Y => n1128);
   U1484 : no310 port map( A => n1449, B => n1450, C => n1451, Y => n1124);
   U1485 : na310 port map( A => n1378, B => n1436, C => n897, Y => n1451);
   U1486 : na210 port map( A => n1452, B => n1453, Y => n1449);
   U1487 : iv110 port map( A => n1434, Y => n1452);
   U1488 : na210 port map( A => n896, B => n1454, Y => n1434);
   U1489 : na210 port map( A => n1455, B => n1456, Y => n896);
   U1490 : iv110 port map( A => n1457, Y => n1120);
   U1491 : na310 port map( A => n1424, B => n1040, C => n1199, Y => n1457);
   U1492 : iv110 port map( A => n1417, Y => n1199);
   U1493 : no310 port map( A => n925, B => n1389, C => n1458, Y => n1424);
   U1494 : na310 port map( A => n878, B => n923, C => n973, Y => n1458);
   U1495 : iv110 port map( A => n983, Y => n925);
   U1496 : na210 port map( A => n1459, B => n1460, Y => n983);
   U1497 : na310 port map( A => n957, B => n1370, C => n1184, Y => n1425);
   U1498 : iv110 port map( A => n914, Y => n1184);
   U1499 : no210 port map( A => n1461, B => n1462, Y => n914);
   U1500 : na210 port map( A => n1282, B => n1463, Y => check_start);
   U1501 : na210 port map( A => cur_check_start, B => n1464, Y => n1463);
   U1502 : iv110 port map( A => n1280, Y => n1464);
   U1503 : no310 port map( A => n1305, B => n1390, C => n1386, Y => n1280);
   U1504 : na310 port map( A => n1465, B => n1466, C => n1467, Y => n1386);
   U1505 : no210 port map( A => n1468, B => n1469, Y => n1467);
   U1506 : na310 port map( A => n1453, B => n972, C => n913, Y => n1469);
   U1507 : iv110 port map( A => n1450, Y => n913);
   U1508 : na210 port map( A => n1470, B => n1407, Y => n1450);
   U1509 : na210 port map( A => n1471, B => n1432, Y => n1407);
   U1510 : na210 port map( A => n993, B => n1412, Y => n1470);
   U1511 : na210 port map( A => n1441, B => n1472, Y => n972);
   U1512 : iv110 port map( A => n1473, Y => n1453);
   U1513 : na310 port map( A => n1474, B => n1475, C => n1476, Y => n1473);
   U1514 : iv110 port map( A => n1477, Y => n1476);
   U1515 : na310 port map( A => n1478, B => n937, C => n942, Y => n1477);
   U1516 : na210 port map( A => n993, B => n1432, Y => n942);
   U1517 : na210 port map( A => n1422, B => n1456, Y => n937);
   U1518 : iv110 port map( A => n1479, Y => n1478);
   U1519 : na210 port map( A => n875, B => n1358, Y => n1479);
   U1520 : na210 port map( A => n1471, B => n1011, Y => n1358);
   U1521 : na210 port map( A => n1039, B => n1456, Y => n875);
   U1522 : no210 port map( A => n1148, B => n1433, Y => n1475);
   U1523 : na210 port map( A => n874, B => n935, Y => n1433);
   U1524 : na210 port map( A => n1441, B => n1456, Y => n935);
   U1525 : na210 port map( A => n1012, B => n1480, Y => n874);
   U1526 : iv110 port map( A => n1435, Y => n1148);
   U1527 : na210 port map( A => n1455, B => n1481, Y => n1435);
   U1528 : no210 port map( A => n1043, B => n902, Y => n1474);
   U1529 : na210 port map( A => n950, B => n948, Y => n902);
   U1530 : na210 port map( A => n1460, B => n1456, Y => n948);
   U1531 : na210 port map( A => n1482, B => n1456, Y => n950);
   U1532 : na210 port map( A => n1483, B => n1408, Y => n1043);
   U1533 : na210 port map( A => n1411, B => n1480, Y => n1408);
   U1534 : na210 port map( A => n993, B => n1011, Y => n1483);
   U1535 : na310 port map( A => n1048, B => n1229, C => n1484, Y => n1468);
   U1536 : no210 port map( A => n1119, B => n1158, Y => n1484);
   U1537 : iv110 port map( A => n1436, Y => n1158);
   U1538 : na210 port map( A => n1471, B => n1412, Y => n1436);
   U1539 : iv110 port map( A => n938, Y => n1119);
   U1540 : na210 port map( A => n1411, B => n1011, Y => n938);
   U1541 : na210 port map( A => n1423, B => n961, Y => n1229);
   U1542 : na210 port map( A => n1460, B => n1423, Y => n1048);
   U1543 : no310 port map( A => n1485, B => n1417, C => n901, Y => n1466);
   U1544 : na210 port map( A => n1430, B => n1365, Y => n901);
   U1545 : na210 port map( A => n1486, B => n1481, Y => n1365);
   U1546 : iv110 port map( A => n1125, Y => n1430);
   U1547 : na210 port map( A => n964, B => n1027, Y => n1125);
   U1548 : na210 port map( A => n961, B => n1481, Y => n1027);
   U1549 : na210 port map( A => n1456, B => n1486, Y => n964);
   U1550 : na310 port map( A => n1400, B => n1013, C => n1211, Y => n1417);
   U1551 : iv110 port map( A => n1487, Y => n1211);
   U1552 : na310 port map( A => n1033, B => n924, C => n1406, Y => n1487);
   U1553 : na210 port map( A => n1039, B => n1481, Y => n1406);
   U1554 : na210 port map( A => n1441, B => n1481, Y => n924);
   U1555 : na210 port map( A => n1460, B => n1481, Y => n1033);
   U1556 : na210 port map( A => n1422, B => n1481, Y => n1013);
   U1557 : na210 port map( A => n1482, B => n1481, Y => n1400);
   U1558 : no310 port map( A => n1488, B => cur_state_5_port, C => n1489, Y => 
                           n1481);
   U1559 : na210 port map( A => n1123, B => n1286, Y => n1485);
   U1560 : iv110 port map( A => n918, Y => n1286);
   U1561 : na210 port map( A => n1420, B => n1405, Y => n918);
   U1562 : na210 port map( A => n1472, B => n1460, Y => n1405);
   U1563 : na210 port map( A => n1490, B => n1412, Y => n1420);
   U1564 : iv110 port map( A => n1491, Y => n1123);
   U1565 : na310 port map( A => n1492, B => n916, C => n1437, Y => n1491);
   U1566 : na210 port map( A => n1012, B => n1412, Y => n1437);
   U1567 : iv110 port map( A => n1493, Y => n1412);
   U1568 : na210 port map( A => n1012, B => n1432, Y => n916);
   U1569 : no310 port map( A => cur_state_0_port, B => cur_state_3_port, C => 
                           n1494, Y => n1012);
   U1570 : na210 port map( A => n1411, B => n1495, Y => n1492);
   U1571 : no310 port map( A => n1496, B => cur_state_3_port, C => n1494, Y => 
                           n1411);
   U1572 : no310 port map( A => n1009, B => n1335, C => n1227, Y => n1465);
   U1573 : iv110 port map( A => n1332, Y => n1227);
   U1574 : no210 port map( A => n882, B => n1109, Y => n1332);
   U1575 : na210 port map( A => n1063, B => n841, Y => n1109);
   U1576 : na210 port map( A => n1460, B => n960, Y => n841);
   U1577 : no210 port map( A => n1497, B => n1496, Y => n1460);
   U1578 : no210 port map( A => n1126, B => n927, Y => n1063);
   U1579 : no210 port map( A => n1461, B => n1498, Y => n927);
   U1580 : na210 port map( A => n879, B => n1499, Y => n1126);
   U1581 : na310 port map( A => n1495, B => n1496, C => n960, Y => n1499);
   U1582 : na210 port map( A => n1493, B => n1497, Y => n1495);
   U1583 : na210 port map( A => n960, B => n1486, Y => n879);
   U1584 : iv110 port map( A => n1498, Y => n960);
   U1585 : na310 port map( A => cur_state_4_port, B => cur_state_3_port, C => 
                           cur_state_5_port, Y => n1498);
   U1586 : na310 port map( A => n1028, B => n958, C => n917, Y => n882);
   U1587 : na210 port map( A => n1039, B => n1423, Y => n917);
   U1588 : iv110 port map( A => n933, Y => n958);
   U1589 : no210 port map( A => n1462, B => n1500, Y => n933);
   U1590 : no210 port map( A => n1422, B => n1441, Y => n1500);
   U1591 : na210 port map( A => n1482, B => n1423, Y => n1028);
   U1592 : na210 port map( A => n1438, B => n883, Y => n1335);
   U1593 : na210 port map( A => n1490, B => n1432, Y => n883);
   U1594 : no310 port map( A => n1041, B => n1024, C => n1501, Y => n1438);
   U1595 : na210 port map( A => n968, B => n1446, Y => n1501);
   U1596 : na210 port map( A => n1490, B => n1011, Y => n1446);
   U1597 : na210 port map( A => n1459, B => n1422, Y => n968);
   U1598 : no210 port map( A => n1502, B => cur_state_0_port, Y => n1422);
   U1599 : iv110 port map( A => n1062, Y => n1024);
   U1600 : na210 port map( A => n1472, B => n1486, Y => n1062);
   U1601 : iv110 port map( A => n846, Y => n1041);
   U1602 : na210 port map( A => n1459, B => n1482, Y => n846);
   U1603 : na210 port map( A => n1370, B => n1454, Y => n1009);
   U1604 : na210 port map( A => n1471, B => n1480, Y => n1454);
   U1605 : no310 port map( A => n1488, B => n1496, C => n1494, Y => n1471);
   U1606 : na210 port map( A => n1472, B => n1482, Y => n1370);
   U1607 : no210 port map( A => n1502, B => n1496, Y => n1482);
   U1608 : na310 port map( A => n973, B => n923, C => n1040, Y => n1390);
   U1609 : na210 port map( A => n1459, B => n1441, Y => n1040);
   U1610 : no210 port map( A => n1493, B => n1496, Y => n1441);
   U1611 : na210 port map( A => n1459, B => n1039, Y => n923);
   U1612 : no210 port map( A => n1493, B => cur_state_0_port, Y => n1039);
   U1613 : na210 port map( A => cur_state_2_port, B => n1503, Y => n1493);
   U1614 : na210 port map( A => n1459, B => n961, Y => n973);
   U1615 : na310 port map( A => n897, B => n878, C => n957, Y => n1305);
   U1616 : na210 port map( A => n1423, B => n1486, Y => n957);
   U1617 : iv110 port map( A => n1462, Y => n1423);
   U1618 : na310 port map( A => cur_state_4_port, B => n1488, C => 
                           cur_state_5_port, Y => n1462);
   U1619 : na210 port map( A => n1459, B => n1455, Y => n878);
   U1620 : iv110 port map( A => n1461, Y => n1455);
   U1621 : na210 port map( A => n1011, B => n1496, Y => n1461);
   U1622 : na210 port map( A => n1456, B => n961, Y => n897);
   U1623 : no210 port map( A => n1497, B => cur_state_0_port, Y => n961);
   U1624 : iv110 port map( A => n1432, Y => n1497);
   U1625 : no210 port map( A => n1503, B => cur_state_2_port, Y => n1432);
   U1626 : iv110 port map( A => cur_state_1_port, Y => n1503);
   U1627 : no310 port map( A => cur_state_3_port, B => cur_state_5_port, C => 
                           n1489, Y => n1456);
   U1628 : no210 port map( A => n1295, B => n1389, Y => n1282);
   U1629 : iv110 port map( A => n974, Y => n1389);
   U1630 : na210 port map( A => n1459, B => n1486, Y => n974);
   U1631 : iv110 port map( A => n1504, Y => n1486);
   U1632 : na210 port map( A => cur_state_0_port, B => n1011, Y => n1504);
   U1633 : no210 port map( A => cur_state_1_port, B => cur_state_2_port, Y => 
                           n1011);
   U1634 : no310 port map( A => cur_state_3_port, B => cur_state_4_port, C => 
                           n1505, Y => n1459);
   U1635 : na210 port map( A => n1378, B => n1371, Y => n1295);
   U1636 : na210 port map( A => n1490, B => n1480, Y => n1371);
   U1637 : iv110 port map( A => n1506, Y => n1490);
   U1638 : na210 port map( A => n1472, B => n1496, Y => n1506);
   U1639 : iv110 port map( A => cur_state_0_port, Y => n1496);
   U1640 : no310 port map( A => n1488, B => cur_state_4_port, C => n1505, Y => 
                           n1472);
   U1641 : na210 port map( A => n993, B => n1480, Y => n1378);
   U1642 : iv110 port map( A => n1502, Y => n1480);
   U1643 : na210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n1502);
   U1644 : no310 port map( A => n1488, B => cur_state_0_port, C => n1494, Y => 
                           n993);
   U1645 : na210 port map( A => n1489, B => n1505, Y => n1494);
   U1646 : iv110 port map( A => cur_state_5_port, Y => n1505);
   U1647 : iv110 port map( A => cur_state_4_port, Y => n1489);
   U1648 : iv110 port map( A => cur_state_3_port, Y => n1488);

end synthesised;



