import 'package:flutter/material.dart';
import 'sales.dart';

class Data extends ChangeNotifier {
  List<Sales> _sales = [
    Sales(Pricepaid: 5000, quantity: 24),
    Sales(Pricepaid: 6500, quantity: 12),
    Sales(Pricepaid: 8600, quantity: 28),
    Sales(Pricepaid: 84600, quantity: 19),
    Sales(Pricepaid: 29800, quantity: 59),
    Sales(Pricepaid: 3831, quantity: 12),
    Sales(Pricepaid: 21800, quantity: 22),
    Sales(Pricepaid: 28710, quantity: 34),
    Sales(Pricepaid: 12000, quantity: 54),
    Sales(Pricepaid: 1000, quantity: 98),
  ];

  List<Sales> get sales => _sales;
  int get salesLenght => _sales.length;

  void addToList(double price, int quantity) {
    _sales.add(Sales(Pricepaid: price, quantity: quantity));
    notifyListeners();
  }

  // String name(int index) {
  //   return _sales.elementAt(index).Productname;
  // }

  dynamic deleteTask(int index) {
    _sales.removeAt(index);
    notifyListeners();
  }
}
