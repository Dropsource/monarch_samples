import 'package:flutter/cupertino.dart';

import '../content_list/content_list_screen.dart';
import 'provider_screen.dart';
import '../platform_route.dart';
import 'change_notifier_screen.dart';

class ProviderExampleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentListScreen(
      title: 'Provider examples',
      categories: [
        Category(
            label: 'Using Provider',
            onClick: () {
              Navigator.of(context).push(ProviderScreen.route(context));
            }),
        Category(
            label: 'Using Change Notifier Provider',
            onClick: () {
              Navigator.of(context).push(ChangeNotifierScreen.route(context));
            })
      ],
    );
  }

  static String tag = 'provider-example-list-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => ProviderExampleListScreen(),
        settings: RouteSettings(name: tag),
      );
}
