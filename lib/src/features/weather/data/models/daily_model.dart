import 'dart:convert';

import 'package:rock_weather/src/features/weather/data/models/feels_like_model.dart';
import 'package:rock_weather/src/features/weather/data/models/temp_model.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_information_model.dart';

class DailyModel {
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
  DailyModel({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'temp': temp?.toMap(),
      'feels_like': feelsLike?.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'wind_speed': windSpeed,
      'weather': weather?.map((x) => x.toMap()).toList(),
      'clouds': clouds,
      'pop': pop,
      'rain': rain,
    };
  }

  factory DailyModel.fromMap(Map<String, dynamic> map) {
    return DailyModel(
      dt: map['dt'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
      moonrise: map['moonrise'],
      moonset: map['moonset'],
      moonPhase: map['moon_phase'],
      temp: TempModel.fromMap(map['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLikeModel.fromMap(map['feels_like'] as Map<String, dynamic>),
      pressure: map['pressure'],
      humidity: map['humidity'],
      windSpeed: map['wind_speed'].toDouble(),
      weather: List<WeatherInformationModel>.from(
        (map['weather'] as List<dynamic>).map<WeatherInformationModel>(
          (x) => WeatherInformationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clouds: map['clouds'],
      pop: map['pop'],
      rain: map['rain'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyModel.fromJson(String source) => DailyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
