import 'package:car_app/utils/global_constants.dart';

abstract class Car {
  factory Car.fromSide({required CarSides side}) {
    switch (side) {
      case CarSides.front:
        return CarFrontModel();
      case CarSides.back:
        return CarFrontModel();
      case CarSides.side:
        return CarFrontModel();
    }
  }
}

class BaseCar implements Car {
  BaseCar({
    required this.carMainAsset,
    required this.carHeadlightAsset,
    required this.carTurnSignalAsset,
    this.isHeadlightOn = false,
    this.isTurnSignalOn = false,
    this.isDarkened = false,
  });

  bool isHeadlightOn;
  bool isTurnSignalOn;
  final String carMainAsset;
  final String carHeadlightAsset;
  final String carTurnSignalAsset;
  bool isDarkened;
}

class CarFrontModel extends BaseCar {
  CarFrontModel({
    super.carMainAsset = GlobalConstants.carFrontMainAsset,
    super.carHeadlightAsset = GlobalConstants.frontHeadlights,
    super.carTurnSignalAsset = GlobalConstants.frontTurnSignal,
    super.isDarkened = false,
    super.isHeadlightOn = false,
    super.isTurnSignalOn = false,
  });

  set toggleHeadlight(bool isHeadlightOn) =>
      super.isHeadlightOn = isHeadlightOn;

  set toggleTurnSignal(bool isTurnSignalOn) =>
      super.isTurnSignalOn = isTurnSignalOn;
}

enum CarSides { front, back, side }
