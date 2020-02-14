import 'package:nasa_picture_info/app/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/app_widget.dart';
import 'package:nasa_picture_info/app/modules/home/home_module.dart';
import 'package:nasa_picture_info/app/modules/planet/planet_module.dart';
import 'package:nasa_picture_info/app/pages/splash/splash_page.dart';
import 'package:nasa_picture_info/app/shared/constants/app_constants.dart';
import 'package:nasa_picture_info/app/shared/repositories/nasa_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends MainModule {
  final SharedPreferences sharedPreferences;
  final Dio dio = Dio(BaseOptions(
      baseUrl: BASE_URL, connectTimeout: 5000, receiveTimeout: 3000));

  AppModule(this.sharedPreferences);

  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => sharedPreferences),
        Bind((i) => dio),
        Bind((i) => NasaRepository(i.get<Dio>(), i.get<SharedPreferences>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/planets', module: PlanetModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
