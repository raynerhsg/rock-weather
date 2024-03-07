import 'dart:convert';

import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  final double lat;
  final double lon;
  final String timezone;
  final Current current;
  final List<Daily> daily;
  WeatherModel({
    this.lat = 0.0,
    this.lon = 0.0,
    this.timezone = '',
    required this.current,
    this.daily = const [],
  });

  WeatherModel copyWith({
    double? lat,
    double? lon,
    String? timezone,
    Current? current,
    List<Daily>? daily,
  }) {
    return WeatherModel(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      current: current ?? this.current,
      daily: daily ?? this.daily,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'current': current.toMap(),
      'daily': daily.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      lat: (map['lat'].toDouble() ?? 0.0) as double,
      lon: (map['lon'].toDouble() ?? 0.0) as double,
      timezone: (map['timezone'] ?? '') as String,
      current: Current.fromMap(map['current'] as Map<String, dynamic>),
      daily: List<Daily>.from(
        (map['daily'] as List<int>).map<Daily>(
          (x) => Daily.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int humidity;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;
  Current({
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

  Current copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    double? temp,
    double? feels_like,
    int? pressure,
    int? humidity,
    double? dew_point,
    int? uvi,
    int? clouds,
    int? visibility,
    double? wind_speed,
    int? wind_deg,
    List<Weather>? weather,
  }) {
    return Current(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      temp: temp ?? this.temp,
      feelsLike: feels_like ?? feelsLike,
      humidity: humidity ?? this.humidity,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: wind_speed ?? windSpeed,
      windDeg: wind_deg ?? windDeg,
      weather: weather ?? this.weather,
    );
  }

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
      'weather': weather.map((x) => x.toMap()).toList(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      dt: (map['dt'].toInt() ?? 0) as int,
      sunrise: (map['sunrise'].toInt() ?? 0) as int,
      sunset: (map['sunset'].toInt() ?? 0) as int,
      temp: (map['temp'].toDouble() ?? 0.0) as double,
      feelsLike: (map['feels_like'].toDouble() ?? 0.0) as double,
      humidity: (map['humidity'].toInt() ?? 0) as int,
      clouds: (map['clouds'].toInt() ?? 0) as int,
      visibility: (map['visibility'].toInt() ?? 0) as int,
      windSpeed: (map['wind_speed'].toDouble() ?? 0.0) as double,
      windDeg: (map['wind_deg'].toInt() ?? 0) as int,
      weather: List<Weather>.from(
        (map['weather'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) => Current.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  Weather({
    this.id = 0,
    this.main = '',
    this.description = '',
    this.icon = '',
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: (map['id'].toInt() ?? 0) as int,
      main: (map['main'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      icon: (map['icon'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moon_phase;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double wind_speed;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double rain;
  Daily({
    this.dt = 0,
    this.sunrise = 0,
    this.sunset = 0,
    this.moonrise = 0,
    this.moonset = 0,
    this.moon_phase = 0.0,
    required this.temp,
    required this.feelsLike,
    this.pressure = 0,
    this.humidity = 0,
    this.wind_speed = 0.0,
    this.weather = const [],
    this.clouds = 0,
    this.pop = 0.0,
    this.rain = 0.0,
  });

  Daily copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    double? moon_phase,
    Temp? temp,
    FeelsLike? feels_like,
    int? pressure,
    int? humidity,
    double? dew_point,
    double? wind_speed,
    int? wind_deg,
    double? wind_gust,
    List<Weather>? weather,
    int? clouds,
    double? pop,
    double? rain,
    double? uvi,
  }) {
    return Daily(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moon_phase: moon_phase ?? this.moon_phase,
      temp: temp ?? this.temp,
      feelsLike: feels_like ?? feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      wind_speed: wind_speed ?? this.wind_speed,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moon_phase,
      'temp': temp.toMap(),
      'feels_like': feelsLike.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'wind_speed': wind_speed,
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds,
      'pop': pop,
      'rain': rain,
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      dt: (map['dt'].toInt() ?? 0) as int,
      sunrise: (map['sunrise'].toInt() ?? 0) as int,
      sunset: (map['sunset'].toInt() ?? 0) as int,
      moonrise: (map['moonrise'].toInt() ?? 0) as int,
      moonset: (map['moonset'].toInt() ?? 0) as int,
      moon_phase: (map['moon_phase'].toDouble() ?? 0.0) as double,
      temp: Temp.fromMap(map['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLike.fromMap(map['feels_like'] as Map<String, dynamic>),
      pressure: (map['pressure'].toInt() ?? 0) as int,
      humidity: (map['humidity'].toInt() ?? 0) as int,
      wind_speed: (map['wind_speed'].toDouble() ?? 0.0) as double,
      weather: List<Weather>.from(
        (map['weather'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clouds: (map['clouds'].toInt() ?? 0) as int,
      pop: (map['pop'].toDouble() ?? 0.0) as double,
      rain: (map['rain'].toDouble() ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) => Daily.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;
  Temp({
    this.day = 0.0,
    this.min = 0.0,
    this.max = 0.0,
    this.night = 0.0,
    this.eve = 0.0,
    this.morn = 0.0,
  });

  Temp copyWith({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) {
    return Temp(
      day: day ?? this.day,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      day: (map['day'].toDouble() ?? 0.0) as double,
      min: (map['min'].toDouble() ?? 0.0) as double,
      max: (map['max'].toDouble() ?? 0.0) as double,
      night: (map['night'].toDouble() ?? 0.0) as double,
      eve: (map['eve'].toDouble() ?? 0.0) as double,
      morn: (map['morn'].toDouble() ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) => Temp.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;
  FeelsLike({
    this.day = 0.0,
    this.night = 0.0,
    this.eve = 0.0,
    this.morn = 0.0,
  });

  FeelsLike copyWith({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) {
    return FeelsLike(
      day: day ?? this.day,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory FeelsLike.fromMap(Map<String, dynamic> map) {
    return FeelsLike(
      day: (map['day'].toDouble() ?? 0.0) as double,
      night: (map['night'].toDouble() ?? 0.0) as double,
      eve: (map['eve'].toDouble() ?? 0.0) as double,
      morn: (map['morn'].toDouble() ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromJson(String source) => FeelsLike.fromMap(json.decode(source) as Map<String, dynamic>);
}
