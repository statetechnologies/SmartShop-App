import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_shop/services/tokenAPI.dart';

var headers = {
  'Authorization':
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY1OTYxNzIwLCJpYXQiOjE2NjU4NzUzMjAsImp0aSI6ImQ3MTM4NTFhNDE1YjRhYmY5ZmZmN2FlY2IwMDY0ZGI1IiwidXNlcl9pZCI6MX0.I7ovdCblN_VQ_ovM0t-6JvdzRHdUe7lE4wkblybXLvI',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};
var productData;

Future<dynamic> getProducts() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/products/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    productData = await jsonDecode(data);
    print(productData);
    return productData;
  } else {
    print(response.reasonPhrase);
  }
}

void addProduct(
    {required String name,
    required String price,
    required String category}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/products/'));

  request.fields.addAll({"name": name, "price": price, "category": category});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

getproductName(index) {
  return productData[index]['name'];
}

String printName(index) {
  return getproductName(index).toString();
}

getPrice(index) {
  double price = double.parse(productData[index]['price']);
  return price;
}

printPrice(index) async {
  return await getPrice(index);
}

getQuantity(index) {
  int quantity = productData[index]['quantity'];
  return quantity;
}

printQuantity(index) async {
  return await getQuantity(index);
}
