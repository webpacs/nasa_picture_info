import 'package:nasa_picture_info/app/shared/models/nasa_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository extends Disposable {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  HomeRepository(
    this.dio,
    this.sharedPreferences,
  );
  String apiKey = 'Fty80HkuF2LSDWPVutz34KJ4MXh9JWWKo8degZO4';

  Future<List<NasaApi>> fetchPost() async {
    try {
      final response = await dio
          .get('https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=10');

      var value = NasaApi.fromJsonList(response.data);

      sharedPreferences.setStringList("HomeRepository-fetchPost",
          value.map((item) => item.toJsonString()).toList());

      return value;
    } catch (e) {
      var value = sharedPreferences.getStringList("HomeRepository-fetchPost");
      return value.map((item) => NasaApi.fromJsonString(item)).toList();
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
