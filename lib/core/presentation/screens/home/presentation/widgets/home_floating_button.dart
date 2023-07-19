import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class HomeFloatingActionButton extends StatefulWidget {
  const HomeFloatingActionButton({super.key});

  @override
  State<HomeFloatingActionButton> createState() =>
      _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  ControllerCounerGetX countGetX = Get.find();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.indigo,
      onPressed: () => Get.toNamed('/shopping_cart'),
      child: Obx(
        () => badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
          ),
          badgeContent: Text('${countGetX.count.value}',
              style: const TextStyle(color: Colors.white)),
          showBadge: (countGetX.count.value > 0) ? true : false,
          child: const Icon(
            Icons.shopping_cart_rounded,
            size: 28.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
