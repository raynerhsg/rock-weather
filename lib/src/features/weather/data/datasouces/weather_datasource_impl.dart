import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/config/local/app_local.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';
import 'package:rock_weather/src/features/weather/data/shared/weather_data_utils.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  final AppClient _client;
  final AppLocal _local;

  WeatherDataSourceImpl(this._client, this._local);

  final weatherKey = 'WAETHER_LOCAL';

  @override
  Future<WeatherModel> getWeather(double latitude, double longitude) async {
    try {
      final query = <String, String>{
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": WeatherDataUtils.apiKey,
        "units": "metric",
        "exclude": "minutely,hourly,alerts",
      };

      final response = await _client.get(WeatherDataUtils.url, query: query);

      switch (response.statusCode) {
        case HttpStatus.ok:
          final json = jsonEncode(response.data);
          return WeatherModel.fromJson(json);
        default:
          throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());

      throw Exception();
    }
  }

  @override
  Future<bool> saveWeather(List<WeatherModel> list) {
    try {
      final json = list.map((e) => e.toJson()).toList();
      return _local.setStringList(weatherKey, json);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  @override
  List<WeatherModel> getLocalWeather() {
    try {
      final json = _local.getStringList(weatherKey);
      if (json != null) {
        print('JSON => ${json[0]}');
        return json.map((e) => WeatherModel.fromJson(e)).toList();
      }
      return <WeatherModel>[];
    } catch (e) {
      debugPrint(e.toString());

      throw Exception();
    }
  }
}
