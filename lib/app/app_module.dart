import 'package:nasa_picture_info/app/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/app_widget.dart';
import 'package:nasa_picture_info/app/modules/home/home_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends MainModule {
  final SharedPreferences sharedPreferences;
  final Dio dio;

  AppModule(this.sharedPreferences, this.dio);

  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => sharedPreferences),
        Bind((i) => dio),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
