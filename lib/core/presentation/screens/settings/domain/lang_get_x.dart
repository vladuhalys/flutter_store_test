import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangGetXControler extends GetxController {
  var isEng = ((Get.deviceLocale?.languageCode == 'en') ? true : false).obs;
  changeLang() {
    isEng.value = !isEng.value;
    Get.updateLocale(
        (isEng.value) ? const Locale('uk', 'UA') : const Locale('en', 'US'));
  }
}
