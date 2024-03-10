import 'package:intl/intl.dart';
import 'package:rock_weather/src/features/weather/domain/entities/feels_like_entity.dart';
import 'package:rock_weather/src/features/weather/domain/entities/temp_entity.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_information_entity.dart';

class DailyEntity {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final num? moonPhase;
  final TempEntity? temp;
  final FeelsLikeEntity? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? windSpeed;
  final List<WeatherInformationEntity>? weather;
  final int? clouds;
  final num? pop;
  final num? rain;
  DailyEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
  });

  String get day {
    final date = DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
    final dateConverted = DateFormat(DateFormat.ABBR_WEEKDAY).format(date);
    return dateConverted;
  }
}
