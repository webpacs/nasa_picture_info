import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nasa_picture_info/app/modules/planet/planet_controller.dart';
import 'package:nasa_picture_info/app/modules/planet/planet_module.dart';

void main() {
  initModule(PlanetModule());
  PlanetController planet;

  setUp(() {
    planet = PlanetModule.to.get<PlanetController>();
  });

  group('PlanetController Test', () {
    test("First Test", () {
      expect(planet, isInstanceOf<PlanetController>());
    });

    test("Set Value", () {
      expect(planet.value, equals(0));
      planet.increment();
      expect(planet.value, equals(1));
    });
  });
}
