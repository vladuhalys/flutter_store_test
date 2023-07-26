import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/widgets/shopping_cart_body/state_is_empty.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/widgets/shopping_cart_body/state_list_product.dart';
import 'package:get/get.dart';

class ShoppingCartBody extends StatelessWidget {
  const ShoppingCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCounerGetX>(builder: (controller) {
      return Obx(() => (controller.count.value == 0)
          ? const StateIsEmpty()
          : const ListProduct());
    });
  }
}
