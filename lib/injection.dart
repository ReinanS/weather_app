import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/remote_data_source.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/use_cases/get_current_weather.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

class Injection {
  final locator = GetIt.instance;

  void init() {
    // bloc
    locator.registerFactory(() => WeatherBloc(locator()));

    // usecase
    locator.registerLazySingleton(() => GetCurrentWeather(locator()));

    //repository
    locator.registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(remoteDataSource: locator()));

    // datasource
    locator.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: locator()));

    // external
    locator.registerLazySingleton(() => http.Client());
  }
}
