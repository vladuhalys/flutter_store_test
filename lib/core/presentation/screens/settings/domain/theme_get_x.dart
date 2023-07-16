import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeGetXController extends GetxController {
  var isDarkTheme = Get.isDarkMode.obs;

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    (isDarkTheme.value != true)
        ? Get.changeThemeMode(ThemeMode.dark)
        : Get.changeThemeMode(ThemeMode.light);
  }
}
