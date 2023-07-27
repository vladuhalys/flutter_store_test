import 'dart:convert';
import 'package:flutter_store_test/core/domain/models/product/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> fetchProducts() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final productJson =
          jsonDecode(response.body)['products'] as List<dynamic>;
      return productJson.map((c) => Product.fromJson(c)).toList();
    } else {
      throw Exception('Error fetching products');
    }
  }
}
