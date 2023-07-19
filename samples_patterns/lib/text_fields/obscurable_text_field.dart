import 'package:flutter/material.dart';

import 'single_value_text_field.dart';

class ObscurableTextfield extends StatefulWidget {
  final String? value;
  final bool obscureText;

  ObscurableTextfield({Key? key, this.value, this.obscureText = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ObscurableTextFieldState();
}

class _ObscurableTextFieldState extends State<ObscurableTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: SingleValueTextfield(
          key: widget.key,
          value: widget.value,
          obscureText: _obscureText,
          suffixIcon: _buildToggleableIconButton(context),
        ));
  }

  Widget _buildToggleableIconButton(BuildContext context) => IconButton(
        icon: Icon(
          _obscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
}
