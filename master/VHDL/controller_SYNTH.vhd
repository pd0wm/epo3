
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
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
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
   
   signal lut_piece_type_2_port, lut_piece_type_1_port, lut_piece_type_0_port, 
      lut_x_2_port, lut_x_1_port, lut_x_0_port, lut_y_3_port, lut_y_2_port, 
      lut_y_1_port, lut_y_0_port, lut_rot_1_port, lut_rot_0_port, x_port, 
      y_port, draw_erase_draw_port, cur_state_6_port, cur_state_5_port, 
      cur_state_4_port, cur_state_3_port, cur_state_2_port, cur_state_1_port, 
      cur_state_0_port, cur_future_piece_2_port, cur_future_piece_1_port, 
      cur_future_piece_0_port, cur_timer_1_time, cur_timer_1_start, 
      cur_timer_1_reset, inv_inputs_5_port, inv_inputs_4_port, 
      inv_inputs_3_port, inv_inputs_2_port, inv_inputs_1_port, 
      inv_inputs_0_port, n37, n46, n51, n59, n87, n94, n129, n954, n955, n956, 
      n957, n958, n959, n960, n961, n962, new_piece_port, n965, n966, n967, 
      n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, 
      n980, n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, 
      n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, 
      n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, 
      n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, 
      n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, 
      n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, 
      n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, 
      n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, 
      n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, 
      n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, 
      n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, 
      n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, 
      n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, 
      n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, 
      n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, 
      n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, 
      n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, 
      n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, 
      n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, 
      n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, 
      n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, 
      n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, 
      n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, 
      n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, 
      n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, 
      n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, 
      n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, 
      n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, 
      n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, 
      n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, 
      n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, 
      n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, 
      n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, 
      n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, 
      n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, 
      n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, 
      n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, 
      n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, 
      n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, 
      n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, 
      n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, 
      n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, 
      n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, 
      n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, 
      n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, 
      n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, 
      n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, 
      n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, 
      n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, 
      n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, 
      n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, 
      n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, 
      n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, 
      n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, 
      n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, 
      n1533, n1534, n1535, n1536, n1537 : std_logic;

