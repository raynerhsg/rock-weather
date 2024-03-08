import 'package:rock_weather/src/features/weather/data/models/current_model.dart';
import 'package:rock_weather/src/features/weather/data/models/daily_model.dart';

class WeatherEntity {
  final double? latitude;
  final double? longitude;
  final String? zone;
  final CurrentModel? currentWeather;
  final List<DailyModel>? dailyWeather;
  WeatherEntity({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.zone = '',
    this.currentWeather,
    this.dailyWeather = const [],
  });
}
