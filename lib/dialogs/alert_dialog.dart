import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _CustomAlertDialog extends StatelessWidget {
  _CustomAlertDialog(
      {required this.title,
      required this.content,
      this.button1Text,
      this.button1OnPressed,
      this.button2Text,
      this.button2OnPressed,
      this.titleColor,
      this.buttonTextColor = Colors.deepOrangeAccent,
      this.contentColor});

  final String title;
  final Widget content;
  final String? button1Text;
  final VoidCallback? button1OnPressed;
  final String? button2Text;
  final VoidCallback? button2OnPressed;
  final Color? titleColor;
  final Color? buttonTextColor;
  final Color? contentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      titlePadding: const EdgeInsets.all(15.0),
      contentPadding: const EdgeInsets.all(15.0),
      backgroundColor: theme.dialogBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
      content: content,
      actions: <Widget>[
        if (button2Text != null) ...[
          TextButton(
            key: Key('custom-dialog-negative-button-key'),
            onPressed: button2OnPressed,
            child: Text(button2Text!,
                style: TextStyle(
                  color: buttonTextColor,
                )),
          )
        ],
        if (button1Text != null) ...[
          TextButton(
            key: Key('custom-dialog-positive-button-key'),
            onPressed: button1OnPressed,
            child: Text(button1Text!,
                style: TextStyle(
                  color: buttonTextColor,
                )),
          )
        ]
      ],
    );
  }
}

class CustomAlertDialog extends _CustomAlertDialog {
  CustomAlertDialog(
      {required String title,
      String? content,
      String? button1Text,
      VoidCallback? button1OnPressed,
      String? button2Text,
      VoidCallback? button2OnPressed,
      Color? contentColor,
      Color? buttonTextColor})
      : super(
            title: title,
            content: content != null
                ? Text(content,
                    style: TextStyle(fontSize: 13, color: contentColor))
                : SizedBox.shrink(),
            button1Text: button1Text,
            button1OnPressed: button1OnPressed,
            button2Text: button2Text,
            button2OnPressed: button2OnPressed,
            buttonTextColor: buttonTextColor);
}
