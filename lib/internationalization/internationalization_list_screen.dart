import 'package:flutter/material.dart';

import '../content_list/content_list_screen.dart';
import '../platform_utils.dart';
import 'translation_delegate/translation_delegate_screen.dart';

class InterrnationalizationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentListScreen(
      title: 'Internationalization examples',
      categories: [
        Category(
            label: 'Translation Delegate',
            onClick: () {
              Navigator.of(context)
                  .push(TranslationDelegateExampleScreen.route(context));
            }),
      ],
    );
  }

  static String tag = 'internationalization-list-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => InterrnationalizationListScreen(),
        settings: RouteSettings(name: tag),
      );
}
