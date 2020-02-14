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
  List<Nasa> nasaList;

  @action
  void imageVerify(int index) {
    if (nasaList[index].hdurl == null) {
      hasImage = false;
    } else {
      hasImage = true;
    }
  }

  @action
  getNasaPlanetaryData() {
    nasaRepository.fetchNasaPlanetaryData().then((data) {
      nasaList = data;
    });
  }

  @action
  Future<Null> refresh() async {
    await getNasaPlanetaryData();
    return null;
  }
}
