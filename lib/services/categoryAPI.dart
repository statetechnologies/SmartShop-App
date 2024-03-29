import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_shop/services/tokenAPI.dart';

import '../constants/reusables.dart';

var headers = {
  'Authorization': 'Bearer ${session.first.accessKey}',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};

var categoryData, length;

Future getCategory() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop-yqokj.ondigitalocean.app/api/categories/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    categoryData = await jsonDecode(data);

    final lengths = categoryData.length;
    // print('Category length is $lengths');
    // print(' Category $categoryData');

    return categoryData;
  } else {
    print(response.reasonPhrase);
  }
}

Future<dynamic> addCategory({required String title}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$apiLink/categories/'));
  request.fields.addAll({'title': title});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    categoryData = await jsonDecode(data);

    final lengths = categoryData.length;
    // print('Category length is $lengths');
    // print(' Category $categoryData');

    return categoryData;
  } else {
    print(response.reasonPhrase);
  }
}

getCategoryName(index) {
  return categoryData[index]['title'];
}

int getTypeLength() {
  length = categoryData.length;
  return length;
}
