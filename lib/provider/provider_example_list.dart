import 'package:flutter/cupertino.dart';
import 'package:monarch_samples/content_list/content_list_screen.dart';
import 'package:monarch_samples/provider/read_from_provider_screen.dart';

import '../platform_utils.dart';
import 'change_notifier_screen.dart';

class ProviderExampleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentListScreen(
      title: 'Provider examples',
      categories: [
        Category(
            label: 'Read from provider',
            onClick: () {
              Navigator.of(context).push(ReadFromProviderScreen.route(context));
            }),
        Category(
            label: 'Change Notifier',
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
