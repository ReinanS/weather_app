import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/exception.dart';
import 'package:weather_app/data/failure.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late WeatherRepository repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = WeatherRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('get current weather', () {
    const tCityName = 'Salvador';

    test(
        'should return current weather when a call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getCurrentWeather(tCityName))
          .thenAnswer((realInvocation) async => tWeatherModel);

      // act
      final result = await repository.getCurrentWeather(tCityName);

      // assert
      verify(mockRemoteDataSource.getCurrentWeather(tCityName));
      expect(result, equals(Right(tWeather)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getCurrentWeather(tCityName))
          .thenThrow(ServerException());

      // act
      final result = await repository.getCurrentWeather(tCityName);

      // assert
      verify(mockRemoteDataSource.getCurrentWeather(tCityName));
      expect(result, equals(const Left(ServerFailure('Server failure'))));
    });

    test('should return connection failure when the device has no internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getCurrentWeather(tCityName))
          .thenThrow(const SocketException('Failed to connect to the network'));

      // act
      final result = await repository.getCurrentWeather(tCityName);

      // assert
      verify(mockRemoteDataSource.getCurrentWeather(tCityName));
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });
}
