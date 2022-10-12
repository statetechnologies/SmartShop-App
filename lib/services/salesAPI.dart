import 'package:http/http.dart' as http;

var headers = {
  'Authorization':
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY1NjU5MjQwLCJpYXQiOjE2NjU1NzI4NDAsImp0aSI6IjU3YmYwMTU1NzRlZDRhNjM4MWMzZjNiMWIzMzE4Y2Q2IiwidXNlcl9pZCI6MX0.R92EKHNb7fcQdcWnZCs5HN_eQOif6L5jk5HnizV26BA',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};
void getSales() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/sales/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void addSales({required double paid, required String product}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/sales/'));

  request.headers.addAll(headers);
  request.fields
      .addAll({"amount_paid": paid.toStringAsFixed(2), "product": product});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
