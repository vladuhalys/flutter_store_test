import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text('store'.tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    )),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: badges.Badge(
                      onTap: () => Get.toNamed('/shopping_cart'),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.indigo,
                      ),
                      badgeContent: Text('$count',
                          style: const TextStyle(color: Colors.white)),
                      showBadge: (count > 0) ? true : false,
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, top: 3.0),
                    child: IconButton(
                      onPressed: () => Get.toNamed('/sign_in'),
                      icon: const Icon(
                        Icons.account_circle_rounded,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              body: Center(
                child: Text('hello'.tr),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: () => Get.toNamed('/settings'),
                child: const Icon(Icons.settings_rounded),
              )));
    });
  }
}
