import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/products/products.dart';
import 'package:flutter_store_test/core/domain/models/purchased_goods/purchased_goods.dart';
import 'package:flutter_store_test/core/presentation/screens/profile/presentation/profile.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/lang_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/presentation/settings.dart';
import 'package:flutter_store_test/core/presentation/screens/sign_in/presentation/sign_in.dart';
import 'package:flutter_store_test/core/presentation/screens/sign_up/presentation/sign_up.dart';
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
    var products = Get.put(Products());
    products.getProductsFromApi();
    Get.put(PurchasedGoods());

    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primaryColor: const Color(0xFF5566FF),
          cardColor: const Color(0xFFECEFF1),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF5566FF),
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5566FF),
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color(0xFFECEFF1),
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F5F5)),
      darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF5566FF),
          cardColor: const Color(0xFF090909),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF5566FF),
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5566FF),
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color(0xFF090909),
          ),
          scaffoldBackgroundColor: const Color(0xFF131313)),
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
        GetPage(name: '/sign_in', page: () => const LoginScreen()),
        GetPage(name: '/sign_up', page: () => const SignUpScreen()),
        GetPage(name: '/profile', page: () => const AccountScreen()),
      ],
    );
  }
}
