import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });

  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final int pressure;
  final int humidity;

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cityName: map['name'] ?? '',
      main: map['weather'][0]['main'] ?? '',
      description: map['weather'][0]['description'] ?? '',
      iconCode: map['weather'][0]['icon'] ?? '',
      temperature: map['main']['temp']?.toDouble() ?? 0.0,
      pressure: map['main']['pressure']?.toInt() ?? 0,
      humidity: map['main']['humidity']?.toInt() ?? 0,
    );
  }

  factory WeatherModel.fromJson(Map<String, dynamic> source) =>
      WeatherModel.fromMap(source);

  Weather toEntity() => Weather(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        temperature: temperature,
        pressure: pressure,
        humidity: humidity,
      );

  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        pressure,
        humidity,
      ];
}
