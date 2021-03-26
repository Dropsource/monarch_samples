import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../localization.dart';
import '../../platform_utils.dart';
import '../../provider/read_from_provider_screen.dart';

class TranslationDelegateExampleScreen extends StatelessWidget {
  static String tag = 'translation-delegate-example-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => ReadFromProviderScreen(),
        settings: RouteSettings(name: tag),
      );

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(translations.text('translations_example.title')),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(translations.text('translations_example.headline')),
              Text(translations.text('translations_example.subheader')),
              SizedBox(
                height: 16,
              ),
              Text(translations.text('translations_example.content')),
            ]
                .map((widget) => Padding(
                      padding: EdgeInsets.all(8),
                      child: widget,
                    ))
                .toList(),
          ),
        ));
  }
}
