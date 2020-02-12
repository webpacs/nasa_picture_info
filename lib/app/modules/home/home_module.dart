import 'package:nasa_picture_info/app/modules/home/home_controller.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail_controller.dart';
import 'package:nasa_picture_info/app/modules/home/repositories/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_picture_info/app/modules/home/home_page.dart';

import '../../app_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeRepository(AppModule.to.get(), AppModule.to.get())),
        Bind((i) => HomeController(AppModule.to.get(), i.get())),
        Bind((i) => HomeDetailController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router(
          '/details/:img/:date/:title/:ex',
          child: (_, args) => HomeDetail(
            img: args.params['img'],
            date: args.params['date'],
            title: args.params['title'],
            explanation: args.params['ex'],
          ),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
