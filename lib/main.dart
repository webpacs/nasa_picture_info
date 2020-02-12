import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var shared = await SharedPreferences.getInstance();
  var dio = Dio();

  runApp(ModularApp(module: AppModule(shared, dio)));
}
