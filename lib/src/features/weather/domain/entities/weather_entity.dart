// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rock_weather/src/features/weather/domain/entities/current_entity.dart';
import 'package:rock_weather/src/features/weather/domain/entities/daily_entity.dart';

class WeatherEntity {
  final double? latitude;
  final double? longitude;
  final String? zone;
  final String? cityName;
  final CurrentEntity? currentWeather;
  final List<DailyEntity>? dailyWeather;
  WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.zone,
    required this.currentWeather,
    required this.dailyWeather,
    this.cityName,
  });

  WeatherEntity copyWith({
    String? cityName,
    double? latitude,
    double? longitude,
    String? zone,
    CurrentEntity? currentWeather,
    List<DailyEntity>? dailyWeather,
  }) {
    return WeatherEntity(
      cityName: cityName ?? cityName,
      latitude: latitude ?? latitude,
      longitude: longitude ?? longitude,
      zone: zone ?? zone,
      currentWeather: currentWeather ?? currentWeather,
      dailyWeather: dailyWeather ?? dailyWeather,
    );
  }
}
