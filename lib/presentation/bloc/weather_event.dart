import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class OnCityChanged extends WeatherEvent {
  final String cityName;

  const OnCityChanged(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

// class OnCityTest extends WeatherEvent {
//   final String cityName;

//   const OnCityTest(this.cityName);

//   @override
//   List<Object?> get props => [cityName];
// }
