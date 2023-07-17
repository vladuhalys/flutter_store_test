import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/domain/models/product/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            minVerticalPadding: 50,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                child:
                    Image.network(widget.product.images[0], fit: BoxFit.cover),
              ),
            ),
            title: Text(widget.product.title),
            subtitle: Text(widget.product.price.toString()),
          ),
        ],
      ),
    );
  }
}
