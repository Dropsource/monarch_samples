import 'package:flutter/widgets.dart';

Widget too_big() => Center(
        child: Column(children: [
      SizedBox(
        width: 200,
        child: Image.asset('assets/monarch_m.png'),
      ),
      Text('Click "Highlight Oversized Images".'),
      Text('Image should flip.')
    ]));

Widget just_right() => Center(
        child: Column(children: [
      SizedBox(
        width: 200,
        child: Image.asset('assets/monarch_m_200.png'),
      ),
      Text('Click "Highlight Oversized Images".'),
      Text('Image is the right size, it should not flip.')
    ]));
