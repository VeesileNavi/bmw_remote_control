import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundedNeumorphicWidget extends StatelessWidget {
  const RoundedNeumorphicWidget(
      {Key? key, this.depth = 0, required this.child, this.borderRadius = 48})
      : super(key: key);
  final double depth;
  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      duration: const Duration(milliseconds: 500),
      style: NeumorphicStyle(
          depth: depth,
          lightSource: LightSource.bottomLeft,
          color: Colors.transparent,
          shadowDarkColorEmboss: Colors.black,
          shadowDarkColor: Colors.white.withOpacity(0.35),
          shadowLightColor: Colors.black,
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(borderRadius)))),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: child),
    );
  }
}
