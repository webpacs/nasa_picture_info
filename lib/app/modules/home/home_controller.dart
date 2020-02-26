import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
import 'package:nasa_picture_info/app/shared/repositories/nasa_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final Dio dio;
  final NasaRepository nasaRepository;

  _HomeBase(this.dio, this.nasaRepository) {
    getNasaPlanetaryData();
  }

  @observable
  bool hasImage = false;

  @observable
  ObservableFuture<List<Nasa>> nasaList;

  @action
  void imageVerify(int index) {
    nasaList.then((data) {
      if (data[index].hdurl == null) {
        hasImage = false;
      } else {
        hasImage = true;
      }
    });
  }

  @action
  getNasaPlanetaryData() {
    //try {
    nasaList = nasaRepository.fetchNasaPlanetaryData().asObservable();
    /*
    } catch (e) {
      print(e.toString());
      var value = sharedPreferences.getStringList("HomeRepository-fetchPost");
      if (value != null)
        return value.map((item) => Nasa.fromJsonString(item)).toList();
    }
    */
  }

  @action
  Future<Null> refresh() async {
    await getNasaPlanetaryData();
    return null;
  }
}
