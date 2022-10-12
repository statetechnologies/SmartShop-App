import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  void _saveToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFrombox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadThemeFrombox() ? ThemeMode.dark : ThemeMode.light;

  void changeThemeMode() {
    Get.changeThemeMode(_loadThemeFrombox() ? ThemeMode.light : ThemeMode.dark);
    _saveToBox(!_loadThemeFrombox());
  }
}
