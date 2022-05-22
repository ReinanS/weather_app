import 'package:weather_app/data/models/astro_model.dart';
import 'package:weather_app/data/models/condition_model.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/day_model.dart';
import 'package:weather_app/data/models/forecast_model.dart';
import 'package:weather_app/data/models/forecastd_day_model.dart';
import 'package:weather_app/data/models/hour_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/entities/astro.dart';
import 'package:weather_app/domain/entities/condition.dart';
import 'package:weather_app/domain/entities/current.dart';
import 'package:weather_app/domain/entities/day.dart';
import 'package:weather_app/domain/entities/forecast.dart';
import 'package:weather_app/domain/entities/forecast_day.dart';
import 'package:weather_app/domain/entities/hour_model.dart';
import 'package:weather_app/domain/entities/location.dart';
import 'package:weather_app/domain/entities/weather.dart';

final tWeatherModel = WeatherModel(
  current: tCurrentModel,
  forecast: tForecastModel,
  location: tLocationModel,
);

const tCurrentModel = CurrentModel(
  lastUpdatedEpoch: 1653195600,
  lastUpdated: "2022-05-22 02:00",
  tempC: 27,
  tempF: 80.6,
  isDay: 0,
  condition: ConditionModel(
    text: "Partly cloudy",
    icon: "//cdn.weatherapi.com/weather/64x64/night/116.png",
    code: 1003,
  ),
  windMph: 13.6,
  windKph: 22.0,
  windDegree: 150,
  windDir: "SSE",
  pressureMb: 1015.0,
  pressureIn: 29.97,
  precipMm: 0,
  precipIn: 0,
  humidity: 62,
  cloud: 75,
  feelslikeC: 28.7,
  feelslikeF: 83.6,
  visKm: 10,
  visMiles: 6,
  uv: 1,
  gustMph: 25.9,
  gustKph: 41.8,
);

final tForecastModel = ForecastModel(forecastday: [
  ForecastdayModel(
    date: DateTime.parse("2022-05-22"),
    dateEpoch: 1653177600,
    day: const DayModel(
      maxtempC: 26.6,
      maxtempF: 79.9,
      mintempC: 25.4,
      mintempF: 77.7,
      avgtempC: 26.0,
      avgtempF: 78.8,
      maxwindMph: 19.2,
      maxwindKph: 31.0,
      totalprecipMm: 3.6,
      totalprecipIn: 0.14,
      avgvisKm: 10.0,
      avgvisMiles: 6.0,
      avghumidity: 68.0,
      dailyWillItRain: 1,
      dailyChanceOfRain: 89,
      dailyWillItSnow: 0,
      dailyChanceOfSnow: 0,
      condition: ConditionModel(
        text: "Patchy rain possible",
        icon: "//cdn.weatherapi.com/weather/64x64/day/176.png",
        code: 1063,
      ),
      uv: 9.0,
    ),
    astro: const AstroModel(
      sunrise: "05:47 AM",
      sunset: "05:15 PM",
      moonrise: "11:59 PM",
      moonset: "12:03 PM",
      moonPhase: "Last Quarter",
      moonIllumination: "50",
    ),
    hour: const [
      HourModel(
        timeEpoch: 1653188400,
        time: "2022-05-22 00:00",
        tempC: 26.4,
        tempF: 79.5,
        isDay: 0,
        condition: ConditionModel(
          text: "Patchy rain possible",
          icon: "//cdn.weatherapi.com/weather/64x64/night/176.png",
          code: 1063,
        ),
        windMph: 17.2,
        windKph: 27.7,
        windDegree: 153,
        windDir: "SSE",
        pressureMb: 1020.0,
        pressureIn: 30.11,
        precipMm: 0.1,
        precipIn: 0.0,
        humidity: 63,
        cloud: 84,
        feelslikeC: 27.8,
        feelslikeF: 82.0,
        windchillC: 26.4,
        windchillF: 79.5,
        heatindexC: 27.8,
        heatindexF: 82.0,
        dewpointC: 18.8,
        dewpointF: 65.8,
        willItRain: 0,
        chanceOfRain: 61,
        willItSnow: 0,
        chanceOfSnow: 0,
        visKm: 10.0,
        visMiles: 6.0,
        gustMph: 23.3,
        gustKph: 37.4,
        uv: 1.0,
      )
    ],
  ),
]);

