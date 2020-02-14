import 'package:nasa_picture_info/app/modules/planet/planet_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_picture_info/app/modules/planet/planet_page.dart';

class PlanetModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PlanetController()),
      ];

  @override
  List<Router> get routers => [
        Router('/detail', child: (_, args) => PlanetPage()),
      ];

  static Inject get to => Inject<PlanetModule>.of();
}
