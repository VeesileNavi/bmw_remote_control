
import 'package:car_app/models/car_model.dart';
import 'package:car_app/pages/car_overview_page/car_overview.dart';
import 'package:car_app/pages/car_start_page/widgets/animated_title.dart';
import 'package:car_app/pages/car_start_page/widgets/lock_button.dart';
import 'package:car_app/utils/app_colors.dart';
import 'package:car_app/utils/global_constants.dart';
import 'package:car_app/utils/shimmer_text.dart';
import 'package:car_app/utils/vertical_page_route.dart';
import 'package:car_app/widgets/car_widgets/car_side_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

class CarStart extends StatefulWidget {
  const CarStart({
    super.key,
    this.onLockButtonTap,
  });

  final Function()? onLockButtonTap;

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
      backgroundColor: AppColors.backgroundColor,
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
                        builder: (context, double opacity, child) => Hero(
                          tag: GlobalConstants.carOverviewHero,
                          child: CarSideWidget(
                            carModel: carModel,
                            opacity: opacity,
                          ),
                        ),
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 164,
                        child: LockButton(
                            isEngineOn: isEngineOn,
                            onLongPress: () => welcomeBlink(carModel: carModel),
                            onTap: () => isEngineOn?Navigator.of(context).push(
                                PageRouteTransitions().verticalTransitionRoute(
                                    page: CarOverview())):null)),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 32,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isEngineOn
                            ? const ShimmerText(
                                text: 'Tap on lock button',
                                textAlign: TextAlign.center,
                                fontSize: 24,
                              )
                            : null,
                      ),
                    )
                  ],
                ),
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
