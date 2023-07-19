import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:monarch_samples_patterns/provider/current_date.dart';
import 'package:monarch_samples_patterns/provider/provider_example_list.dart';
import 'package:monarch_samples_patterns/provider/shopping_cart_change_notifier.dart';
import 'package:provider/provider.dart';

Widget today_empty_cart() => MultiProvider(
        providers: [
          Provider<CurrentDate>(
            create: (_) => CurrentDate(
                currentDateFn: () =>
                    DateFormat.yMMMEd().format(DateTime.now())),
          ),
          ChangeNotifierProvider<ShoppingCartChangeNotifier>(
              create: (_) => ShoppingCartChangeNotifier.empty())
        ],
        child: Navigator(
            initialRoute: 'story_nav',
            onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
                builder: (_) => ProviderExampleListScreen(),
                settings: settings)));

Widget future_filled_cart() => MultiProvider(
        providers: [
          Provider<CurrentDate>(
            create: (_) => CurrentDate(currentDateFn: () => 'Jan 1, 2030'),
          ),
          ChangeNotifierProvider<ShoppingCartChangeNotifier>(
              create: (_) => ShoppingCartChangeNotifier.prefilled([
                    Product(name: 'Flutter by example - Ebook', price: 19.99),
                    Product(name: 'Flutter in action - Ebook', price: 17.99),
                    Product(name: 'Mastering Flutter - Ebook', price: 14.99),
                  ]))
        ],
        child: Navigator(
            initialRoute: 'story_nav',
            onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
                builder: (_) => ProviderExampleListScreen(),
                settings: settings)));
