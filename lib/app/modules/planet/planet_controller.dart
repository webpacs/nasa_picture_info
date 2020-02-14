import 'package:mobx/mobx.dart';

part 'planet_controller.g.dart';

class PlanetController = _PlanetBase with _$PlanetController;

abstract class _PlanetBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