const tLocationModel = LocationModel(
  name: "Salvador",
  region: "Bahia",
  country: "Brazil",
  lat: -12.98,
  lon: -38.52,
  tzId: "America/Bahia",
  localtimeEpoch: 1653200062,
  localtime: "2022-05-22 3:14",
);

final tWeather = Weather(
  current: tCurrent,
  forecast: tForecast,
  location: tLocation,
);

const tCurrent = Current(
  lastUpdatedEpoch: 1653195600,
  lastUpdated: "2022-05-22 02:00",
  tempC: 27,
  tempF: 80.6,
  isDay: 0,
  condition: Condition(
    text: "Partly cloudy",
    icon: "//cdn.weatherapi.com/weather/64x64/night/116.png",
    code: 1003,
  ),
  windMph: 13.6,
  windKph: 22.0,
  windDegree: 150,
  windDir: "SSE",
  pressureMb: 1015.0,
  pressureIn: 29.97,
  precipMm: 0,
  precipIn: 0,
  humidity: 62,
  cloud: 75,
  feelslikeC: 28.7,
  feelslikeF: 83.6,
  visKm: 10,
  visMiles: 6,
  uv: 1,
  gustMph: 25.9,
  gustKph: 41.8,
);

final tForecast = Forecast(forecastday: [
  ForecastDay(
    date: DateTime.parse("2022-05-22"),
    dateEpoch: 1653177600,
    day: const Day(
      maxtempC: 26.6,
      maxtempF: 79.9,
      mintempC: 25.4,
      mintempF: 77.7,
      avgtempC: 26.0,
      avgtempF: 78.8,
      maxwindMph: 19.2,
      maxwindKph: 31.0,
      totalprecipMm: 3.6,
      totalprecipIn: 0.14,
      avgvisKm: 10.0,
      avgvisMiles: 6.0,
      avghumidity: 68.0,
      dailyWillItRain: 1,
      dailyChanceOfRain: 89,
      dailyWillItSnow: 0,
      dailyChanceOfSnow: 0,
      condition: Condition(
        text: "Patchy rain possible",
        icon: "//cdn.weatherapi.com/weather/64x64/day/176.png",
        code: 1063,
      ),
      uv: 9.0,
    ),
    astro: const Astro(
      sunrise: "05:47 AM",
      sunset: "05:15 PM",
      moonrise: "11:59 PM",
      moonset: "12:03 PM",
      moonPhase: "Last Quarter",
      moonIllumination: "50",
    ),
    hour: const [
      Hour(
        timeEpoch: 1653188400,
        time: "2022-05-22 00:00",
        tempC: 26.4,
        tempF: 79.5,
        isDay: 0,
        condition: Condition(
          text: "Patchy rain possible",
          icon: "//cdn.weatherapi.com/weather/64x64/night/176.png",
          code: 1063,
        ),
        windMph: 17.2,
        windKph: 27.7,
        windDegree: 153,
        windDir: "SSE",
        pressureMb: 1020.0,
        pressureIn: 30.11,
        precipMm: 0.1,
        precipIn: 0.0,
        humidity: 63,
        cloud: 84,
        feelslikeC: 27.8,
        feelslikeF: 82.0,
        windchillC: 26.4,
        windchillF: 79.5,
        heatindexC: 27.8,
        heatindexF: 82.0,
        dewpointC: 18.8,
        dewpointF: 65.8,
        willItRain: 0,
        chanceOfRain: 61,
        willItSnow: 0,
        chanceOfSnow: 0,
        visKm: 10.0,
        visMiles: 6.0,
        gustMph: 23.3,
        gustKph: 37.4,
        uv: 1.0,
      )
    ],
  ),
]);

const tLocation = Location(
  name: "Salvador",
  region: "Bahia",
  country: "Brazil",
  lat: -12.98,
  lon: -38.52,
  tzId: "America/Bahia",
  localtimeEpoch: 1653200062,
  localtime: "2022-05-22 3:14",
);
