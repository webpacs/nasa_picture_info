import 'package:mobx/mobx.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
part 'home_detail_controller.g.dart';

class HomeDetailController = _HomeDetailControllerBase
    with _$HomeDetailController;

abstract class _HomeDetailControllerBase with Store {
  @observable
  Nasa selectedNasaItem;
}
