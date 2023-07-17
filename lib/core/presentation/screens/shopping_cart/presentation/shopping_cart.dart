import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/purchased_goods/purchased_goods.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    var productsList = Get.find<PurchasedGoods>();
    var counter = Get.find<ControllerCounerGetX>();
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Obx(
                    () => badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.red,
                      ),
                      badgeContent: Text('${counter.count.value}',
                          style: const TextStyle(color: Colors.white)),
                      showBadge: (counter.count.value > 0) ? true : false,
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 28.0,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            body: (counter.count.value == 0)
                ? Center(
                    child: Text('empty_cart'.tr,
                        style: GoogleFonts.montserrat(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        )))
                : Obx(() => ListView.builder(
                      itemCount: productsList.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.network(
                                  productsList.products[index].images[0],
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                title: Obx(() => Text(
                                      productsList.products[index].title,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                subtitle: Text(
                                  productsList.products[index].description,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_rounded),
                                  onPressed: () {
                                    productsList.deleteItem(index);
                                    counter.decrement();
                                    productsList.update();
                                  },
                                ),
                              ),
                              Obx(
                                () => (productsList.products[index]
                                            .purchasedCount.value >
                                        1)
                                    ? Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          '${'purchasedCount'.tr}: ${productsList.products[index].purchasedCount.value}',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.indigo,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        );
                      },
                    ))),
      );
    });
  }
}
