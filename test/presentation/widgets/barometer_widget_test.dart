import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/widgets/barometer_widget.dart';
import 'package:weather_app/presentation/widgets/custom_list_tile.dart';

import '../../helpers/mocks/fixtures.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets('barometer widgets components', (WidgetTester tester) async {
    const key = Key('Barometer Widget');

    await tester.pumpWidget(_makeTestableWidget(
        const BarometerWidget(current: tCurrent, key: key)));

    expect(find.byKey(key), findsOneWidget);
    expect(find.text('Barometer'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);

    expect(find.byType(CustomListTile), findsNWidgets(3));
  });
}
