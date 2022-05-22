import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/constants.dart';
import 'package:weather_app/data/datasources/remote_data_source.dart';
import 'package:weather_app/data/exception.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../../helpers/json_reader.dart';

import 'package:http/http.dart' as http;

import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSource dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get current weather', () {
    const tCityName = 'Jakarta';
    final tWeatherModel = WeatherModel.fromJson(json
        .decode(readJson('helpers/dummy_data/dummy_weather_response.json')));

    test('should return weather model when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(Uri.parse(Urls.currentWeatherByName(tCityName))),
      ).thenAnswer(
        (_) async => http.Response(
            readJson('helpers/dummy_data/dummy_weather_response.json'), 200),
      );

      // act
      final result = await dataSource.getCurrentWeather(tCityName);

      // assert
      expect(result, equals(tWeatherModel));
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(Uri.parse(Urls.currentWeatherByName(tCityName))),
      ).thenAnswer(
        (_) async => http.Response('Not found', 404),
      );

      // act
      final call = dataSource.getCurrentWeather(tCityName);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  // group('get current icon image', () async {
  //   const weatherIcon =
  //       'https://cdn.weatherapi.com/weather/64x64/night/176.png';

  //   when(mockHttpClient.get(Uri.parse(weatherIcon)))
  //       .thenAnswer((_) async => http.Response(''));
  // });
}
