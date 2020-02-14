import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:nasa_picture_info/app/shared/constants/app_constants.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NasaRepository extends Disposable {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  NasaRepository(
    this.dio,
    this.sharedPreferences,
  );

  Future<List<Nasa>> fetchNasaPlanetaryData() async {
    try {
      final response =
          await dio.get('/planetary/apod?api_key=$API_KEY&count=10');

      var value = Nasa.fromJsonList(response.data);

      sharedPreferences.setStringList("HomeRepository-fetchPost",
          value.map((item) => item.toJsonString()).toList());

      return value;
    } catch (e) {
      var value = sharedPreferences.getStringList("HomeRepository-fetchPost");
      return value.map((item) => Nasa.fromJsonString(item)).toList();
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
