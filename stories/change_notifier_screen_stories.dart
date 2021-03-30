// ignore_for_file: non_constant_identifier_names
import 'package:flutter/widgets.dart';
import 'package:monarch_samples/provider/change_notifier_screen.dart';
import 'package:monarch_samples/provider/shopping_cart_change_notifier.dart';
import 'package:provider/provider.dart';

Widget empty_cart() => ChangeNotifierProvider.value(
    value: ShoppingCart.empty(), child: ChangeNotifierScreen());

Widget sample_cart() => ChangeNotifierProvider.value(
    value: ShoppingCart.prefilled([
      Product(name: 'Flutter by example - Ebook', price: 19.99),
      Product(name: 'Flutter in action - Ebook', price: 17.99),
      Product(name: 'Mastering Flutter - Ebook', price: 14.99),
    ]),
    child: ChangeNotifierScreen());

Widget really_long_product_names_cart() => ChangeNotifierProvider.value(
    value: ShoppingCart.prefilled([
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

Widget expensive_ebooks_cart() => ChangeNotifierProvider.value(
    value: ShoppingCart.prefilled([
      Product(name: 'Flutter by example - Ebook', price: 119000.99),
      Product(name: 'Flutter in action - Ebook', price: 175000.99),
      Product(name: 'Mastering Flutter - Ebook', price: 999999999.99),
    ]),
    child: ChangeNotifierScreen());
