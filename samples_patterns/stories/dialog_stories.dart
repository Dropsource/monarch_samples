import 'package:flutter/material.dart';
import 'package:monarch_samples/dialogs/alert_dialog.dart';
import 'package:monarch_samples/dialogs/bottom_sheet.dart';

Widget show_bottom_sheet() => BottomSheetButton();

Widget show_modal_bottom_sheet() => ModalBottomSheetButton();

Widget scaffold_bottom_sheet() => ScaffoldBottomSheet();

Widget show_dialog() => Center(
        child: Builder(
      builder: (BuildContext context) => TextButton(
        onPressed: () => showDialog(
            context: context, builder: (_) => alert_dialog_one_button()),
        child: Text('Show Dialog'),
      ),
    ));

Widget alert_dialog_one_button() => CustomAlertDialog(
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    title: 'Integer a semper mauris.',
    // contentColor: Colors.black,
    button1OnPressed: () => {},
    button1Text: 'Let\'s go!',
    buttonTextColor: Colors.green);

Widget alert_dialog_two_buttons() => CustomAlertDialog(
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
    button1Text: 'Got it',
    button2Text: 'Nope',
    button2OnPressed: () => {},
    buttonTextColor: Colors.orange);
