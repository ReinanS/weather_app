import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/astro.dart';

class AstroModel extends Equatable {
  const AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final String moonIllumination;

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
      );

  Astro toEntity() => Astro(
      sunrise: sunrise,
      sunset: sunset,
      moonrise: moonrise,
      moonset: moonset,
      moonPhase: moonPhase,
      moonIllumination: moonIllumination);

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        moonIllumination,
      ];
}
