import 'dart:convert';

import 'package:rock_weather/src/features/weather/domain/entities/feels_like_entity.dart';

class FeelsLikeModel {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;
  FeelsLikeModel({
    this.day = 0.0,
    this.night = 0.0,
    this.eve = 0.0,
    this.morn = 0.0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory FeelsLikeModel.fromMap(Map<String, dynamic> map) {
    return FeelsLikeModel(
      day: map['day'].toDouble(),
      night: map['night'].toDouble(),
      eve: map['eve'].toDouble(),
      morn: map['morn'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeelsLikeModel.fromJson(String source) => FeelsLikeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension FeelsLikeExtension on FeelsLikeModel {
  FeelsLikeEntity toEntity() {
    return FeelsLikeEntity(
      day: day,
      night: night,
      eve: eve,
      morn: morn,
    );
  }
}
