import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'single_value_text_field.dart';

class ObscuredSingleValueTextfield extends StatefulWidget {
  final String? value;
  final String? hint;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool autofocus;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final bool enabled;

  ObscuredSingleValueTextfield({
    Key? key,
    this.value,
    this.hint,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.validator,
    this.autofocus = true,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = true,
    this.inputFormatters,
    this.autocorrect = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ObscuredSingleValueTextFieldState();
}

class ObscuredSingleValueTextFieldState
    extends State<ObscuredSingleValueTextfield> {
  var _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SingleValueTextfield(
      value: widget.value,
      key: widget.key,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization,
      autocorrect: widget.autocorrect,
      enabled: widget.enabled,
      hint: widget.hint,
      suffix: _buildSuffixIcon(context),
    );
  }

  Widget _buildSuffixIcon(BuildContext context) => IconButton(
        icon: Icon(
          _obscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
}
