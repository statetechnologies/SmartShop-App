import 'package:flutter/material.dart';
import 'type.dart';

class Data extends ChangeNotifier {
  List<Type> _type = [
    Type(type: 'Drinks'),
    Type(type: 'Food'),
    Type(type: 'Cereals'),
    Type(type: 'Biscuits'),
    Type(type: 'Crisps'),
    Type(type: 'Buns'),
    Type(type: 'Sambusa'),
    Type(type: 'Kachori'),
    Type(type: 'Bagia'),
    Type(type: 'Chapati'),
  ];

  List<Type> get type => _type;
  int get typeLenght => _type.length;

  void addToList(String type) {
    _type.add(Type(type: type));
    notifyListeners();
  }

  String name(int index) {
    return _type.elementAt(index).type;
  }

  dynamic deleteTask(int index) {
    _type.removeAt(index);
    notifyListeners();
  }
}
