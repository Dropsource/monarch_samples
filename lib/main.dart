import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:monarch_samples/provider/shopping_cart_change_notifier.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc_example_list.dart';
import 'bloc/list_complex/list_cubit.dart';
import 'bloc/list_complex/repository.dart';
import 'content_list/content_list_screen.dart';
import 'internationalization/localizations.dart';
import 'provider/current_date.dart';
import 'provider/provider_example_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CurrentDate>(
          create: (_) => CurrentDate(
              currentDateFn: () => DateFormat.yMMMEd().format(DateTime.now())),
        ),
        ChangeNotifierProvider<ShoppingCartChangeNotifier>(
            create: (_) => ShoppingCartChangeNotifier.empty())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ListCubit(repository: RepositoryImpl())..fetchList(),
          ),
        ],
        child: MaterialApp(
            title: 'Monarch Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            navigatorKey: GlobalKey<NavigatorState>(),
            locale: localizationDelegate.defaultLocale,
            supportedLocales: localizationDelegate.supportedLocales,
            localizationsDelegates: [
              localizationDelegate,
              ...GlobalMaterialLocalizations.delegates,
            ],
            home: Main()),
      ),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentListScreen(
      title: 'Monarch Demo - ${Navigator.of(context).widget.initialRoute!}',
      categories: [
        Category(
            label: 'Provider',
            onClick: () => Navigator.of(context)
                .push(ProviderExampleListScreen.route(context))),
        Category(
            label: 'Bloc',
            onClick: () => Navigator.of(context)
                .push(BlocExampleListScreen.route(context))),
        Category(label: 'Internationalization', onClick: () {}),
        Category(label: 'Themes', onClick: () {}),
      ],
    );
  }
}