begin
   lut_piece_type <= ( lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port );
   lut_x <= ( lut_x_2_port, lut_x_1_port, lut_x_0_port );
   lut_y <= ( lut_y_3_port, lut_y_2_port, lut_y_1_port, lut_y_0_port );
   lut_rot <= ( lut_rot_1_port, lut_rot_0_port );
   x <= x_port;
   y <= y_port;
   new_piece <= new_piece_port;
   draw_erase_draw <= draw_erase_draw_port;
   
   inv_inputs_reg_5_inst : dfn10 port map( D => n962, CK => clk, Q => 
                           inv_inputs_5_port);
   inv_inputs_reg_4_inst : dfn10 port map( D => n961, CK => clk, Q => 
                           inv_inputs_4_port);
   inv_inputs_reg_3_inst : dfn10 port map( D => n960, CK => clk, Q => 
                           inv_inputs_3_port);
   inv_inputs_reg_2_inst : dfn10 port map( D => n959, CK => clk, Q => 
                           inv_inputs_2_port);
   inv_inputs_reg_1_inst : dfn10 port map( D => n958, CK => clk, Q => 
                           inv_inputs_1_port);
   inv_inputs_reg_0_inst : dfn10 port map( D => n957, CK => clk, Q => 
                           inv_inputs_0_port);
   cur_timer_1_time_reg : dfn10 port map( D => n956, CK => clk, Q => 
                           cur_timer_1_time);
   cur_state_reg_3_inst : dfr11 port map( D => n46, R => rst, CK => clk, Q => 
                           cur_state_3_port);
   cur_state_reg_2_inst : dfr11 port map( D => n94, R => rst, CK => clk, Q => 
                           cur_state_2_port);
   cur_state_reg_1_inst : dfr11 port map( D => n87, R => rst, CK => clk, Q => 
                           cur_state_1_port);
   cur_state_reg_5_inst : dfr11 port map( D => n51, R => rst, CK => clk, Q => 
                           cur_state_5_port);
   cur_state_reg_6_inst : dfr11 port map( D => n59, R => rst, CK => clk, Q => 
                           cur_state_6_port);
   cur_state_reg_0_inst : dfr11 port map( D => n37, R => rst, CK => clk, Q => 
                           cur_state_0_port);
   cur_state_reg_4_inst : dfr11 port map( D => n129, R => rst, CK => clk, Q => 
                           cur_state_4_port);
   cur_piece_reg_2_inst : dfn10 port map( D => n968, CK => clk, Q => 
                           lut_piece_type_2_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n965, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n969, CK => clk, Q => 
                           lut_piece_type_1_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n966, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n970, CK => clk, Q => 
                           lut_piece_type_0_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n967, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_y_reg_3_inst : dfn10 port map( D => n974, CK => clk, Q => lut_y_3_port);
   cur_y_reg_2_inst : dfn10 port map( D => n975, CK => clk, Q => lut_y_2_port);
   cur_y_reg_1_inst : dfn10 port map( D => n976, CK => clk, Q => lut_y_1_port);
   cur_y_reg_0_inst : dfn10 port map( D => n977, CK => clk, Q => lut_y_0_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n973, CK => clk, Q => 
                           lut_rot_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n972, CK => clk, Q => 
                           lut_rot_1_port);
   cur_x_reg_2_inst : dfn10 port map( D => n971, CK => clk, Q => lut_x_2_port);
   cur_x_reg_1_inst : dfn10 port map( D => n978, CK => clk, Q => lut_x_1_port);
   cur_x_reg_0_inst : dfn10 port map( D => n979, CK => clk, Q => lut_x_0_port);
   cur_timer_1_start_reg : dfn10 port map( D => n955, CK => clk, Q => 
                           cur_timer_1_start);
   cur_timer_1_reset_reg : dfn10 port map( D => n954, CK => clk, Q => 
                           cur_timer_1_reset);
   U646 : iv110 port map( A => n1299, Y => n980);
   U647 : iv110 port map( A => n1157, Y => n981);
   U648 : iv110 port map( A => n1138, Y => n982);
   U649 : iv110 port map( A => n1216, Y => n983);
   U650 : iv110 port map( A => n1143, Y => n984);
   U651 : iv110 port map( A => n984, Y => n985);
   U652 : iv110 port map( A => n1171, Y => n986);
   U653 : mu111 port map( A => n987, B => cur_timer_1_time, S => n988, Y => 
                           timer_1_time);
   U654 : na210 port map( A => n989, B => n990, Y => timer_1_start);
   U655 : na210 port map( A => n991, B => cur_timer_1_start, Y => n990);
   U656 : na210 port map( A => n992, B => n993, Y => n989);
   U657 : na210 port map( A => n994, B => n995, Y => timer_1_reset);
   U658 : na210 port map( A => n996, B => n997, Y => n995);
   U659 : na210 port map( A => cur_timer_1_reset, B => n998, Y => n994);
   U660 : na310 port map( A => n999, B => n1000, C => n1001, Y => rot);
   U661 : na210 port map( A => n1002, B => n1003, Y => n1000);
   U662 : iv110 port map( A => n1004, Y => n999);
   U663 : na210 port map( A => n1005, B => n1006, Y => n979);
   U664 : na210 port map( A => calc_x(0), B => n1007, Y => n1006);
   U665 : iv110 port map( A => n1008, Y => n1005);
   U666 : mu111 port map( A => lut_x_0_port, B => n1009, S => n1010, Y => n1008
                           );
   U667 : na210 port map( A => n1011, B => n1012, Y => n978);
   U668 : na210 port map( A => calc_x(1), B => n1007, Y => n1012);
   U669 : iv110 port map( A => n1013, Y => n1011);
   U670 : mu111 port map( A => lut_x_1_port, B => n1009, S => n1010, Y => n1013
                           );
   U671 : na210 port map( A => n1014, B => n1015, Y => n977);
   U672 : na210 port map( A => calc_y(0), B => n1016, Y => n1015);
   U673 : na210 port map( A => lut_y_0_port, B => n1017, Y => n1014);
   U674 : na210 port map( A => n1018, B => n1019, Y => n976);
   U675 : na210 port map( A => calc_y(1), B => n1016, Y => n1019);
   U676 : na210 port map( A => lut_y_1_port, B => n1017, Y => n1018);
   U677 : na210 port map( A => n1020, B => n1021, Y => n975);
   U678 : na210 port map( A => calc_y(2), B => n1016, Y => n1021);
   U679 : na210 port map( A => lut_y_2_port, B => n1017, Y => n1020);
   U680 : na210 port map( A => n1022, B => n1023, Y => n974);
   U681 : na210 port map( A => calc_y(3), B => n1016, Y => n1023);
   U682 : no210 port map( A => n1017, B => n1024, Y => n1016);
   U683 : na210 port map( A => lut_y_3_port, B => n1017, Y => n1022);
   U684 : na210 port map( A => n1025, B => n1026, Y => n1017);
   U685 : na210 port map( A => n1027, B => n1028, Y => n1025);
   U686 : na310 port map( A => n1029, B => n1030, C => check_empty, Y => n1028)
                           ;
   U687 : mu111 port map( A => n1031, B => lut_rot_0_port, S => n1027, Y => 
                           n973);
   U688 : no210 port map( A => n1026, B => n1032, Y => n1031);
   U689 : iv110 port map( A => calc_rot(0), Y => n1032);
   U690 : mu111 port map( A => n1033, B => lut_rot_1_port, S => n1027, Y => 
                           n972);
   U691 : na210 port map( A => n1029, B => n1034, Y => n1027);
   U692 : no310 port map( A => new_piece_port, B => x_port, C => n1035, Y => 
                           n1029);
   U693 : na210 port map( A => n1036, B => n1037, Y => n1035);
   U694 : no210 port map( A => n1026, B => n1038, Y => n1033);
   U695 : iv110 port map( A => calc_rot(1), Y => n1038);
   U696 : na210 port map( A => n1039, B => n1040, Y => n971);
   U697 : na210 port map( A => calc_x(2), B => n1007, Y => n1040);
   U698 : no210 port map( A => n1041, B => n1042, Y => n1007);
   U699 : iv110 port map( A => n1043, Y => n1042);
   U700 : na210 port map( A => n1044, B => n1045, Y => n1043);
   U701 : na210 port map( A => lut_x_2_port, B => n1041, Y => n1039);
   U702 : iv110 port map( A => n1010, Y => n1041);
   U703 : no310 port map( A => n1046, B => n1047, C => n1048, Y => n1010);
   U704 : iv110 port map( A => n1049, Y => n1048);
   U705 : no310 port map( A => n1050, B => new_piece_port, C => n1051, Y => 
                           n1049);
   U706 : no210 port map( A => n1045, B => n1052, Y => n1051);
   U707 : na210 port map( A => n1053, B => n1054, Y => new_piece_port);
   U708 : na210 port map( A => n1055, B => n1056, Y => n1054);
   U709 : no210 port map( A => n1057, B => n1044, Y => n1050);
   U710 : na310 port map( A => n1058, B => n1059, C => n1060, Y => n970);
   U711 : na210 port map( A => lut_piece_type_0_port, B => n1061, Y => n1060);
   U712 : na210 port map( A => next_piece(0), B => n1062, Y => n1059);
   U713 : na210 port map( A => cur_future_piece_0_port, B => n1063, Y => n1058)
                           ;
   U714 : na310 port map( A => n1064, B => n1065, C => n1066, Y => n969);
   U715 : na210 port map( A => lut_piece_type_1_port, B => n1061, Y => n1066);
   U716 : na210 port map( A => next_piece(1), B => n1062, Y => n1065);
   U717 : na210 port map( A => cur_future_piece_1_port, B => n1063, Y => n1064)
                           ;
   U718 : na310 port map( A => n1067, B => n1068, C => n1069, Y => n968);
   U719 : na210 port map( A => lut_piece_type_2_port, B => n1061, Y => n1069);
   U720 : na210 port map( A => next_piece(2), B => n1062, Y => n1068);
   U721 : no210 port map( A => n1061, B => n1070, Y => n1062);
   U722 : na210 port map( A => cur_future_piece_2_port, B => n1063, Y => n1067)
                           ;
   U723 : no210 port map( A => n1061, B => n1036, Y => n1063);
   U724 : na210 port map( A => n1071, B => n1053, Y => n1061);
   U725 : na310 port map( A => n1072, B => n1073, C => n1074, Y => n967);
   U726 : na210 port map( A => cur_future_piece_0_port, B => n1075, Y => n1074)
                           ;
   U727 : na210 port map( A => n1076, B => next_piece(0), Y => n1073);
   U728 : na210 port map( A => n1077, B => lut_piece_type_0_port, Y => n1072);
   U729 : na310 port map( A => n1078, B => n1079, C => n1080, Y => n966);
   U730 : na210 port map( A => cur_future_piece_1_port, B => n1075, Y => n1080)
                           ;
   U731 : na210 port map( A => n1076, B => next_piece(1), Y => n1079);
   U732 : na210 port map( A => n1077, B => lut_piece_type_1_port, Y => n1078);
   U733 : na310 port map( A => n1081, B => n1082, C => n1083, Y => n965);
   U734 : na210 port map( A => cur_future_piece_2_port, B => n1075, Y => n1083)
                           ;
   U735 : na210 port map( A => n1076, B => next_piece(2), Y => n1082);
   U736 : no210 port map( A => n1053, B => n1075, Y => n1076);
   U737 : na210 port map( A => n1084, B => n1085, Y => n1053);
   U738 : na210 port map( A => n1077, B => lut_piece_type_2_port, Y => n1081);
   U739 : no210 port map( A => n1075, B => n1036, Y => n1077);
   U740 : na210 port map( A => n1071, B => n1070, Y => n1075);
   U741 : no310 port map( A => n1086, B => x_port, C => n1046, Y => n1071);
   U742 : na310 port map( A => n1026, B => n1034, C => n1037, Y => n1046);
   U743 : iv110 port map( A => n1087, Y => n1037);
   U744 : na310 port map( A => n1088, B => n1089, C => n1090, Y => n1087);
   U745 : no210 port map( A => n1091, B => n1092, Y => n1090);
   U746 : na310 port map( A => n1093, B => n1094, C => n1095, Y => n1092);
   U747 : na310 port map( A => n1096, B => n1097, C => n1098, Y => n1091);
   U748 : no210 port map( A => rst, B => n1099, Y => n1098);
   U749 : no310 port map( A => n1100, B => n1101, C => n1102, Y => n1089);
   U750 : no210 port map( A => n1024, B => n1103, Y => n1102);
   U751 : no210 port map( A => n1104, B => n1105, Y => n1101);
   U752 : no310 port map( A => n1106, B => n1107, C => n1108, Y => n1105);
   U753 : iv110 port map( A => n1044, Y => n1107);
   U754 : no210 port map( A => n1109, B => n1110, Y => n1106);
   U755 : no210 port map( A => n1111, B => n1112, Y => n1109);
   U756 : no210 port map( A => n1113, B => n1114, Y => n1111);
   U757 : na210 port map( A => n1115, B => n1116, Y => n1100);
   U758 : na210 port map( A => n1117, B => n1118, Y => n1116);
   U759 : na210 port map( A => n1045, B => n1119, Y => n1117);
   U760 : na210 port map( A => n1120, B => n1121, Y => n1115);
   U761 : na310 port map( A => n1122, B => n1123, C => n1124, Y => n1121);
   U762 : na210 port map( A => n1036, B => n1070, Y => n1120);
   U763 : no310 port map( A => n1125, B => n1126, C => n1127, Y => n1088);
   U764 : no210 port map( A => n1128, B => n1129, Y => n1126);
   U765 : iv110 port map( A => n1130, Y => x_port);
   U766 : no310 port map( A => n1131, B => n1132, C => n1047, Y => n1130);
   U767 : no210 port map( A => n1045, B => n1104, Y => n1131);
   U768 : mu111 port map( A => inputs(5), B => inv_inputs_5_port, S => rst, Y 
                           => n962);
   U769 : mu111 port map( A => inputs(4), B => inv_inputs_4_port, S => rst, Y 
                           => n961);
   U770 : mu111 port map( A => inputs(3), B => inv_inputs_3_port, S => rst, Y 
                           => n960);
   U771 : mu111 port map( A => inputs(2), B => inv_inputs_2_port, S => rst, Y 
                           => n959);
   U772 : mu111 port map( A => inputs(1), B => inv_inputs_1_port, S => rst, Y 
                           => n958);
   U773 : mu111 port map( A => inputs(0), B => inv_inputs_0_port, S => rst, Y 
                           => n957);
   U774 : mu111 port map( A => cur_timer_1_time, B => n987, S => n1133, Y => 
                           n956);
   U775 : no210 port map( A => rst, B => n988, Y => n1133);
   U776 : na310 port map( A => n1134, B => n1135, C => n1136, Y => n988);
   U777 : mu111 port map( A => n1137, B => n1138, S => n1139, Y => n1136);
   U778 : na310 port map( A => n1119, B => n1140, C => n1141, Y => n1135);
   U779 : iv110 port map( A => n1084, Y => n1119);
   U780 : no310 port map( A => n1142, B => cur_state_3_port, C => n1110, Y => 
                           n1084);
   U781 : na210 port map( A => cur_state_4_port, B => n985, Y => n1134);
   U782 : na210 port map( A => n1139, B => n1144, Y => n987);
   U783 : iv110 port map( A => n1145, Y => n1139);
   U784 : na210 port map( A => n1146, B => n1147, Y => n1145);
   U785 : na210 port map( A => n981, B => n1148, Y => n1147);
   U786 : na210 port map( A => n1149, B => n1150, Y => n955);
   U787 : na310 port map( A => n993, B => n1151, C => n992, Y => n1150);
   U788 : na210 port map( A => n1057, B => n1152, Y => n993);
   U789 : na310 port map( A => n1153, B => n1154, C => n1155, Y => n1152);
   U790 : no210 port map( A => n1156, B => n1157, Y => n1155);
   U791 : iv110 port map( A => cur_timer_1_start, Y => n1156);
   U792 : na210 port map( A => cur_state_5_port, B => n1148, Y => n1153);
   U793 : na210 port map( A => n1158, B => cur_timer_1_start, Y => n1149);
   U794 : na210 port map( A => n1159, B => n1151, Y => n1158);
   U795 : iv110 port map( A => n991, Y => n1159);
   U796 : na210 port map( A => n992, B => n1144, Y => n991);
   U797 : na210 port map( A => cur_state_0_port, B => n1157, Y => n1144);
   U798 : iv110 port map( A => n1160, Y => n992);
   U799 : na310 port map( A => n1161, B => n1162, C => n1163, Y => n1160);
   U800 : no210 port map( A => n1164, B => n1165, Y => n1163);
   U801 : no210 port map( A => n1166, B => n1157, Y => n1165);
   U802 : no210 port map( A => n1167, B => n1140, Y => n1166);
   U803 : no210 port map( A => cur_state_0_port, B => n1168, Y => n1167);
   U804 : no210 port map( A => n1169, B => n1148, Y => n1168);
   U805 : no210 port map( A => n1170, B => n1124, Y => n1164);
   U806 : no210 port map( A => n1171, B => n1138, Y => n1170);
   U807 : na210 port map( A => cur_state_3_port, B => n1140, Y => n1162);
   U808 : na310 port map( A => n981, B => n1172, C => n1173, Y => n1140);
   U809 : iv110 port map( A => n1174, Y => n1173);
   U810 : na210 port map( A => n1056, B => n1142, Y => n1161);
   U811 : na210 port map( A => n1175, B => n1176, Y => n954);
   U812 : na310 port map( A => n997, B => n1151, C => n996, Y => n1176);
   U813 : iv110 port map( A => rst, Y => n1151);
   U814 : na210 port map( A => n1177, B => n1178, Y => n997);
   U815 : na310 port map( A => n981, B => n1179, C => n1180, Y => n1178);
   U816 : iv110 port map( A => n1181, Y => n1179);
   U817 : no310 port map( A => cur_state_6_port, B => cur_timer_1_reset, C => 
                           n1137, Y => n1181);
   U818 : na210 port map( A => cur_state_3_port, B => cur_state_0_port, Y => 
                           n1177);
   U819 : na210 port map( A => cur_timer_1_reset, B => n1182, Y => n1175);
   U820 : iv110 port map( A => n1183, Y => n1182);
   U821 : no210 port map( A => n998, B => rst, Y => n1183);
   U822 : na310 port map( A => n996, B => n985, C => n1184, Y => n998);
   U823 : mu111 port map( A => n1185, B => cur_state_5_port, S => 
                           cur_state_4_port, Y => n1184);
   U824 : iv110 port map( A => n1186, Y => n996);
   U825 : na310 port map( A => n1146, B => n1187, C => n1188, Y => n1186);
   U826 : no210 port map( A => n1189, B => n1174, Y => n1188);
   U827 : mu111 port map( A => n1190, B => n1191, S => cur_state_4_port, Y => 
                           n94);
   U828 : na310 port map( A => n1192, B => n1193, C => n1194, Y => n1191);
   U829 : no310 port map( A => n1195, B => n1196, C => n1197, Y => n1194);
   U830 : no210 port map( A => n1198, B => n1187, Y => n1197);
   U831 : no210 port map( A => n1199, B => n1200, Y => n1198);
   U832 : no210 port map( A => n1201, B => n1202, Y => n1199);
   U833 : no210 port map( A => n1203, B => n1204, Y => n1196);
   U834 : no210 port map( A => n1205, B => n1189, Y => n1204);
   U835 : no210 port map( A => cur_state_5_port, B => cur_state_3_port, Y => 
                           n1205);
   U836 : no210 port map( A => n1206, B => n1207, Y => n1203);
   U837 : no210 port map( A => n1208, B => n1148, Y => n1207);
   U838 : iv110 port map( A => n1209, Y => n1208);
   U839 : no210 port map( A => check_empty, B => n1210, Y => n1206);
   U840 : no210 port map( A => n1113, B => n1211, Y => n1195);
   U841 : na210 port map( A => cur_state_1_port, B => n1212, Y => n1193);
   U842 : na310 port map( A => n1213, B => n1214, C => n1215, Y => n1212);
   U843 : na210 port map( A => n1137, B => n1216, Y => n1215);
   U844 : na210 port map( A => n1217, B => n1200, Y => n1213);
   U845 : mu111 port map( A => n1218, B => cur_state_1_port, S => 
                           cur_state_2_port, Y => n1192);
   U846 : na210 port map( A => n1219, B => n1169, Y => n1218);
   U847 : na310 port map( A => n1220, B => n1221, C => n1222, Y => n1190);
   U848 : no310 port map( A => n1223, B => n1224, C => n1225, Y => n1222);
   U849 : no210 port map( A => n1226, B => n1227, Y => n1225);
   U850 : no310 port map( A => n1228, B => cur_state_1_port, C => n1229, Y => 
                           n1224);
   U851 : no210 port map( A => n1113, B => n1230, Y => n1223);
   U852 : na210 port map( A => n1231, B => n1232, Y => n1221);
   U853 : mu111 port map( A => n1233, B => n1234, S => cur_state_2_port, Y => 
                           n1220);
   U854 : no310 port map( A => n1235, B => n1236, C => n1237, Y => n1234);
   U855 : mu111 port map( A => cur_state_5_port, B => n1238, S => 
                           cur_state_1_port, Y => n1237);
   U856 : no210 port map( A => n1128, B => n1148, Y => n1236);
   U857 : na210 port map( A => n1239, B => n1240, Y => n1235);
   U858 : na210 port map( A => n1241, B => n1242, Y => n1240);
   U859 : na210 port map( A => n1169, B => n1243, Y => n1239);
   U860 : no210 port map( A => n1244, B => n1245, Y => n1233);
   U861 : no210 port map( A => n1246, B => n1154, Y => n1244);
   U862 : na310 port map( A => n1247, B => n1141, C => n1248, Y => n87);
   U863 : mu111 port map( A => n1249, B => n1250, S => cur_state_4_port, Y => 
                           n1248);
   U864 : no310 port map( A => n1251, B => n1252, C => n1253, Y => n1250);
   U865 : mu111 port map( A => n1254, B => n1255, S => cur_state_1_port, Y => 
                           n1253);
   U866 : na210 port map( A => n1256, B => n1257, Y => n1254);
   U867 : na210 port map( A => n1258, B => n1259, Y => n1257);
   U868 : na210 port map( A => n1260, B => n985, Y => n1259);
   U869 : mu111 port map( A => inv_inputs_3_port, B => n1261, S => 
                           cur_state_5_port, Y => n1260);
   U870 : na210 port map( A => n1217, B => n1262, Y => n1256);
   U871 : no210 port map( A => cur_state_2_port, B => n1263, Y => n1252);
   U872 : no210 port map( A => n1264, B => n1265, Y => n1263);
   U873 : no210 port map( A => n1219, B => n1266, Y => n1265);
   U874 : no210 port map( A => n1267, B => n1169, Y => n1266);
   U875 : no310 port map( A => n1148, B => draw_erase_ready, C => 
                           cur_state_0_port, Y => n1267);
   U876 : no310 port map( A => n1268, B => n1187, C => n1103, Y => n1264);
   U877 : na210 port map( A => n1269, B => n1270, Y => n1251);
   U878 : na310 port map( A => n1137, B => n1271, C => n1241, Y => n1270);
   U879 : na210 port map( A => check_empty, B => n1216, Y => n1271);
   U880 : na210 port map( A => n1272, B => n1273, Y => n1269);
   U881 : no310 port map( A => n1274, B => n1275, C => n1276, Y => n1249);
   U882 : no210 port map( A => n1277, B => n1278, Y => n1276);
   U883 : no310 port map( A => n1279, B => n1280, C => n1281, Y => n1277);
   U884 : no210 port map( A => n1282, B => n1242, Y => n1281);
   U885 : no310 port map( A => n1283, B => n1138, C => n1187, Y => n1280);
   U886 : no210 port map( A => n1113, B => n1103, Y => n1279);
   U887 : no310 port map( A => n1148, B => n1284, C => n1216, Y => n1275);
   U888 : no210 port map( A => n1285, B => n1286, Y => n1284);
   U889 : no210 port map( A => n985, B => n1243, Y => n1285);
   U890 : no210 port map( A => n1287, B => n1171, Y => n1274);
   U891 : no310 port map( A => n1288, B => n1289, C => n1290, Y => n1287);
   U892 : no210 port map( A => draw_erase_ready, B => n1291, Y => n1290);
   U893 : no210 port map( A => n1292, B => n1293, Y => n1289);
   U894 : no210 port map( A => n1294, B => n1200, Y => n1292);
   U895 : no210 port map( A => n1219, B => n1138, Y => n1294);
   U896 : iv110 port map( A => n1283, Y => n1219);
   U897 : no210 port map( A => n1295, B => n1216, Y => n1288);
   U898 : iv110 port map( A => n1238, Y => n1295);
   U899 : na210 port map( A => n1296, B => n1297, Y => n1238);
   U900 : na210 port map( A => n1298, B => n1299, Y => n1297);
   U901 : na210 port map( A => n1300, B => n1301, Y => n1298);
   U902 : na210 port map( A => n1302, B => n1143, Y => n1300);
   U903 : na210 port map( A => n1189, B => check_empty, Y => n1296);
   U904 : na210 port map( A => n1241, B => n1056, Y => n1141);
   U905 : na310 port map( A => n1185, B => n1052, C => n1056, Y => n1247);
   U906 : no310 port map( A => n1174, B => n1303, C => n1304, Y => n59);
   U907 : no210 port map( A => n1305, B => n1180, Y => n1304);
   U908 : iv110 port map( A => n1113, Y => n1180);
   U909 : no210 port map( A => n1138, B => n1148, Y => n1305);
   U910 : no210 port map( A => n1306, B => n1307, Y => n1303);
   U911 : mu111 port map( A => n1308, B => n1278, S => n984, Y => n1307);
   U912 : no210 port map( A => cur_state_3_port, B => n1114, Y => n1278);
   U913 : no210 port map( A => check_empty, B => n1146, Y => n1308);
   U914 : na210 port map( A => cur_state_3_port, B => n1157, Y => n1146);
   U915 : no210 port map( A => n1157, B => n1309, Y => n1306);
   U916 : mu111 port map( A => n1057, B => n1310, S => n980, Y => n1309);
   U917 : na210 port map( A => cur_state_0_port, B => n1311, Y => n1310);
   U918 : na210 port map( A => n1228, B => n1312, Y => n1174);
   U919 : na210 port map( A => cur_state_3_port, B => n1216, Y => n1312);
   U920 : mu111 port map( A => n1313, B => n1314, S => cur_state_4_port, Y => 
                           n51);
   U921 : na210 port map( A => n1315, B => n1316, Y => n1314);
   U922 : na210 port map( A => cur_state_5_port, B => n1317, Y => n1316);
   U923 : na310 port map( A => n1318, B => n1319, C => n1320, Y => n1317);
   U924 : no210 port map( A => n1321, B => n1241, Y => n1320);
   U925 : iv110 port map( A => n1172, Y => n1321);
   U926 : na210 port map( A => cur_state_3_port, B => n1322, Y => n1319);
   U927 : na210 port map( A => n1311, B => n1323, Y => n1322);
   U928 : iv110 port map( A => timer_1_done, Y => n1311);
   U929 : na210 port map( A => n1258, B => n1261, Y => n1318);
   U930 : iv110 port map( A => clear_shift_ready, Y => n1261);
   U931 : mu111 port map( A => n1201, B => n1324, S => cur_state_3_port, Y => 
                           n1315);
   U932 : no210 port map( A => n1325, B => n1273, Y => n1324);
   U933 : no210 port map( A => n1326, B => n1327, Y => n1325);
   U934 : no210 port map( A => n1328, B => n1329, Y => n1327);
   U935 : no210 port map( A => n1148, B => n1103, Y => n1329);
   U936 : no310 port map( A => n1187, B => inv_inputs_0_port, C => n1143, Y => 
                           n1328);
   U937 : na310 port map( A => n1330, B => n1331, C => n1332, Y => n1313);
   U938 : no310 port map( A => n1333, B => n1334, C => n1335, Y => n1332);
   U939 : no210 port map( A => n1336, B => n1138, Y => n1335);
   U940 : no310 port map( A => n1337, B => n1241, C => n1338, Y => n1336);
   U941 : no210 port map( A => n1202, B => n1339, Y => n1337);
   U942 : no310 port map( A => n1052, B => n1216, C => n1148, Y => n1334);
   U943 : no210 port map( A => n1201, B => n1299, Y => n1333);
   U944 : no210 port map( A => n1340, B => n1341, Y => n1331);
   U945 : no310 port map( A => n1342, B => n1255, C => n1187, Y => n1341);
   U946 : mu111 port map( A => n1343, B => n1246, S => cur_state_2_port, Y => 
                           n1342);
   U947 : iv110 port map( A => draw_erase_ready, Y => n1246);
   U948 : na210 port map( A => draw_score_ready, B => n1143, Y => n1343);
   U949 : iv110 port map( A => n1097, Y => n1340);
   U950 : no210 port map( A => n1344, B => n1345, Y => n1330);
   U951 : no310 port map( A => n1210, B => cur_state_0_port, C => n1346, Y => 
                           n1345);
   U952 : iv110 port map( A => n1302, Y => n1346);
   U953 : no310 port map( A => n1347, B => cur_state_1_port, C => n1348, Y => 
                           n1344);
   U954 : no210 port map( A => n1349, B => n1217, Y => n1348);
   U955 : no210 port map( A => n1057, B => n1202, Y => n1349);
   U956 : no210 port map( A => n1350, B => n1351, Y => n1347);
   U957 : no210 port map( A => n1352, B => n1353, Y => n1351);
   U958 : iv110 port map( A => n1354, Y => n1352);
   U959 : no210 port map( A => cur_state_6_port, B => n1355, Y => n1350);
   U960 : no210 port map( A => n1356, B => n1128, Y => n1355);
   U961 : no210 port map( A => n1138, B => n1357, Y => n1356);
   U962 : na310 port map( A => n1358, B => n1359, C => n1360, Y => n46);
   U963 : mu111 port map( A => n1361, B => n1362, S => cur_state_4_port, Y => 
                           n1360);
   U964 : no210 port map( A => n1363, B => n1364, Y => n1362);
   U965 : no210 port map( A => n1365, B => n1366, Y => n1363);
   U966 : no210 port map( A => n1367, B => n1338, Y => n1366);
   U967 : no210 port map( A => n1228, B => n1052, Y => n1367);
   U968 : no210 port map( A => n1368, B => n1262, Y => n1365);
   U969 : na210 port map( A => n1201, B => n1369, Y => n1262);
   U970 : na210 port map( A => check_empty, B => cur_state_0_port, Y => n1369);
   U971 : no210 port map( A => inv_inputs_3_port, B => cur_state_1_port, Y => 
                           n1368);
   U972 : no310 port map( A => n1370, B => n1371, C => n1372, Y => n1361);
   U973 : na210 port map( A => n1373, B => n1374, Y => n1372);
   U974 : na210 port map( A => n1217, B => n1375, Y => n1374);
   U975 : na210 port map( A => n1376, B => n1377, Y => n1375);
   U976 : na210 port map( A => n1185, B => n1378, Y => n1377);
   U977 : na210 port map( A => n1103, B => n1230, Y => n1378);
   U978 : mu111 port map( A => n1353, B => n1379, S => cur_state_1_port, Y => 
                           n1376);
   U979 : na210 port map( A => n1286, B => n1380, Y => n1373);
   U980 : no210 port map( A => n1128, B => n1381, Y => n1286);
   U981 : no310 port map( A => n1382, B => n1137, C => n1383, Y => n1381);
   U982 : no210 port map( A => n1299, B => n1323, Y => n1371);
   U983 : na310 port map( A => n1384, B => n1385, C => n1386, Y => n1370);
   U984 : na210 port map( A => n1231, B => n1387, Y => n1386);
   U985 : na210 port map( A => n1200, B => n1388, Y => n1387);
   U986 : na210 port map( A => n1338, B => n1301, Y => n1384);
   U987 : na210 port map( A => cur_state_5_port, B => n1242, Y => n1301);
   U988 : iv110 port map( A => n1210, Y => n1338);
   U989 : na310 port map( A => n1003, B => n1143, C => n1380, Y => n1359);
   U990 : na210 port map( A => n1389, B => n1390, Y => n1358);
   U991 : na210 port map( A => n1154, B => n1391, Y => n1390);
   U992 : na210 port map( A => n1380, B => n1392, Y => n1391);
   U993 : na210 port map( A => n1393, B => n1394, Y => n37);
   U994 : na210 port map( A => n1241, B => n1395, Y => n1394);
   U995 : na210 port map( A => n1396, B => n1397, Y => n1395);
   U996 : na310 port map( A => n1389, B => n1143, C => check_ready, Y => n1397)
                           ;
   U997 : na210 port map( A => n1003, B => n1398, Y => n1396);
   U998 : mu111 port map( A => n1399, B => n1400, S => cur_state_4_port, Y => 
                           n1393);
   U999 : no310 port map( A => n1401, B => n1402, C => n1403, Y => n1400);
   U1000 : no210 port map( A => n1187, B => n1052, Y => n1403);
   U1001 : no210 port map( A => cur_state_3_port, B => n1404, Y => n1402);
   U1002 : no210 port map( A => n1405, B => n1406, Y => n1404);
   U1003 : mu111 port map( A => n1407, B => n1408, S => cur_state_1_port, Y => 
                           n1406);
   U1004 : na310 port map( A => n1409, B => n1291, C => n1410, Y => n1408);
   U1005 : mu111 port map( A => n1411, B => n1412, S => cur_state_2_port, Y => 
                           n1410);
   U1006 : na210 port map( A => n1229, B => cur_state_5_port, Y => n1412);
   U1007 : na310 port map( A => n1143, B => n1383, C => n1413, Y => n1411);
   U1008 : na210 port map( A => check_ready, B => n1200, Y => n1409);
   U1009 : na210 port map( A => n1414, B => n1415, Y => n1407);
   U1010 : na210 port map( A => n1273, B => n1416, Y => n1415);
   U1011 : iv110 port map( A => n1417, Y => n1416);
   U1012 : mu111 port map( A => n1418, B => n1419, S => cur_state_2_port, Y => 
                           n1414);
   U1013 : na210 port map( A => inv_inputs_3_port, B => n1200, Y => n1419);
   U1014 : na210 port map( A => check_ready, B => n1143, Y => n1418);
   U1015 : no210 port map( A => n1326, B => n1211, Y => n1405);
   U1016 : iv110 port map( A => n1323, Y => n1326);
   U1017 : na210 port map( A => n1420, B => n1421, Y => n1401);
   U1018 : na210 port map( A => n1422, B => n1268, Y => n1421);
   U1019 : na210 port map( A => n1380, B => n1423, Y => n1420);
   U1020 : na310 port map( A => n1424, B => n1425, C => n1426, Y => n1423);
   U1021 : na210 port map( A => cur_state_5_port, B => n1209, Y => n1426);
   U1022 : na210 port map( A => n1214, B => n1427, Y => n1209);
   U1023 : na210 port map( A => timer_1_done, B => cur_state_2_port, Y => n1427
                           );
   U1024 : na310 port map( A => n1283, B => n1216, C => n1398, Y => n1425);
   U1025 : na210 port map( A => cur_state_5_port, B => n1392, Y => n1398);
   U1026 : na310 port map( A => inv_inputs_4_port, B => cur_timer_1_time, C => 
                           n1255, Y => n1424);
   U1027 : no310 port map( A => n1428, B => n1429, C => n1430, Y => n1399);
   U1028 : mu111 port map( A => n1431, B => n1432, S => cur_state_2_port, Y => 
                           n1430);
   U1029 : na310 port map( A => n1433, B => n1434, C => n1435, Y => n1432);
   U1030 : no210 port map( A => n1422, B => n1436, Y => n1435);
   U1031 : no310 port map( A => n1243, B => cur_state_5_port, C => n1299, Y => 
                           n1436);
   U1032 : iv110 port map( A => inv_inputs_2_port, Y => n1243);
   U1033 : iv110 port map( A => n1282, Y => n1422);
   U1034 : na210 port map( A => n1241, B => n1138, Y => n1282);
   U1035 : na210 port map( A => n1380, B => n1437, Y => n1434);
   U1036 : na210 port map( A => n1128, B => n1438, Y => n1437);
   U1037 : na210 port map( A => cur_state_5_port, B => n1202, Y => n1438);
   U1038 : na210 port map( A => n1241, B => n1283, Y => n1433);
   U1039 : na210 port map( A => n1057, B => n1439, Y => n1431);
   U1040 : na210 port map( A => n1241, B => n1232, Y => n1439);
   U1041 : na210 port map( A => n1138, B => n1440, Y => n1232);
   U1042 : na210 port map( A => n1143, B => n1388, Y => n1440);
   U1043 : iv110 port map( A => draw_score_ready, Y => n1388);
   U1044 : iv110 port map( A => n1187, Y => n1241);
   U1045 : no210 port map( A => n986, B => n1441, Y => n1429);
   U1046 : no310 port map( A => n1442, B => n1443, C => n1444, Y => n1441);
   U1047 : no210 port map( A => cur_state_2_port, B => n1230, Y => n1444);
   U1048 : na210 port map( A => cur_state_5_port, B => n1445, Y => n1230);
   U1049 : na210 port map( A => inv_inputs_1_port, B => cur_state_0_port, Y => 
                           n1445);
   U1050 : no210 port map( A => n1446, B => n1228, Y => n1443);
   U1051 : no210 port map( A => n1229, B => cur_state_5_port, Y => n1446);
   U1052 : no210 port map( A => n1114, B => n1293, Y => n1442);
   U1053 : na310 port map( A => n1447, B => n1448, C => n1449, Y => n1428);
   U1054 : na210 port map( A => n1272, B => n1226, Y => n1449);
   U1055 : na210 port map( A => n1450, B => n1451, Y => n1226);
   U1056 : na210 port map( A => n982, B => n1283, Y => n1451);
   U1057 : na210 port map( A => check_ready, B => cur_state_0_port, Y => n1283)
                           ;
   U1058 : na210 port map( A => n1452, B => n1143, Y => n1450);
   U1059 : iv110 port map( A => n1227, Y => n1272);
   U1060 : na210 port map( A => n1217, B => n986, Y => n1227);
   U1061 : iv110 port map( A => n1293, Y => n1217);
   U1062 : na210 port map( A => n1216, B => n1299, Y => n1293);
   U1063 : na310 port map( A => n982, B => n1242, C => n1258, Y => n1448);
   U1064 : na210 port map( A => draw_erase_ready, B => cur_state_0_port, Y => 
                           n1242);
   U1065 : na310 port map( A => n1323, B => n1299, C => n1200, Y => n1447);
   U1066 : na210 port map( A => n1339, B => n1453, Y => n1323);
   U1067 : na210 port map( A => n1171, B => n1216, Y => n1453);
   U1068 : na310 port map( A => n1454, B => n1455, C => n1456, Y => n129);
   U1069 : no210 port map( A => n1457, B => n1458, Y => n1456);
   U1070 : no210 port map( A => n1459, B => n1124, Y => n1458);
   U1071 : no210 port map( A => n1460, B => n1245, Y => n1459);
   U1072 : no210 port map( A => n1143, B => n1148, Y => n1245);
   U1073 : no310 port map( A => n1154, B => n1382, C => n1383, Y => n1460);
   U1074 : iv110 port map( A => cur_timer_1_time, Y => n1382);
   U1075 : no310 port map( A => n1110, B => n1379, C => n1172, Y => n1457);
   U1076 : no210 port map( A => n1137, B => n1461, Y => n1379);
   U1077 : no210 port map( A => n1452, B => n1052, Y => n1461);
   U1078 : na210 port map( A => n1380, B => n1389, Y => n1455);
   U1079 : mu111 port map( A => n1462, B => n1463, S => cur_state_4_port, Y => 
                           n1454);
   U1080 : no310 port map( A => n1364, B => n1464, C => n1465, Y => n1463);
   U1081 : no210 port map( A => n1128, B => n1466, Y => n1465);
   U1082 : iv110 port map( A => n1467, Y => n1466);
   U1083 : na210 port map( A => n1468, B => n1469, Y => n1467);
   U1084 : na210 port map( A => n1189, B => timer_1_done, Y => n1469);
   U1085 : no210 port map( A => n1299, B => n1138, Y => n1189);
   U1086 : na310 port map( A => n1169, B => cur_timer_1_time, C => 
                           inv_inputs_4_port, Y => n1468);
   U1087 : iv110 port map( A => n1154, Y => n1169);
   U1088 : na210 port map( A => n1380, B => n1138, Y => n1154);
   U1089 : iv110 port map( A => n1148, Y => n1380);
   U1090 : iv110 port map( A => n1470, Y => n1128);
   U1091 : no310 port map( A => n1471, B => cur_state_3_port, C => n1472, Y => 
                           n1464);
   U1092 : no210 port map( A => n1211, B => n1339, Y => n1472);
   U1093 : na210 port map( A => n986, B => n983, Y => n1339);
   U1094 : na210 port map( A => n1085, B => n1202, Y => n1211);
   U1095 : iv110 port map( A => check_empty, Y => n1202);
   U1096 : mu111 port map( A => n1473, B => n1474, S => cur_state_1_port, Y => 
                           n1471);
   U1097 : iv110 port map( A => n1291, Y => n1474);
   U1098 : na210 port map( A => n1200, B => n1216, Y => n1291);
   U1099 : no210 port map( A => n1475, B => n1470, Y => n1473);
   U1100 : no210 port map( A => n1476, B => n1477, Y => n1475);
   U1101 : no210 port map( A => n983, B => check_empty, Y => n1477);
   U1102 : no210 port map( A => cur_state_0_port, B => n1417, Y => n1476);
   U1103 : no210 port map( A => n1216, B => clear_shift_ready, Y => n1417);
   U1104 : no210 port map( A => n1478, B => n1187, Y => n1364);
   U1105 : na210 port map( A => cur_state_3_port, B => n1171, Y => n1187);
   U1106 : iv110 port map( A => n1479, Y => n1478);
   U1107 : na310 port map( A => n1480, B => n1138, C => n1481, Y => n1479);
   U1108 : na210 port map( A => n1255, B => check_empty, Y => n1481);
   U1109 : iv110 port map( A => n1214, Y => n1255);
   U1110 : na210 port map( A => n983, B => n1143, Y => n1214);
   U1111 : na310 port map( A => cur_state_0_port, B => n1216, C => 
                           inv_inputs_0_port, Y => n1480);
   U1112 : no310 port map( A => n1482, B => n1483, C => n1484, Y => n1462);
   U1113 : no310 port map( A => n1302, B => n1052, C => n1210, Y => n1484);
   U1114 : na210 port map( A => n1258, B => n986, Y => n1210);
   U1115 : na310 port map( A => draw_erase_ready, B => n1383, C => n1413, Y => 
                           n1302);
   U1116 : iv110 port map( A => inv_inputs_5_port, Y => n1383);
   U1117 : no310 port map( A => n1353, B => n1354, C => n1113, Y => n1483);
   U1118 : na210 port map( A => n1171, B => n1299, Y => n1113);
   U1119 : no310 port map( A => inv_inputs_4_port, B => inv_inputs_5_port, C =>
                           n1452, Y => n1354);
   U1120 : iv110 port map( A => n1413, Y => n1452);
   U1121 : no310 port map( A => inv_inputs_2_port, B => inv_inputs_3_port, C =>
                           n1485, Y => n1413);
   U1122 : na210 port map( A => n1357, B => n1268, Y => n1485);
   U1123 : iv110 port map( A => inv_inputs_0_port, Y => n1268);
   U1124 : iv110 port map( A => inv_inputs_1_port, Y => n1357);
   U1125 : na210 port map( A => cur_state_6_port, B => n1143, Y => n1353);
   U1126 : no210 port map( A => n986, B => n1385, Y => n1482);
   U1127 : na310 port map( A => n1258, B => n1138, C => n1229, Y => n1385);
   U1128 : iv110 port map( A => n1392, Y => n1229);
   U1129 : na210 port map( A => draw_erase_ready, B => n1143, Y => n1392);
   U1130 : iv110 port map( A => n1486, Y => lut_next_piece);
   U1131 : no210 port map( A => n1487, B => n1488, Y => n1486);
   U1132 : no210 port map( A => n1096, B => n1052, Y => n1488);
   U1133 : na210 port map( A => n1489, B => n1490, Y => draw_score_draw);
   U1134 : na210 port map( A => n1002, B => n1491, Y => n1490);
   U1135 : na210 port map( A => n1086, B => n1200, Y => n1489);
   U1136 : na310 port map( A => n1492, B => n1493, C => n1494, Y => 
                           draw_erase_start);
   U1137 : no310 port map( A => n1487, B => n1495, C => n1496, Y => n1494);
   U1138 : no210 port map( A => n1044, B => n1052, Y => n1496);
   U1139 : no210 port map( A => n1122, B => n1097, Y => n1495);
   U1140 : na210 port map( A => n1497, B => n1498, Y => n1487);
   U1141 : na310 port map( A => n1056, B => n1108, C => n1200, Y => n1498);
   U1142 : na210 port map( A => n1086, B => n1085, Y => n1497);
   U1143 : na210 port map( A => n1499, B => n1137, Y => n1493);
   U1144 : no210 port map( A => draw_erase_draw_port, B => n1500, Y => n1492);
   U1145 : no210 port map( A => n1110, B => n1093, Y => n1500);
   U1146 : na310 port map( A => n1501, B => n1502, C => n1503, Y => 
                           draw_erase_draw_port);
   U1147 : no310 port map( A => n1504, B => n1505, C => n1506, Y => n1503);
   U1148 : no210 port map( A => n1057, B => n1045, Y => n1506);
   U1149 : na210 port map( A => n1231, B => n1003, Y => n1045);
   U1150 : no210 port map( A => n1507, B => n1123, Y => n1505);
   U1151 : no210 port map( A => n1055, B => n1009, Y => n1507);
   U1152 : iv110 port map( A => n1036, Y => n1009);
   U1153 : na210 port map( A => n1108, B => n1137, Y => n1036);
   U1154 : iv110 port map( A => n1070, Y => n1055);
   U1155 : na210 port map( A => n1108, B => n1273, Y => n1070);
   U1156 : no210 port map( A => n1104, B => n1096, Y => n1504);
   U1157 : iv110 port map( A => n1508, Y => n1104);
   U1158 : iv110 port map( A => n1125, Y => n1502);
   U1159 : na210 port map( A => n1509, B => n1510, Y => n1125);
   U1160 : na310 port map( A => n1112, B => n1470, C => n1491, Y => n1510);
   U1161 : na210 port map( A => n1201, B => n1052, Y => n1470);
   U1162 : na210 port map( A => n1086, B => n1273, Y => n1509);
   U1163 : iv110 port map( A => n1129, Y => n1086);
   U1164 : na210 port map( A => n1056, B => n1231, Y => n1129);
   U1165 : no210 port map( A => n1511, B => n1512, Y => n1501);
   U1166 : no210 port map( A => n1044, B => n1103, Y => n1512);
   U1167 : no210 port map( A => n1124, B => n1097, Y => n1511);
   U1168 : na210 port map( A => n1095, B => n1513, Y => clear_shift_start);
   U1169 : na210 port map( A => n1499, B => n1273, Y => n1513);
   U1170 : na210 port map( A => n1389, B => n1514, Y => n1095);
   U1171 : na310 port map( A => n1515, B => n1001, C => n1516, Y => check_start
                           );
   U1172 : no310 port map( A => n1517, B => n1518, C => n1519, Y => n1516);
   U1173 : no210 port map( A => n1520, B => n1096, Y => n1519);
   U1174 : na210 port map( A => n1491, B => n1231, Y => n1096);
   U1175 : iv110 port map( A => n1124, Y => n1491);
   U1176 : na210 port map( A => n983, B => n1157, Y => n1124);
   U1177 : no210 port map( A => n1123, B => n1093, Y => n1518);
   U1178 : no210 port map( A => n1052, B => n1521, Y => n1517);
   U1179 : iv110 port map( A => n1127, Y => n1001);
   U1180 : na210 port map( A => n1522, B => n1523, Y => n1127);
   U1181 : na310 port map( A => n1003, B => n1112, C => n1200, Y => n1523);
   U1182 : na210 port map( A => n1085, B => n1499, Y => n1522);
   U1183 : iv110 port map( A => n1094, Y => n1499);
   U1184 : na310 port map( A => n1003, B => n1299, C => n1185, Y => n1094);
   U1185 : no210 port map( A => n1524, B => n1047, Y => n1515);
   U1186 : na210 port map( A => n1525, B => n1526, Y => n1047);
   U1187 : na310 port map( A => n1389, B => n1508, C => n1108, Y => n1526);
   U1188 : no210 port map( A => n1148, B => cur_state_6_port, Y => n1108);
   U1189 : na210 port map( A => cur_state_3_port, B => n986, Y => n1148);
   U1190 : na310 port map( A => n1525, B => n1034, C => n1527, Y => add_sub);
   U1191 : no210 port map( A => n1132, B => n1004, Y => n1527);
   U1192 : na310 port map( A => n1528, B => n1026, C => n1529, Y => n1004);
   U1193 : na210 port map( A => n1099, B => n1508, Y => n1529);
   U1194 : na210 port map( A => n1052, B => n1103, Y => n1508);
   U1195 : iv110 port map( A => n1521, Y => n1099);
   U1196 : na310 port map( A => n1185, B => n1299, C => n1389, Y => n1521);
   U1197 : na210 port map( A => n1200, B => n1530, Y => n1026);
   U1198 : na210 port map( A => n1024, B => n1531, Y => n1530);
   U1199 : na210 port map( A => n1389, B => n1112, Y => n1531);
   U1200 : iv110 port map( A => n1052, Y => n1200);
   U1201 : na210 port map( A => n1143, B => n1138, Y => n1052);
   U1202 : na210 port map( A => n1002, B => n1389, Y => n1528);
   U1203 : iv110 port map( A => n1093, Y => n1002);
   U1204 : na210 port map( A => n1085, B => n1112, Y => n1093);
   U1205 : iv110 port map( A => n1103, Y => n1085);
   U1206 : na210 port map( A => cur_state_0_port, B => n1138, Y => n1103);
   U1207 : iv110 port map( A => cur_state_5_port, Y => n1138);
   U1208 : no210 port map( A => n1520, B => n1044, Y => n1132);
   U1209 : na310 port map( A => n1185, B => n1157, C => n1258, Y => n1044);
   U1210 : iv110 port map( A => n1228, Y => n1258);
   U1211 : na210 port map( A => n983, B => n1299, Y => n1228);
   U1212 : iv110 port map( A => n1142, Y => n1185);
   U1213 : iv110 port map( A => n1118, Y => n1520);
   U1214 : na210 port map( A => n1057, B => n1201, Y => n1118);
   U1215 : iv110 port map( A => y_port, Y => n1034);
   U1216 : na210 port map( A => n1030, B => n1532, Y => y_port);
   U1217 : na210 port map( A => n1533, B => n1137, Y => n1532);
   U1218 : iv110 port map( A => n1524, Y => n1030);
   U1219 : na210 port map( A => n1534, B => n1535, Y => n1524);
   U1220 : na210 port map( A => n1003, B => n1514, Y => n1535);
   U1221 : iv110 port map( A => n1536, Y => n1514);
   U1222 : iv110 port map( A => n1122, Y => n1003);
   U1223 : na210 port map( A => n981, B => n983, Y => n1122);
   U1224 : na210 port map( A => n1533, B => n1273, Y => n1534);
   U1225 : iv110 port map( A => n1024, Y => n1533);
   U1226 : na210 port map( A => n1389, B => n1231, Y => n1024);
   U1227 : no210 port map( A => n1299, B => n1142, Y => n1231);
   U1228 : na210 port map( A => n1171, B => n1114, Y => n1142);
   U1229 : iv110 port map( A => cur_state_6_port, Y => n1114);
   U1230 : iv110 port map( A => cur_state_1_port, Y => n1171);
   U1231 : iv110 port map( A => n1123, Y => n1389);
   U1232 : na210 port map( A => n981, B => n1216, Y => n1123);
   U1233 : na210 port map( A => n1056, B => n1537, Y => n1525);
   U1234 : na210 port map( A => n1097, B => n1536, Y => n1537);
   U1235 : na210 port map( A => n1112, B => n1137, Y => n1536);
   U1236 : iv110 port map( A => n1201, Y => n1137);
   U1237 : na210 port map( A => n982, B => cur_state_0_port, Y => n1201);
   U1238 : na210 port map( A => n1273, B => n1112, Y => n1097);
   U1239 : no210 port map( A => n1172, B => cur_state_6_port, Y => n1112);
   U1240 : na210 port map( A => n986, B => n1299, Y => n1172);
   U1241 : iv110 port map( A => cur_state_3_port, Y => n1299);
   U1242 : iv110 port map( A => n1057, Y => n1273);
   U1243 : na210 port map( A => n982, B => n1143, Y => n1057);
   U1244 : iv110 port map( A => cur_state_0_port, Y => n1143);
   U1245 : iv110 port map( A => n1110, Y => n1056);
   U1246 : na210 port map( A => n1216, B => n1157, Y => n1110);
   U1247 : iv110 port map( A => cur_state_4_port, Y => n1157);
   U1248 : iv110 port map( A => cur_state_2_port, Y => n1216);

end synthesised;



