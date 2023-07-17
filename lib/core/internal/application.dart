import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/products/products.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/lang_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/presentation/settings.dart';
import 'package:get/get.dart';

import 'package:flutter_store_test/core/internal/utils/languages.dart';
import 'package:flutter_store_test/core/presentation/screens/home/presentation/home.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/shopping_cart.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LangGetXControler());
    Get.put(ThemeGetXController());
    Get.put(ControllerCounerGetX());
    Get.put(Products());

    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.black),
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Store',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/shopping_cart', page: () => const ShoppingCartScreen()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
      ],
    );
  }
}
