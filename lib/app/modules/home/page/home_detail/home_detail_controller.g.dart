// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeDetailController on _HomeDetailControllerBase, Store {
  final _$selectedNasaItemAtom =
      Atom(name: '_HomeDetailControllerBase.selectedNasaItem');

  @override
  Nasa get selectedNasaItem {
    _$selectedNasaItemAtom.context.enforceReadPolicy(_$selectedNasaItemAtom);
    _$selectedNasaItemAtom.reportObserved();
    return super.selectedNasaItem;
  }

  @override
  set selectedNasaItem(Nasa value) {
    _$selectedNasaItemAtom.context.conditionallyRunInAction(() {
      super.selectedNasaItem = value;
      _$selectedNasaItemAtom.reportChanged();
    }, _$selectedNasaItemAtom, name: '${_$selectedNasaItemAtom.name}_set');
  }
}
