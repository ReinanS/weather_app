import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/forecast_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/domain/entities/weather.dart';

//     final weatherModel = weatherModelFromJson(jsonString);

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final LocationModel location;
  final CurrentModel current;
  final ForecastModel forecast;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: LocationModel.fromJson(json["location"]),
        current: CurrentModel.fromJson(json["current"]),
        forecast: ForecastModel.fromJson(json["forecast"]),
      );

  Weather toEntity() => Weather(
        location: location.toEntity(),
        current: current.toEntity(),
        forecast: forecast.toEntity(),
      );

  @override
  List<Object?> get props => [location, current, forecast];
}
