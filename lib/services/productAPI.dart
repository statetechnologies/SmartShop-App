import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_shop/services/tokenAPI.dart';

var headers = {
  'Authorization': 'Bearer ${session.first.accessKey}',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};
var productData;

var length, totalPrice;

Future<dynamic> getProducts() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/products/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    productData = await jsonDecode(data);

    var stores = await json.decode(data);
    final lengths = stores.length;
    print('Product Length is $lengths');
    print('Product Data $productData');
    return productData;
  } else {
    print(response.reasonPhrase);
  }
}

Future<dynamic> addProduct(
    {required String name,
    required String price,
    required var category,
    required String quantity}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/products/'));

  request.fields.addAll({
    'name': name,
    'price': price,
    'category': category,
    'quantity': quantity
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    productData = await jsonDecode(data);

    var stores = await json.decode(data);
    final lengths = stores.length;
    print('Product Length is $lengths');
    print('Product Data $productData');
    return productData;
  } else {
    print(response.reasonPhrase);
  }
}

getproductName(index) {
  return productData[index]['name'];
}

getPrice(index) {
  double price = double.parse(productData[index]['price']);
  return price;
}

getQuantity(index) {
  int quantity = productData[index]['quantity'];
  return quantity;
}

int getProductLength() {
  length = productData.length;
  return length;
}

sumPrice() {
  totalPrice = 0;
  for (int i = 0; i < getProductLength(); i++) {
    totalPrice += double.parse(productData[i]['price']);
  }
  return totalPrice;
}
