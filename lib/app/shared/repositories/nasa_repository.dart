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
    List<Nasa> nasaList = [];
    Response response;

    //try {
    response = await dio.get('/planetary/apod?api_key=$API_KEY&count=5');

    nasaList = Nasa.fromJsonList(response.data);
    sharedPreferences.setStringList("HomeRepository-fetchPost",
        nasaList.map((item) => item.toJsonString()).toList());

    print('TAMANHO LISTAAA: ${nasaList != null ? nasaList.length : 0}');

    return nasaList;
    /*
    } catch (e) {
      print(e.toString());
      var value = sharedPreferences.getStringList("HomeRepository-fetchPost");
      if (value != null)
        return value.map((item) => Nasa.fromJsonString(item)).toList();

      throw DioError(error: e.toString());
    }
    */
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
