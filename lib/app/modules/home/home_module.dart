import 'package:dio/dio.dart';
import 'package:nasa_picture_info/app/modules/home/home_controller.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_picture_info/app/modules/home/home_page.dart';
import 'package:nasa_picture_info/app/shared/repositories/nasa_repository.dart';

import '../../app_module.dart';

class HomeModule extends ChildModule {
  final Dio dio = AppModule.to.get<Dio>();
  final NasaRepository nasaRepository = AppModule.to.get<NasaRepository>();

  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(dio, nasaRepository)),
        Bind((i) => HomeDetailController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        /*
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
        */
        Router(
          '/detail',
          child: (_, args) => HomeDetail(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
