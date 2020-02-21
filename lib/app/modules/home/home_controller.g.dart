// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$hasImageAtom = Atom(name: '_HomeBase.hasImage');

  @override
  bool get hasImage {
    _$hasImageAtom.context.enforceReadPolicy(_$hasImageAtom);
    _$hasImageAtom.reportObserved();
    return super.hasImage;
  }

  @override
  set hasImage(bool value) {
    _$hasImageAtom.context.conditionallyRunInAction(() {
      super.hasImage = value;
      _$hasImageAtom.reportChanged();
    }, _$hasImageAtom, name: '${_$hasImageAtom.name}_set');
  }

  final _$nasaListAtom = Atom(name: '_HomeBase.nasaList');

  @override
  ObservableFuture<List<Nasa>> get nasaList {
    _$nasaListAtom.context.enforceReadPolicy(_$nasaListAtom);
    _$nasaListAtom.reportObserved();
    return super.nasaList;
  }

  @override
  set nasaList(ObservableFuture<List<Nasa>> value) {
    _$nasaListAtom.context.conditionallyRunInAction(() {
      super.nasaList = value;
      _$nasaListAtom.reportChanged();
    }, _$nasaListAtom, name: '${_$nasaListAtom.name}_set');
  }

  final _$refreshAsyncAction = AsyncAction('refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void imageVerify(int index) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.imageVerify(index);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNasaPlanetaryData() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getNasaPlanetaryData();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
