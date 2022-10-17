// packageimport 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
//
// Future isInternet() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile) {
//     if (await DataConnectionChecker().hasConnection) {
//       return true;
//     } else {
//       return Get.snackbar(
//           'Attention', 'Your Device does not have a Mobile Connection',
//           backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
//           colorText: Colors.red,
//           icon: Icon(
//             Icons.warning,
//             color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
//           ),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   } else if (connectivityResult == ConnectivityResult.wifi) {
//     if (await DataConnectionChecker().hasConnection) {
//       return true;
//     } else {
//       return Get.snackbar(
//           'Attention', 'Your Device does not have a Wi-fi Connection',
//           backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
//           colorText: Colors.red,
//           icon: Icon(
//             Icons.warning,
//             color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
//           ),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   } else {
//     return Get.snackbar(
//         'Attention', 'Your Device is not connected to the Internet',
//         backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
//         colorText: Colors.red,
//         icon: Icon(
//           Icons.warning,
//           color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
//         ),
//         snackPosition: SnackPosition.BOTTOM);
//   }
// }
