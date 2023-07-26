import 'package:flutter_store_test/core/data/api/demmyjson/api.dart';
import 'package:flutter_store_test/core/domain/models/product/product.dart';
import 'package:get/get.dart';

class Products extends GetxController {
  var products = <Product>[].obs;

  getProductsFromApi() async {
    products.value = await ProductApi.fetchProducts();
  }
}
