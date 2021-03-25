import 'package:flutter/material.dart';

const BoxDecoration shadowDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(15)),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Color(0x3300001A),
      blurRadius: 6,
      offset: Offset(0, 5), // changes position of shadow
    ),
  ],
);
