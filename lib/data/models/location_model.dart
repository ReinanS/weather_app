import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/location.dart';

class LocationModel extends Equatable {
  const LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Location toEntity() => Location(
        name: name,
        region: region,
        country: country,
        lat: lat,
        lon: lon,
        tzId: tzId,
        localtimeEpoch: localtimeEpoch,
        localtime: localtime,
      );

  @override
  List<Object?> get props => [
        name,
        region,
        country,
        lat,
        lon,
        tzId,
        localtimeEpoch,
        localtime,
      ];
}
