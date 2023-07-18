import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:samples_design_course/src/design_course_app_theme.dart';

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

class CourseAlertDialog extends CustomAlertDialog {
  CourseAlertDialog()
      : super(
            content:
                'Mauris sem neque, lobortis eget faucibus non, semper ut mi. Quisque '
                'laoreet lacus nibh, sit amet commodo ipsum feugiat in. Pellentesque'
                ' id diam sed orci dapibus ornare vitae id diam. Nam sollicitudin '
                'consectetur nibh, eget cursus massa porta sed. Sed malesuada fringilla'
                ' massa, vitae tempus augue placerat nec. Mauris id velit blandit, '
                'ullamcorper ipsum id, molestie nisi. Suspendisse potenti. Vivamus '
                'ut diam in dui dictum maximus at et erat. Sed viverra erat sed '
                'sapien sollicitudin tincidunt. Morbi molestie erat faucibus dui '
                'suscipit finibus. Nullam ultrices, justo vitae malesuada tincidunt,'
                ' tellus orci dictum nisl, porta cursus lorem eros non velit.'
                ' Etiam ullamcorper eget mi in vestibulum.',
            title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            button1OnPressed: () => {},
            button1Text: 'Accept',
            button2Text: 'Deny',
            button2OnPressed: () => {},
            buttonTextColor: DesignCourseAppTheme.nearlyBlue);
}
