import 'dart:convert';

class TempModel {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;
  TempModel({
    this.day = 0.0,
    this.min = 0.0,
    this.max = 0.0,
    this.night = 0.0,
    this.eve = 0.0,
    this.morn = 0.0,
  });

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

  factory TempModel.fromMap(Map<String, dynamic> map) {
    return TempModel(
      day: map['day'].toDouble(),
      min: map['min'].toDouble(),
      max: map['max'].toDouble(),
      night: map['night'].toDouble(),
      eve: map['eve'].toDouble(),
      morn: map['morn'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TempModel.fromJson(String source) => TempModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
