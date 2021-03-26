import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'localizations.dart';

class LocalizedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final localizations = SampleLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(localizations.text('sample.title')),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(localizations.text('sample.headline')),
              Text(localizations.text('sample.subheader')),
              SizedBox(
                height: 16,
              ),
              Text(localizations.text('sample.content')),
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
