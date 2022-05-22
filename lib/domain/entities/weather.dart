import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/current.dart';
import 'package:weather_app/domain/entities/forecast.dart';
import 'package:weather_app/domain/entities/location.dart';

class Weather extends Equatable {
  const Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location location;
  final Current current;
  final Forecast forecast;

  @override
  List<Object?> get props => [location, current, forecast];
}
