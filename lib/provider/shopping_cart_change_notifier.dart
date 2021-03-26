import 'dart:collection';

import 'package:flutter/widgets.dart';

import '../extensions.dart';

class ShoppingCart extends ChangeNotifier {
  final List<Product> _products;

  ShoppingCart({List<Product> products}) : _products = products;

  factory ShoppingCart.empty() {
    return ShoppingCart(products: []);
  }

  factory ShoppingCart.prefilled(List<Product> products) {
    return ShoppingCart(products: products);
  }

  UnmodifiableListView<Product> get items => UnmodifiableListView(_products);

  String get totalPrice => items
      .fold(0.0, (double sum, product) => sum + product.price)
      .formattedPrice;

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _products.add(product);
    notifyListeners();
  }
}

class Product {
  final String name;
  final double price;

  Product({this.name, this.price});

  String get formattedPrice => price.formattedPrice;
}
