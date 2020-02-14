import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();

  runApp(ModularApp(module: AppModule(sharedPreferences)));
}
