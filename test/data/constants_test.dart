import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/constants.dart';

void main() {
  group('Test Constansts', () {
    test('Get Current Weather url by name', () async {
      const weatherUrl =
          'http://api.weatherapi.com/v1/forecast.json?q=Salvador&key=66eb35a4c0134ef3a23153944222403';

      final result = Urls.currentWeatherByName('Salvador');

      expect(weatherUrl, equals(result));
    });

    test('Get Current Weather url icon by name', () async {
      const weatherUrlIcon =
          'https://cdn.weatherapi.com/weather/128x128/day/116.png';

      final result =
          Urls.weatherIcon('//cdn.weatherapi.com/weather/64x64/day/116.png');

      expect(weatherUrlIcon, equals(result));
    });
  });
}
