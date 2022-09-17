import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CircleNeumorphicWidget extends StatelessWidget {
  const CircleNeumorphicWidget({Key? key, this.depth = 0, required this.child}) : super(key: key);
  final double depth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
   return Neumorphic(
      duration: const Duration(milliseconds: 100),
      style: NeumorphicStyle(
        border: NeumorphicBorder(
          width: 2,
              color: Colors.white.withOpacity(0.03),
        ),
          depth: depth,
          lightSource: LightSource.bottomLeft,
          color: Colors.transparent,
          shadowDarkColorEmboss: Colors.black,
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.white.withOpacity(0.4),
          boxShape: const NeumorphicBoxShape.circle()),
      child: child,
    );
  }
}
