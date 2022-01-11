import 'package:flutter/material.dart';

class ProgressButton extends TextButton {
  ProgressButton(
    String text, {
    onPressed,
    Color? color,
    Key? key,
    Color? progressColor,
    double textSize = 16,
    bool loading = false,
  }) : super(
          key: key,
          onPressed: loading ? null : onPressed,
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.teal,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          child: loading
              ? Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)),
                  ))
              : Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.normal,
                  ),
                ),
        );
}
