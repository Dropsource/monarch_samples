import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'localized_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('es')],
      path: 'assets/translations',
      fallbackLocale: Locale('es'),
      startLocale: Locale('es'),
      // startLocale: Locale('en','US'),
      child: SampleApp()
    ),
  );
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('es'),
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocalizedTitle(),
      ),
      body: Center(
        child: LocalizedQuestion(),
      ),
    );
  }
}