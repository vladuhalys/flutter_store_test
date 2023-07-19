import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/widgets/shopping_cart_app_bar.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/widgets/shopping_cart_body.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            appBar: shoppingCartAppBar(context) as PreferredSizeWidget?,
            body: const ShoppingCartBody()),
      );
    });
  }
}
