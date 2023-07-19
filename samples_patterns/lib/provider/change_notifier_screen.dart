import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shopping_cart_change_notifier.dart';
import '../platform_route.dart';

class ChangeNotifierScreen extends StatelessWidget {
  static String tag = 'change-notification-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => ChangeNotifierScreen(),
        settings: RouteSettings(name: tag),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Using Change Notifier Provider'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Consumer<ShoppingCartChangeNotifier>(
              builder: (context, cart, _) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cart.items
                      .map((product) => Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(product.name),
                                ),
                                Text(product.formattedPrice)
                              ],
                            ),
                          ))
                      .cast<Widget>()
                      .toList()
                    ..add(Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Expanded(child: Text('Total order value: ')),
                          Text(cart.totalPrice)
                        ],
                      ),
                    )))),
        ));
  }
}
