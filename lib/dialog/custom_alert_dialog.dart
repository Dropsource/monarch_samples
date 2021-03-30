import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../keys.dart';

class _CustomAlertDialog extends StatelessWidget {
  _CustomAlertDialog(
      {this.title,
      this.content,
      this.positiveText = 'Yes',
      this.posititiveOnPressed,
      this.negativeText = 'No',
      this.negativeOnPressed,
      this.textColor,
      this.buttonTextColor,
      this.contentColor});

  final String title;
  final Widget content;
  final String positiveText;
  final VoidCallback posititiveOnPressed;
  final String negativeText;
  final VoidCallback negativeOnPressed;
  final Color textColor;
  final Color buttonTextColor;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(15.0),
      contentPadding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text(title,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w100, fontSize: 15)),
      content: content,
      actions: <Widget>[
        if (negativeText != null) ...[
          TextButton(
            child: Text(negativeText,
                style: TextStyle(
                  color: buttonTextColor,
                )),
            key: Key(Keys.customDialogNegativeButtonKey),
            onPressed: negativeOnPressed,
          )
        ],
        if (positiveText != null) ...[
          TextButton(
            child: Text(positiveText,
                style: TextStyle(
                  color: buttonTextColor,
                )),
            key: Key(Keys.customDialogNegativeButtonKey),
            onPressed: posititiveOnPressed,
          )
        ]
      ],
    );
  }
}

class CustomAlertDialog extends _CustomAlertDialog {
  CustomAlertDialog(
      {String title,
      String content,
      String positiveText,
      VoidCallback posititiveOnPressed,
      String negativeText,
      VoidCallback negativeOnPressed,
      Color contentColor,
      Color buttonTextColor})
      : super(
            title: title,
            content: content != null
                ? Text(
                    content,
                    style: TextStyle(fontSize: 13, color: contentColor),
                  )
                : null,
            positiveText: positiveText,
            posititiveOnPressed: posititiveOnPressed,
            negativeText: negativeText,
            negativeOnPressed: negativeOnPressed,
            buttonTextColor: buttonTextColor);
}
