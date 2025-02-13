import 'package:flutter/material.dart';
import 'package:tasks/models/product.dart';

class Details extends StatelessWidget {
  final Product product;
  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      // 1 title  text
      // 2 image image . network
      // 3 price text string
      // 4 description string
      // 5 category string
      // 6 rating string
    );
  }
}
