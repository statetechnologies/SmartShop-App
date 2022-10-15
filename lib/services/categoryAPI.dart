import 'package:http/http.dart' as http;
import 'package:smart_shop/services/tokenAPI.dart';

var headers = {
  'Authorization': 'Bearer ${session.first.accessKey}',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};
Future getCategory() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/categories/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void addCategory({required String title}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/categories/'));
  request.fields.addAll({'title': title});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
