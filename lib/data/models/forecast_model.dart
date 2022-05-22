import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/forecastd_day_model.dart';
import 'package:weather_app/domain/entities/forecast.dart';

class ForecastModel extends Equatable {
  const ForecastModel({
    required this.forecastday,
  });

  final List<ForecastdayModel> forecastday;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        forecastday: List<ForecastdayModel>.from(
            json["forecastday"].map((x) => ForecastdayModel.fromJson(x))),
      );

  Forecast toEntity() =>
      Forecast(forecastday: forecastday.map((e) => e.toEntity()).toList());

  @override
  List<Object?> get props => [forecastday];
}
