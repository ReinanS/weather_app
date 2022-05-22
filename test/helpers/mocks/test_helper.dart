import 'package:mockito/annotations.dart';
import 'package:weather_app/data/datasources/remote_data_source.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/use_cases/get_current_weather.dart';

@GenerateMocks([
  WeatherRepository,
  RemoteDataSource,
  GetCurrentWeather,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
