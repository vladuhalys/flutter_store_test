import 'package:flutter_store_test/core/domain/models/product/product.dart';
import 'package:get/get.dart';

class PurchasedGoods extends GetxController {
  var products = <Product>[].obs;

  deleteItem(int index) {
    if (products[index].purchasedCount.value > 1) {
      products[index].purchasedCount.value--;
    } else {
      products.removeAt(index).obs;
    }
  }

  getTotalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < products.length; i++) {
      totalPrice += products[i].price * products[i].purchasedCount.value;
    }
    return totalPrice;
  }
}
