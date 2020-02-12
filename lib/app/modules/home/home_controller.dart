import 'dart:async';
import 'package:nasa_picture_info/app/modules/home/repositories/home_repository.dart';
import 'package:nasa_picture_info/app/shared/models/nasa_api.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final Dio dio;
  final HomeRepository repository;

  _HomeBase(this.dio, this.repository) {
    getData();
  }

  @observable
  bool hasImage = false;

  @observable
  List<NasaApi> nasaList;

  @action
  void imageVerify(int index) {
    if (nasaList[index].hdurl == null) {
      hasImage = false;
    } else {
      hasImage = true;
    }
  }

  @action
  getData() {
    repository.fetchPost().then((data) {
      nasaList = data;
    });
  }

  @action
  Future<Null> refresh() async {
    await getData();
    return null;
  }
}
