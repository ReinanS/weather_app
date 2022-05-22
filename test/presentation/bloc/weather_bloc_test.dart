import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/failure.dart';
import 'package:weather_app/domain/use_cases/get_current_weather.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late GetCurrentWeather mockGetCurrentWeather;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeather = MockGetCurrentWeather();
    weatherBloc = WeatherBloc(mockGetCurrentWeather);
  });

  const tCityName = 'Salvador';

  test('initial state should be empty', () {
    expect(weatherBloc.state, WeatherEmpty());
  });

  blocTest<WeatherBloc, WeatherState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetCurrentWeather.execute(tCityName))
          .thenAnswer((_) async => Right(tWeather));

      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnCityChanged(tCityName)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      WeatherLoading(),
      WeatherHasData(tWeather),
    ],
    verify: (bloc) => verify(mockGetCurrentWeather.execute(tCityName)),
  );

  blocTest<WeatherBloc, WeatherState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockGetCurrentWeather.execute(tCityName))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnCityChanged(tCityName)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      WeatherLoading(),
      const WeatherError('Server failure'),
    ],
    verify: (bloc) => verify(mockGetCurrentWeather.execute(tCityName)),
  );
}
