import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_picture_info/app/shared/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();
  final Dio dio = Dio(BaseOptions(
      baseUrl: BASE_URL, connectTimeout: 5000, receiveTimeout: 3000));

  runApp(ModularApp(module: AppModule(sharedPreferences, dio)));
}
