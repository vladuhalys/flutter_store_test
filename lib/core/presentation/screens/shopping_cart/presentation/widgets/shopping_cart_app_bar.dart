import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

Widget shoppingCartAppBar(BuildContext context) {
  return AppBar(
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
    actions: [
      GetBuilder<ControllerCounerGetX>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Obx(
            () => badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
              ),
              badgeContent: Text('${controller.count.value}',
                  style: const TextStyle(color: Colors.white)),
              showBadge: (controller.count.value > 0) ? true : false,
              child: const Icon(
                Icons.shopping_cart_rounded,
                size: 28.0,
                color: Colors.indigo,
              ),
            ),
          ),
        );
      }),
    ],
    backgroundColor: Colors.transparent,
  );
}
