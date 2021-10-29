import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('title').tr();
  }
}

class UpperLocalizedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var upper = 'title'.tr().toUpperCase();
    return Text(upper);
  }
}

class LocalizedQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('question').tr();
  }
}
