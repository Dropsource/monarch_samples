import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _CustomAlertDialog extends StatelessWidget {
  _CustomAlertDialog(
      {required this.title,
      required this.content,
      this.positiveText,
      this.positiveOnPressed,
      this.negativeText,
      this.negativeOnPressed,
      this.titleColor,
      this.buttonTextColor = Colors.deepOrangeAccent,
      this.contentColor});

  final String title;
  final Widget content;
  final String? positiveText;
  final VoidCallback? positiveOnPressed;
  final String? negativeText;
  final VoidCallback? negativeOnPressed;
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
        if (negativeText != null) ...[
          TextButton(
            key: Key('custom-dialog-negative-button-key'),
            onPressed: negativeOnPressed,
            child: Text(negativeText!,
                style: TextStyle(
                  color: buttonTextColor,
                )),
          )
        ],
        if (positiveText != null) ...[
          TextButton(
            key: Key('custom-dialog-positive-button-key'),
            onPressed: positiveOnPressed,
            child: Text(positiveText!,
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
      String? positiveText,
      VoidCallback? positiveOnPressed,
      String? negativeText,
      VoidCallback? negativeOnPressed,
      Color? contentColor,
      Color? buttonTextColor})
      : super(
            title: title,
            content: content != null
                ? Text(content,
                    style: TextStyle(fontSize: 13, color: contentColor))
                : SizedBox.shrink(),
            positiveText: positiveText,
            positiveOnPressed: positiveOnPressed,
            negativeText: negativeText,
            negativeOnPressed: negativeOnPressed,
            buttonTextColor: buttonTextColor);
}
