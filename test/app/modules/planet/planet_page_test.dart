import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:nasa_picture_info/app/modules/planet/planet_page.dart';

main() {
  testWidgets('PlanetPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PlanetPage(title: 'Planet')));
    final titleFinder = find.text('Planet');
    expect(titleFinder, findsOneWidget);
  });
}
