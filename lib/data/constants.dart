class Urls {
  static const String _baseUrl = 'http://api.weatherapi.com/v1/forecast.json';

  static const String _apiKey = '66eb35a4c0134ef3a23153944222403';

  static String currentWeatherByName(String city) =>
      '$_baseUrl?q=$city&key=$_apiKey';

  static String weatherIcon(String iconUrl) =>
      'https://${((iconUrl).toString().substring(2)).replaceAll("64", "128")}';
}
