import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

class ShoppingCartChangeNotifier extends ChangeNotifier {
  final List<Product> _products;

  ShoppingCartChangeNotifier({required List<Product> products}) : _products = products;

  factory ShoppingCartChangeNotifier.empty() {
    return ShoppingCartChangeNotifier(products: []);
  }

  factory ShoppingCartChangeNotifier.prefilled(List<Product> products) {
    return ShoppingCartChangeNotifier(products: products);
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

  Product({required this.name, required this.price});

  String get formattedPrice => price.formattedPrice;
}


final formatCurrency = NumberFormat.simpleCurrency();

extension StringUtils on double {
  String get formattedPrice => formatCurrency.format(this);
}
