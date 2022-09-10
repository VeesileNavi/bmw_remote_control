import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:car_app/utils/app_style_text.dart';
import 'package:car_app/utils/shimmer_text.dart';
import 'package:flutter/material.dart';

class AnimatedTitle extends StatelessWidget {
  const AnimatedTitle({super.key, this.isEngineOn = false, required this.lockedTitle, required this.unlockedTitle,});

  final bool isEngineOn;
  final String lockedTitle;
  final String unlockedTitle;


  @override
  Widget build(BuildContext context) =>
      AnimatedSwitcher(
        transitionBuilder: (child, animation) =>
            FadeTransition(
              opacity: animation,
              child: child,
            ),
        duration: const Duration(milliseconds: 300),
        child: isEngineOn
            ? AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(
              'Welcome back!',
              textAlign: TextAlign.center,
              textStyle: AppStyleText.titleTextStyle,
            ),
          ],
        )
            : const ShimmerText(
            text: 'Long press to start engine',
            textAlign: TextAlign.center),
      );

}