import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'current_date.dart';
import '../platform_route.dart';

class ProviderScreen extends StatelessWidget {
  static String tag = 'read-from-provider-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => ProviderScreen(),
        settings: RouteSettings(name: tag),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Using Provider'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('I got this value from Provider.of()'),
              Text('Today is ${_getDate(context)}'),
              SizedBox(
                height: 16,
              ),
              Text('I got this value using Consumer'),
              Consumer<CurrentDate>(
                builder: (context, model, child) =>
                    Text('Today is ${model.currentDateAsString()}'),
              )
            ]
                .map((widget) => Padding(
                      padding: EdgeInsets.all(8),
                      child: widget,
                    ))
                .toList(),
          ),
        ));
  }

  String? _getDate(BuildContext context) {
    return Provider.of<CurrentDate>(context, listen: false)
        .currentDateAsString();
  }
}
