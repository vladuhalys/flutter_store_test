import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('shopping_cart'.tr,
                style: GoogleFonts.montserrat(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                )),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: const Center(child: Text('Shopping Cart')),
        ),
      );
    });
  }
}
