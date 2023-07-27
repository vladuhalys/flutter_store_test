import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/products/products.dart';
import 'package:flutter_store_test/core/presentation/widgets/product_card.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Products productsList = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: productsList.products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: productsList.products[index]);
        }));
  }
}
