import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color.fromRGBO(47, 184, 255, 1), Color.fromRGBO(158, 236, 217, 1)],
  );
  static const LinearGradient disabledGradient =
      LinearGradient(colors: [Colors.grey, Colors.black]);
}
