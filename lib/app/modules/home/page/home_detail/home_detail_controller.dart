import 'package:mobx/mobx.dart';
part 'home_detail_controller.g.dart';

class HomeDetailController = _HomeDetailControllerBase
    with _$HomeDetailController;

abstract class _HomeDetailControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
