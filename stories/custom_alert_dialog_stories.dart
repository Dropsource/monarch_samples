import 'package:flutter/material.dart';
import 'package:monarch_samples/dialog/custom_alert_dialog.dart';

// ignore_for_file: non_constant_identifier_names
Widget positive_only_alert() => showAlert(
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    title: 'Integer a semper mauris.',
    contentColor: Colors.black,
    positiveAction: () => {},
    positiveText: 'Let\'s go!',
    buttonTextColor: Colors.green);

Widget positive_and_negative_alert() => showAlert(
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
    contentColor: Colors.black54,
    positiveAction: () => {},
    positiveText: 'Got it',
    negativeText: 'Nope',
    negativeAction: () => {},
    buttonTextColor: Colors.orange);

CustomAlertDialog showAlert(
        {String title,
        String content,
        Color contentColor,
        String positiveText,
        VoidCallback positiveAction,
        String negativeText,
        VoidCallback negativeAction,
        Color buttonTextColor}) =>
    CustomAlertDialog(
      title: title,
      content: content,
      contentColor: contentColor,
      positiveText: positiveText,
      posititiveOnPressed: positiveAction,
      negativeText: negativeText,
      negativeOnPressed: negativeAction,
      buttonTextColor: buttonTextColor,
    );
