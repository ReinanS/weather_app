import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/mocks/fixtures.dart';

void main() {
  group('to entity', () {
    test('should be a subclass of weather entity', () async {
      // assert
      final result = tWeatherModel.toEntity();
      expect(result, equals(tWeather));
    });
  });

  group('from json', () {
    test('should return a valid model from json', () async {
      // arrange
      final jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_weather_response.json'),
      );

      // act
      final result = WeatherModel.fromJson(jsonMap);

      // assert
      expect(result, equals(tWeatherModel));
    });
  });
}
