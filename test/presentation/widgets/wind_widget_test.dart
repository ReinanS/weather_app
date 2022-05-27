import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/widgets/app_colors.dart';
import 'package:weather_app/presentation/widgets/app_text_componet.dart';
import 'package:weather_app/presentation/widgets/custom_list_tile.dart';
import 'package:weather_app/presentation/widgets/wind_widget.dart';

import '../../helpers/mocks/fixtures.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets('wind widgets components', (WidgetTester tester) async {
    const key = Key('Wind Widget');

    await tester.pumpWidget(
        _makeTestableWidget(const WindWidget(current: tCurrent, key: key)));

    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(AppTextComponent), findsNWidgets(2));
    expect(find.text('Wind'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
  });
}

// tCurrent