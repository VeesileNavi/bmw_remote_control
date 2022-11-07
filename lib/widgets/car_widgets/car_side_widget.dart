import 'package:car_app/models/car_model.dart';
import 'package:flutter/material.dart';

class CarSideWidget extends StatefulWidget {
  const CarSideWidget({
    Key? key,
    required this.carModel,
    this.opacity = 0,
  }) : super(key: key);

  final CarModel carModel;
  final double opacity;

  @override
  State<CarSideWidget> createState() => _CarSideWidgetState();
}

class _CarSideWidgetState extends State<CarSideWidget> {
  late final Image carMainAsset;
  late final Image carHeadlightAsset;
  late final Image carTurnSignalAsset;

  @override
  void initState() {
    super.initState();
    carMainAsset = Image.asset(widget.carModel.carMainAsset);
    carHeadlightAsset = Image.asset(
      widget.carModel.carHeadlightAsset,
    );
    carTurnSignalAsset = Image.asset(
      widget.carModel.carTurnSignalAsset,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(carMainAsset.image, context);
    precacheImage(carHeadlightAsset.image, context);
    precacheImage(carTurnSignalAsset.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(widget.opacity), BlendMode.srcATop),
            child: carMainAsset),
        Visibility(
            visible: widget.carModel.isHeadlightOn,
            child: carHeadlightAsset),
        Visibility(
            visible: widget.carModel.isTurnSignalOn,
            child: carTurnSignalAsset),
      ],
    );
  }
}
