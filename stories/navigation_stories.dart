import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monarch_samples/navigation/named_routes.dart';
import 'package:monarch_samples/navigation/simple_navigation.dart';

Widget simple_navigation() => Navigator(
    onGenerateRoute: (RouteSettings settings) =>
        MaterialPageRoute(builder: (_) => FirstRoute(), settings: settings));

Widget named_routes() => Navigator(
    initialRoute: '/',
    onGenerateRoute: (RouteSettings settings) {
      WidgetBuilder builder;
      switch (settings.name) {
        case '/':
          builder = (BuildContext context) => const FirstScreen();
          break;
        case '/second':
          builder = (BuildContext context) => const SecondScreen();
          break;
        default:
          throw Exception('Unexpected route: ${settings.name}');
      }
      return MaterialPageRoute(builder: builder, settings: settings);
    });
