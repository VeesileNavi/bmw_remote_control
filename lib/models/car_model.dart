class CarModel {

  CarModel({
    required this.carMainAsset,
    required this.carHeadlightAsset,
    required this.carTurnSignalAsset,
    this.isHeadlightOn = false,
    this.isTurnSignalOn = false,
    this.isDarkened = false,
  });

  bool isHeadlightOn;
  bool isTurnSignalOn;
  String carMainAsset;
  String carHeadlightAsset;
  String carTurnSignalAsset;
  bool isDarkened;
}
