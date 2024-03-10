import 'dart:convert';

import 'package:rock_weather/src/features/weather/data/models/current_model.dart';
import 'package:rock_weather/src/features/weather/data/models/daily_model.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

class WeatherModel {
  final double? lat;
  final double? lon;
  final String? timezone;
  final CurrentModel? current;
  final List<DailyModel>? daily;
  WeatherModel({
    this.lat = 0.0,
    this.lon = 0.0,
    this.timezone = '',
    this.current,
    this.daily = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'current': current?.toMap(),
      'daily': daily?.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      lat: map['lat'],
      lon: map['lon'],
      timezone: (map['timezone'] ?? '') as String,
      current: CurrentModel.fromMap(map['current'] as Map<String, dynamic>),
      daily: List<DailyModel>.from(
        (map['daily'] as List<dynamic>).map<DailyModel>(
          (x) => DailyModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension WeatherExtension on WeatherModel {
  WeatherEntity toEntity() {
    return WeatherEntity(
      latitude: lat,
      longitude: lon,
      zone: timezone,
      currentWeather: current?.toEntity(),
      dailyWeather: daily?.toEntityList(),
    );
  }
}
