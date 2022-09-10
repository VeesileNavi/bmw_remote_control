import 'package:car_app/car/car_side_widget.dart';
import 'package:car_app/models/car_model.dart';
import 'package:car_app/pages/car_start_page/widgets/animated_title.dart';
import 'package:car_app/pages/car_start_page/widgets/lock_button.dart';
import 'package:car_app/utils/global_constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

class CarStart extends StatefulWidget {
  const CarStart({
    Key? key,
  }) : super(key: key);

  @override
  State<CarStart> createState() => _CarStartState();
}

class _CarStartState extends State<CarStart> {
  late CarModel carModel;
  late bool isEngineOn;
  late double backgroundGradientStop;
  late double carDarkMaskOpacity;
  late bool engineOn;

  @override
  void initState() {
    super.initState();
    carModel = CarModel(
      carMainAsset: GlobalConstants.carFrontMainAsset,
      carHeadlightAsset: GlobalConstants.frontHeadlights,
      carTurnSignalAsset: GlobalConstants.frontTurnSignal,
    );
    isEngineOn = false;
    carDarkMaskOpacity = 1;
    backgroundGradientStop = 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0.4, end: backgroundGradientStop),
        builder: (context, double stopPoint, widget) => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [
                stopPoint,
                0.7,
              ],
                  colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0)
              ])),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 120,
                  child: AnimatedTitle(
                      isEngineOn: isEngineOn,
                      lockedTitle: 'Long press to start engine',
                      unlockedTitle: 'Welcome Back!'),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Transform.scale(
                      scaleX: 1.5,
                      scaleY: 1.5,
                      alignment: Alignment.centerLeft,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 1, end: carDarkMaskOpacity),
                        duration: const Duration(milliseconds: 300),
                        builder: (context, double opacity, child) =>
                            CarSideWidget(
                          carModel: carModel,
                          opacity: opacity,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 164,
                    child: LockButton(
                      isEngineOn: isEngineOn,
                      onLongPress: () => welcomeBlink(carModel: carModel),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> welcomeBlink({
    required CarModel carModel,
  }) async {
    for (int i = 0; i <= 4; i++) {
      await Future.delayed(
          const Duration(milliseconds: 100),
          () => setState(() {
                carModel.isHeadlightOn = !carModel.isHeadlightOn;
                carModel.isTurnSignalOn = !carModel.isTurnSignalOn;
              }));
    }

    HapticFeedback.heavyImpact();

    setState(() {
      isEngineOn = !isEngineOn;

      carDarkMaskOpacity == 0.4
          ? carDarkMaskOpacity = 1
          : carDarkMaskOpacity = 0.4;

      backgroundGradientStop == 0.1
          ? backgroundGradientStop = 0.4
          : backgroundGradientStop = 0.1;
    });
  }
}
