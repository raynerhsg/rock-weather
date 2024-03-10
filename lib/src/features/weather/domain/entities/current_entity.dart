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
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });
}
