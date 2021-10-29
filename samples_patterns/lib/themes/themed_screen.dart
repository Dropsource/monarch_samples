import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../platform_route.dart';
import 'custom_theme.dart';

class ThemedScreen extends StatelessWidget {
  static String tag = 'themed-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => ThemedScreen(),
        settings: RouteSettings(name: tag),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Themed screen',
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('This is headline 5',
                  style: Theme.of(context).textTheme.headline5),
              Text('Here is headline 6',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 16,
              ),
              Text('This is text body 1',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('And this is text body 2',
                  style: Theme.of(context).textTheme.bodyText2),
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

class MonarchThemedScreen extends StatelessWidget {
  static String tag = 'monarch-themed-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => MonarchThemedScreen(),
        settings: RouteSettings(name: tag),
      );

  @override
  Widget build(BuildContext context) {
    return Theme(data: monarchTheme, child: ThemedScreen());
  }
}
