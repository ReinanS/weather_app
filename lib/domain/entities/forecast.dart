import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/forecast_day.dart';

class Forecast extends Equatable {
  const Forecast({
    required this.forecastday,
  });

  final List<ForecastDay> forecastday;

  @override
  List<Object?> get props => [forecastday];
}
