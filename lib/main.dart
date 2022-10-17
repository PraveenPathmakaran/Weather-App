import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weatherapp/view/home_screen.dart';

import 'controller/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        themeMode: themeController.themeMode.value,
        theme: ThemeChange.lightTheme,
        darkTheme: ThemeChange.darkTheme,
        home: const HomeScreen(),
        title: 'Weather',
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
