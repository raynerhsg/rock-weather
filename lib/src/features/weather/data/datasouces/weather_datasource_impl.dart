import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';
import 'package:rock_weather/src/features/weather/data/shared/weather_data_utils.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  final AppClient _client;

  WeatherDataSourceImpl(this._client);

  @override
  Future<WeatherModel> getCurrentWeather(double latitude, double longitude) async {
    try {
      final params = <String, String>{
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": WeatherDataUtils.apiKey,
        "units": "metric",
        "exclude": "minutely,hourly,alerts",
      };

      final response = await _client.get(WeatherDataUtils.url, params: params);

      switch (response.status) {
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
}
