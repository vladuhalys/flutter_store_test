import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/product/product.dart';
import 'package:flutter_store_test/core/domain/models/purchased_goods/purchased_goods.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var purchasedGoods = Get.find<PurchasedGoods>();
  var countGetX = Get.find<ControllerCounerGetX>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)), // Image border
              child: Image.network(widget.product.images.first),
            ),
            const SizedBox(height: 10), // Space between image and text (price
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.product.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('${widget.product.price.toStringAsFixed(2)} USD',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                widget.product.description,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF5566FF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
                onPressed: () {
                  if (purchasedGoods.products.contains(widget.product)) {
                    purchasedGoods.products
                        .elementAt(
                            purchasedGoods.products.indexOf(widget.product))
                        .purchasedCount
                        .value++;
                  } else {
                    purchasedGoods.products.add(widget.product);
                  }
                  countGetX.increment();
                },
                child: Text(
                  'shopping_cart_button'.tr,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
