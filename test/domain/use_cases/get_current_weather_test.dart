import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/use_cases/get_current_weather.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late WeatherRepository mockWeatherRepository;
  late GetCurrentWeather usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCurrentWeather(mockWeatherRepository);
  });

  const tCityName = 'Salvador';

  test(
    'should get current weather detail from the repository',
    () async {
      // arrange
      when(mockWeatherRepository.getCurrentWeather(tCityName))
          .thenAnswer((_) async => Right(tWeather));

      // act
      final result = await usecase.execute(tCityName);

      // assert
      expect(result, equals(Right(tWeather)));
    },
  );
}
