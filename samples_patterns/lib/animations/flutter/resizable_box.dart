import 'package:flutter/material.dart';
import 'package:monarch_samples_patterns/themes/custom_theme.dart';

class ResizableBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResizableBoxState();
}

class _ResizableBoxState extends State<ResizableBox> {
  var _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          width: _bigger ? 500 : 100,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOutQuint,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [monarchPrimaryColor, Colors.transparent],
                  stops: [0, _bigger ? 1.0 : 0])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/monarch_m.png'),
          ),
        ),
        TextButton(
          onPressed: () => setState(() {
            _bigger = !_bigger;
          }),
          child: Text(
            'Resize me!',
            style: TextStyle(color: monarchAccentColor),
          ),
        ),
      ],
    );
  }
}
