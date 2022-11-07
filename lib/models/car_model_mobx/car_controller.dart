import 'package:car_app/models/abstract_car.dart';
import 'package:mobx/mobx.dart';

part 'car_controller.g.dart';

class CarController = _CarController with _$CarController;

abstract class _CarController with Store {
  _CarController(this.carModel);

  @observable
  Car carModel = Car.fromSide(side: CarSides.front);

  @action
  void setCarSide(CarSides side){
    carModel = Car.fromSide(side: side);
  }
}
