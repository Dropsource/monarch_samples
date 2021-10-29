import 'package:flutter/cupertino.dart';
import 'package:monarch_samples_patterns/bloc/list_complex/list_complex_screen.dart';
import 'package:monarch_samples_patterns/content_list/content_list_screen.dart';

import '../platform_route.dart';
import 'bloc_counter/bloc_counter_screen.dart';

class BlocExampleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentListScreen(
      title: 'Bloc examples',
      categories: [
        Category(
            label: 'Bloc Counter',
            onClick: () {
              Navigator.of(context).push(BlocCounterScreen.route(context));
            }),
        Category(
            label: 'Bloc Complex List',
            onClick: () {
              Navigator.of(context).push(ListComplexScreen.route(context));
            }),
      ],
    );
  }

  static String tag = 'bloc-complex-list-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => BlocExampleListScreen(),
        settings: RouteSettings(name: tag),
      );
}
