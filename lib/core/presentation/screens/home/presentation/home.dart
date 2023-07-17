import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/data/api/demmyjson/api.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/product/product.dart';
import 'package:flutter_store_test/core/domain/models/products/products.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:flutter_store_test/core/presentation/widgets/product_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ControllerCounerGetX countGetX = Get.find();
  Products productsList = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'store'.tr,
                            style: GoogleFonts.montserrat(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart_rounded),
                      title: Text('shopping_cart'.tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          )),
                      onTap: () => Get.toNamed('/shopping_cart'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings_rounded),
                      title: Text('settings'.tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          )),
                      onTap: () => Get.toNamed('/settings'),
                    ),
                  ],
                ),
              ),
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
                    child: TextButton(
                      onPressed: () => Get.toNamed('/settings'),
                      child: Text(
                        'sign_in'.tr,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: FutureBuilder(
                future: ProductApi.fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    productsList.products.value =
                        snapshot.data as List<Product>;
                    return Obx(() => ListView.builder(
                        itemCount: productsList.products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                              product: productsList.products[index]);
                        }));
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error fetching products'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
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
              )));
    });
  }
}
