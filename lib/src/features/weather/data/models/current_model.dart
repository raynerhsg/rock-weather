import 'dart:convert';

import 'package:rock_weather/src/features/weather/data/models/weather_information_model.dart';

class CurrentModel {
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
  CurrentModel({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temp,
      'feels_like': feelsLike,
      'humidity': humidity,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'weather': weather?.map((x) => x.toMap()).toList(),
    };
  }

  factory CurrentModel.fromMap(Map<String, dynamic> map) {
    return CurrentModel(
      dt: map['dt'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
      temp: map['temp'] ?? map['temp'].toDouble(),
      feelsLike: map['feels_like'] ?? map['feels_like'].toDouble(),
      humidity: map['humidity'],
      clouds: map['clouds'],
      visibility: map['visibility'],
      windSpeed: map['wind_speed'] ?? map['wind_speed'].toDouble(),
      windDeg: map['wind_deg'],
      weather: List<WeatherInformationModel>.from(
        (map['weather'] as List<dynamic>).map<WeatherInformationModel>(
          (x) => WeatherInformationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentModel.fromJson(String source) => CurrentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
