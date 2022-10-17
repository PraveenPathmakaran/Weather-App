import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.dark.obs;
  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode.value = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}

class ThemeChange {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
