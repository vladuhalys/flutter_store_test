import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/get_x/count_goods.dart';
import 'package:flutter_store_test/core/domain/models/purchased_goods/purchased_goods.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Get.find<ControllerCounerGetX>();
    return GetBuilder<PurchasedGoods>(builder: (controller) {
      return Obx(() => ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.network(
                        controller.products[index].images[0],
                        width: 100.0,
                        height: 100.0,
                      ),
                      title: Obx(() => Text(
                            controller.products[index].title,
                            style: GoogleFonts.montserrat(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      subtitle: Text(
                        controller.products[index].description,
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_rounded),
                        onPressed: () {
                          controller.deleteItem(index);
                          counter.decrement();
                          controller.update();
                        },
                      ),
                    ),
                    Obx(
                      () =>
                          (controller.products[index].purchasedCount.value > 1)
                              ? Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    '${'purchasedCount'.tr}: ${controller.products[index].purchasedCount.value}',
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
          ));
    });
  }
}
