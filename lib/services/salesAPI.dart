import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_shop/services/tokenAPI.dart';

var headers = {
  'Authorization': 'Bearer ${session.first.accessKey}',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};
var salesData;

Future getSales() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/sales/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    salesData = await jsonDecode(data);
    print(salesData);

    return jsonDecode(data);
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

getproductName(index) {
  return salesData[index]['name'];
}

double getPrice(index) {
  double price = double.parse(salesData[index]['amount_paid']);
  return price;
}

int getQuantity(index) {
  int quantity = salesData[index]['quantity_bought'];
  return quantity;
}

getIncome(index) {
  double income = double.parse(salesData[index]['income']);
  return income;
}
