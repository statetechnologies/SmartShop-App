import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri uri;
  NetworkHelper(this.uri);

  Future getData() async {
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Network helper error ${response.statusCode}');
    }
  }
}
