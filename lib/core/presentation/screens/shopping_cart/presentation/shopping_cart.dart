import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/purchased_goods/purchased_goods.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/widgets/shopping_cart_app_bar.dart';
import 'package:flutter_store_test/core/presentation/screens/shopping_cart/presentation/widgets/shopping_cart_body.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCounerGetX>(builder: (controllerCounter) {
      return GetBuilder<ThemeGetXController>(builder: (controller) {
        return SafeArea(
          child: Scaffold(
              appBar: shoppingCartAppBar(context) as PreferredSizeWidget?,
              body: const ShoppingCartBody(),
              floatingActionButton: Obx(() => Visibility(
                    visible:
                        (controllerCounter.count.value == 0) ? false : true,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) {
                          if (user == null) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('notification'.tr),
                                content: Text(
                                  'user_error'.tr,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Get.toNamed('/sign_in'),
                                    child: Text('sign_in_titel'.tr),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('receipt'.tr),
                                content: Text(
                                  '${'product_buy_success'.tr}, ${FirebaseAuth.instance.currentUser?.displayName}.',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      var purchasedGoods =
                                          Get.put(PurchasedGoods());
                                      controllerCounter.count.value = 0;
                                      purchasedGoods.products.clear();
                                      Get.toNamed('/home');
                                    },
                                    child: Text('home_titel'.tr),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                      label: Obx(() => Text(
                            '${'button_buy'.tr} ${controllerCounter.count.value} ${'items_count_titel'.tr}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )),
                      backgroundColor: const Color(0xFF5566FF),
                    ),
                  ))),
        );
      });
    });
  }
}
