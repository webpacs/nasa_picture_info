import 'package:nasa_picture_info/app/modules/planet/pages/planet_detail/planet_detail_page.dart';
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
        Router('/', child: (_, args) => PlanetPage()),
        Router('/detail/:planet',
            child: (_, args) => PlanetDetailPage(
                  args.params['planet'],
                )),
      ];

  static Inject get to => Inject<PlanetModule>.of();
}
