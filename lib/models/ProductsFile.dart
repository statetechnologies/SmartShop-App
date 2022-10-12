import 'package:flutter/material.dart';
import 'products.dart';

class Data extends ChangeNotifier {
  List<Products> _product = [
    Products(Productname: 'Pepsi', Productprice: 500, quantity: 10),
    Products(Productname: 'Coca Cola', Productprice: 1000, quantity: 59),
    Products(Productname: 'Mirinda', Productprice: 500, quantity: 20),
    Products(Productname: 'Quencher', Productprice: 500, quantity: 15),
    Products(Productname: 'Appple Punch', Productprice: 500, quantity: 15),
    Products(Productname: 'Jembe', Productprice: 500, quantity: 15),
    Products(Productname: 'Mo extra', Productprice: 500, quantity: 15),
    Products(Productname: 'Twist', Productprice: 500, quantity: 15),
    Products(Productname: 'Rozela', Productprice: 500, quantity: 15),
    Products(Productname: 'Anjari', Productprice: 500, quantity: 15),
  ];

  List<Products> get product => _product;
  int get productLenght => _product.length;

  void addToList(String name, double price, int quantity) {
    _product.add(
        Products(Productname: name, Productprice: price, quantity: quantity));
    notifyListeners();
  }

  String name(int index) {
    return _product.elementAt(index).Productname;
  }

  dynamic deleteTask(int index) {
    _product.removeAt(index);
    notifyListeners();
  }
}
