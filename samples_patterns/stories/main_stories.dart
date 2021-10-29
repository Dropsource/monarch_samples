import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monarch_samples/bloc/list_complex/list_cubit.dart';
import 'package:monarch_samples/bloc/list_complex/repository.dart';
import 'package:monarch_samples/main.dart';
import 'package:monarch_samples/provider/current_date.dart';
import 'package:monarch_samples/provider/shopping_cart_change_notifier.dart';
import 'package:provider/provider.dart';

Widget main_multi_providers_navigation() => MultiProvider(
        providers: [
          Provider<CurrentDate>(
            create: (_) => CurrentDate(
                currentDateFn: () =>
                    DateFormat.yMMMEd().format(DateTime.now())),
          ),
          ChangeNotifierProvider<ShoppingCartChangeNotifier>(
              create: (_) => ShoppingCartChangeNotifier.empty())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    ListCubit(repository: RepositoryImpl())..fetchList(),
              ),
            ],
            child: Navigator(
                initialRoute: 'story_nav',
                onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
                    builder: (_) => Main(), settings: settings))));
