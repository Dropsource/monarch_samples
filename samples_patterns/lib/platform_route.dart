import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<T> platformRoute<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  required RouteSettings settings,
  bool fullscreenDialog = false,
}) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return CupertinoPageRoute<T>(
      builder: builder,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  } else {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
