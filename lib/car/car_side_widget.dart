import 'package:car_app/models/car_model.dart';
import 'package:flutter/material.dart';

class CarSideWidget extends StatelessWidget{
   const CarSideWidget({Key? key, required this.carModel, this.opacity = 0,}) : super(key: key);

   final CarModel carModel;
   final double opacity;


  @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          ColorFiltered(colorFilter: ColorFilter.mode(Colors.black.withOpacity(opacity), BlendMode.srcATop),
          child: Image.asset(carModel.carMainAsset)),
          Visibility(visible: carModel.isHeadlightOn,child: Image.asset(carModel.carHeadlightAsset,)),
          Visibility(visible: carModel.isTurnSignalOn,child: Image.asset(carModel.carTurnSignalAsset,)),
        ],
      );
    }

}
