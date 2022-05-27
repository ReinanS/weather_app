import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data/constants.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/pages/weather_page.dart';
import 'package:weather_app/presentation/widgets/barometer_widget.dart';
import 'package:weather_app/presentation/widgets/wind_widget.dart';

import '../../helpers/mocks/fixtures.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class FakeWeatherState extends Fake implements WeatherState {}

class FakeWeatherEvent extends Fake implements WeatherEvent {}

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
        home: body,
      ),
    );
  }

  testWidgets('text field should trigger state to change from empty to loading',
      (WidgetTester tester) async {
    // arrange
    when(() => mockWeatherBloc.state).thenReturn(WeatherEmpty());

    // act
    await tester.pumpWidget(_makeTestableWidget(const WeatherPage()));
    await tester.enterText(find.byType(TextField), 'Salvador');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    // assert
    verify(() => mockWeatherBloc.add(const OnCityChanged('Salvador')))
        .called(1);

    expect(find.byType(TextField), equals(findsOneWidget));
  });

  testWidgets('should show progress indicator when state is loading',
      (WidgetTester tester) async {
    // arrange
    when(() => mockWeatherBloc.state).thenReturn(WeatherLoading());

    // act
    await tester.pumpWidget(_makeTestableWidget(const WeatherPage()));

    // assert
    expect(find.byType(CircularProgressIndicator), equals(findsOneWidget));
  });

  testWidgets('should show widget contain weather data when state is has data',
      (WidgetTester tester) async {
    // arrange
    when(() => mockWeatherBloc.state).thenReturn(WeatherHasData(tWeather));

    // act
    await tester.pumpWidget(_makeTestableWidget(const WeatherPage()));
    // await tester.runAsync(
    //   () async {
    //     final HttpClient client = HttpClient();
    //     await client.getUrl(Uri.parse(Urls.weatherIcon(
    //         "//cdn.weatherapi.com/weather/64x64/night/116.png")));

    //     const hour = 'cdn.weatherapi.com/weather/64x64/night/176.png';

    //     await client
    //         .getUrl(Uri.parse('https://${(hour).toString().substring(2)}'));
    //   },
    // );
    // await tester.pumpAndSettle();

    // assert
    expect(find.byKey(const Key('weather_data')), equals(findsOneWidget));
    expect(find.byType(WindWidget), findsOneWidget);
    expect(find.byType(BarometerWidget), findsOneWidget);
  });
}
