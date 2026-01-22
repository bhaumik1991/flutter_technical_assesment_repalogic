import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_technical_assesment_repalogic/products_list/model/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final jsonString =
    await rootBundle.loadString('assets/products.json');
    final List data = json.decode(jsonString);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
