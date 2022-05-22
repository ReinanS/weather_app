import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/astro_model.dart';
import 'package:weather_app/data/models/day_model.dart';
import 'package:weather_app/data/models/hour_model.dart';
import 'package:weather_app/domain/entities/forecast_day.dart';

class ForecastdayModel extends Equatable {
  const ForecastdayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final DateTime date;
  final int dateEpoch;
  final DayModel day;
  final AstroModel astro;
  final List<HourModel> hour;

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      ForecastdayModel(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: DayModel.fromJson(json["day"]),
        astro: AstroModel.fromJson(json["astro"]),
        hour: List<HourModel>.from(
            json["hour"].map((x) => HourModel.fromJson(x))),
      );

  ForecastDay toEntity() => ForecastDay(
      date: date,
      dateEpoch: dateEpoch,
      day: day.toEntity(),
      astro: astro.toEntity(),
      hour: hour.map((e) => e.toEntity()).toList());

  @override
  List<Object?> get props => [
        date,
        dateEpoch,
        day,
        astro,
        hour,
      ];
}
