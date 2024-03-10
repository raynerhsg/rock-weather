import 'dart:convert';

import 'package:rock_weather/src/features/weather/domain/entities/weather_information_entity.dart';

class WeatherInformationModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;
  WeatherInformationModel({
    this.id = 0,
    this.main = '',
    this.description = '',
    this.icon = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherInformationModel.fromMap(Map<String, dynamic> map) {
    return WeatherInformationModel(
      id: map['id'],
      main: (map['main'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      icon: (map['icon'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherInformationModel.fromJson(String source) =>
      WeatherInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension WeatherInformationListExtension on List<WeatherInformationModel> {
  List<WeatherInformationEntity> toEntityList() => map((e) => e.toEntity()).toList();
}

extension WeatherInformationExtension on WeatherInformationModel {
  WeatherInformationEntity toEntity() {
    return WeatherInformationEntity(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}
