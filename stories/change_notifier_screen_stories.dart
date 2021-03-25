import 'package:flutter/widgets.dart';
import 'package:monarch_samples/provider/change_notifier_screen.dart';
import 'package:monarch_samples/provider/shopping_cart_change_notifier.dart';

import 'useful_mocks.dart';

// ignore: non_constant_identifier_names
Widget empty_cart() =>
    mockChangeNotifier(ShoppingCart.empty(), child: ChangeNotifierScreen());

// ignore: non_constant_identifier_names
Widget sample_cart() => mockChangeNotifier(
    ShoppingCart.prefilled([
      Product(name: 'Flutter by example - Ebook', price: 19.99),
      Product(name: 'Flutter in action - Ebook', price: 17.99),
      Product(name: 'Mastering Flutter - Ebook', price: 14.99),
    ]),
    child: ChangeNotifierScreen());

// ignore: non_constant_identifier_names
Widget really_long_product_names_cart() => mockChangeNotifier(
    ShoppingCart.prefilled([
      Product(
          name: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
          price: 19.99),
      Product(
          name:
              'Ut a lorem ut dolor congue ornare sed non urna. Cras lectus ex, commodo sed ante sit amet, finibus feugiat orci.',
          price: 17.99),
      Product(
          name:
              'Maecenas erat libero, sodales eu tortor quis, porttitor pellentesque ligula. Aliquam eu mi sapien. Proin egestas convallis accumsan.',
          price: 14.99),
    ]),
    child: ChangeNotifierScreen());

// ignore: non_constant_identifier_names
Widget expensive_ebooks_cart() => mockChangeNotifier(
    ShoppingCart.prefilled([
      Product(name: 'Flutter by example - Ebook', price: 119000.99),
      Product(name: 'Flutter in action - Ebook', price: 175000.99),
      Product(name: 'Mastering Flutter - Ebook', price: 999999999.99),
    ]),
    child: ChangeNotifierScreen());
