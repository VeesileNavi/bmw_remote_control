import 'package:car_app/utils/app_style_text.dart';
import 'package:car_app/utils/global_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LockButton extends StatelessWidget {
  LockButton({
    Key? key,
    this.isEngineOn = false,
    this.onLongPress, this.onTap,
  }) : super(key: key);
  final bool isEngineOn;
  final Function()? onLongPress;
  final Function()? onTap;

  final slideTransitionTween = Tween<Offset>(
      begin: const Offset(5, 0),
      end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) => Neumorphic(
    duration: const Duration(milliseconds: 300),
        style: NeumorphicStyle(
            depth: isEngineOn ? -3 : 3,
            lightSource: LightSource.bottomLeft,
            color: Colors.transparent,
            shadowDarkColorEmboss: Colors.black,
            shadowDarkColor: Colors.black,
            shadowLightColor: Colors.white.withOpacity(0.4),
            boxShape: NeumorphicBoxShape.roundRect(
                const BorderRadius.all(Radius.circular(48)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 80,
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) {
                        return SlideTransition(
                          position: slideTransitionTween.animate(animation),
                          child: child,
                        );
                      },
                      child: isEngineOn
                          ? Text(
                              'Unlock',
                              style: AppStyleText.descriptionTextStyle,
                            )

                          ///Container needs for correct slide transition's working
                          : Container(
                              child: Text(
                                'Lock',
                                style: AppStyleText.descriptionTextStyle,
                              ),
                            )),
                ),
              ),
              GestureDetector(
                onLongPress: onLongPress,
                onTap: onTap,
                child: Neumorphic(
                  duration: const Duration(milliseconds: 100),
                  style: NeumorphicStyle(
                      depth: !isEngineOn ? -3 : 0,
                      lightSource: LightSource.bottomLeft,
                      color: Colors.transparent,
                      shadowDarkColorEmboss: Colors.black,
                      shadowDarkColor: Colors.black,
                      shadowLightColor: Colors.white.withOpacity(0.4),
                      boxShape: const NeumorphicBoxShape.circle()),
                  child: SizedBox(
                    height: 44,
                    width: 44,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        isEngineOn
                            ? CupertinoIcons.lock_open
                            : CupertinoIcons.lock,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
