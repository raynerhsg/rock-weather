import 'package:rock_weather/src/features/weather/data/models/weather_information_model.dart';

class CurrentEntity {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;
  final double? feelsLike;
  final int? humidity;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final List<WeatherInformationModel>? weather;
  CurrentEntity({
    this.dt = 0,
    this.sunrise = 0,
    this.sunset = 0,
    this.temp = 0.0,
    this.feelsLike = 0.0,
    this.humidity = 0,
    this.clouds = 0,
    this.visibility = 0,
    this.windSpeed = 0.0,
    this.windDeg = 0,
    this.weather = const [],
  });
}
