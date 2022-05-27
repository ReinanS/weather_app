import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/pages/weather_page.dart';
import 'package:weather_app/presentation/widgets/header_widget.dart';

import '../pages/weather_page_test.dart';

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUpAll(() async {
    registerFallbackValue(FakeWeatherState());
    registerFallbackValue(FakeWeatherEvent());

    final di = GetIt.instance;
    di.registerFactory(() => mockWeatherBloc);
  });

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WeatherBloc>.value(
      value: mockWeatherBloc,
      child: MaterialApp(
        home: Scaffold(body: body),
      ),
    );
  }

  testWidgets('text field components', (WidgetTester tester) async {
    // act
    await tester.pumpWidget(_makeTestableWidget(const HeaderWidget()));

    // TextField
    expect(find.byType(TextField), equals(findsOneWidget));
    expect(find.text('Search'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);

    await tester.tap(find.byIcon(Icons.location_on_outlined));
    tester.pump();
  });
}
