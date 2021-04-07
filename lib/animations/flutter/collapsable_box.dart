import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monarch_samples/themes/custom_theme.dart';

class CollapsableBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollapsableBoxState();
}

class _CollapsableBoxState extends State<CollapsableBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation, _expansion;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _expansion = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _rotation = Tween(begin: 0.0, end: 3.14).animate(_controller);

    _handleAnimation();
  }

  void _handleAnimation() {
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          const Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              blurRadius: 2,
              offset: Offset(0, 3)),
        ],
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: [
              _buildLogo(),
              SizeTransition(
                sizeFactor: _expansion,
                axisAlignment: 1.0,
                child: _buildExpandableArea(context),
              )
            ],
          ),
        ),
        _buildFab(),
      ]),
    );
  }

  Positioned _buildFab() {
    return Positioned(
      bottom: 10,
      right: 4,
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) => Transform.rotate(
          angle: _rotation.value,
          child: RawMaterialButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
                _handleAnimation();
              });
            },
            constraints: BoxConstraints.tight(Size(40, 40)),
            elevation: 0.0,
            fillColor: monarchAccentColor,
            padding: EdgeInsets.all(0.0),
            shape: CircleBorder(),
            child: Icon(Icons.arrow_downward, size: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Column _buildExpandableArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Divider(
          color: monarchPrimaryColor,
        ),
        Text('Monarch is awesome',
            style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: 80,
        )
      ],
    );
  }

  SizedBox _buildLogo() {
    return SizedBox(
      width: 200,
      child: Image.asset('assets/monarch_m.png'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
