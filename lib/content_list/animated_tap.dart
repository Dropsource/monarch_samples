import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedTap extends StatefulWidget {
  AnimatedTap({
    Key? key,
    required this.child,
    required this.onPressed,
    this.start = 0.0,
    this.end = 0.04,
    this.duration = const Duration(milliseconds: 70),
    this.giveHapticFeedback = true,
    this.behavior = HitTestBehavior.opaque,
  }) : super(key: key);
  final Widget child;
  final Function(BuildContext) onPressed;
  final double start, end;
  final Duration duration;
  final bool giveHapticFeedback;
  final HitTestBehavior behavior;
  @override
  _AnimatedTapState createState() => _AnimatedTapState();
}

class _AnimatedTapState extends State<AnimatedTap> {
  double _end = 0;
  bool _cancelled = false;
  bool _released = false;

  bool get hasHandler => widget.onPressed != null;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _released = false;
      _cancelled = false;
      _end = widget.end;
    });
    if (widget.giveHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: widget.start, end: _end),
      duration: widget.duration,
      builder: (BuildContext context, double size, Widget? child) {
        double _transformScale = 1 - size;

        return GestureDetector(
          behavior: widget.behavior,
          onTapDown: hasHandler ? _onTapDown : null,
          onTapCancel: hasHandler
              ? () => setState(() {
                    _cancelled = true;
                    _released = true;
                    _end = 0;
                  })
              : null,
          onTapUp: hasHandler
              ? (_) => setState(() {
                    _released = true;
                    _end = size == widget.end ? 0 : _end;
                  })
              : null,
          child: Transform.scale(
            scale: _transformScale,
            child: widget.child,
          ),
        );
      },
      child: widget.child,
      onEnd: () {
        // Animation is done and was not cancelled
        if (_end == 0 && !_cancelled) {
          if (widget.onPressed != null) {
            widget.onPressed(context);
          }
        } else if (_end == widget.end && _released) {
          setState(() => _end = 0);
        }
      },
    );
  }
}
