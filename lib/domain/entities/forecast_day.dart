import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/astro.dart';
import 'package:weather_app/domain/entities/day.dart';
import 'package:weather_app/domain/entities/hour_model.dart';

class ForecastDay extends Equatable {
  const ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final DateTime date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  @override
  List<Object?> get props => [
        date,
        dateEpoch,
        day,
        astro,
        hour,
      ];
}
