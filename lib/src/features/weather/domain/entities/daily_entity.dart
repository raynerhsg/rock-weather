import 'package:rock_weather/src/features/weather/data/models/feels_like_model.dart';
import 'package:rock_weather/src/features/weather/data/models/temp_model.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_information_model.dart';

class DailyEntity {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final num? moonPhase;
  final TempModel? temp;
  final FeelsLikeModel? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? windSpeed;
  final List<WeatherInformationModel>? weather;
  final int? clouds;
  final num? pop;
  final num? rain;
  DailyEntity({
    this.dt = 0,
    this.sunrise = 0,
    this.sunset = 0,
    this.moonrise = 0,
    this.moonset = 0,
    this.moonPhase = 0.0,
    this.temp,
    this.feelsLike,
    this.pressure = 0,
    this.humidity = 0,
    this.windSpeed = 0.0,
    this.weather = const [],
    this.clouds = 0,
    this.pop = 0.0,
    this.rain = 0.0,
  });
}
