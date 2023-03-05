import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/reusables.dart';
import '../pages/homepage.dart';
import 'Sessions.dart';

List<Session> session = [];
bool? showSign;

var accessKeys;
String? goPage;

class Token extends ChangeNotifier {
  Future getToken({required String username, required String password}) async {
    try {
      var headers = {
        'Cookie':
        'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$apiLink/token/'));

      request.fields.addAll({'username': username, 'password': password});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();

        var accessKey = await jsonDecode(data)['access'];
        var refreshKey = await jsonDecode(data)['refresh'];
        session.add(Session(
            username: username,
            password: password,
            accessKey: await accessKey,
            refreshkey: await refreshKey));

        accessKeys = await jsonDecode(data)['access'];

        notifyListeners();

        showSign = false;

        return jsonDecode(data);
      } else {
        String data = await response.stream.bytesToString();
        var output = jsonDecode(data);
        Get.snackbar('Required', output['detail'],
            backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            colorText: Colors.red,
            icon: Icon(
              Icons.warning,
              color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
            ),
            snackPosition: SnackPosition.BOTTOM);
        goPage = await response.reasonPhrase;
        showSign = false;
      }
    }catch(e){

      Get.snackbar('Required', e.toString(),
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          colorText: Colors.red,
          icon: Icon(
            Icons.warning,
            color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
          ),
          snackPosition: SnackPosition.BOTTOM);
      showSign = false;
    }
  }
}
