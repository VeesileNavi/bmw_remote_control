import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  const GradientMask(
      {
        this.enabled = true,
        required this.child,
        required this.gradient,
      });

  final Widget child;
  final Gradient gradient;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => enabled?gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      )
          :const LinearGradient(colors: [Colors.transparent, Colors.transparent,]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}

