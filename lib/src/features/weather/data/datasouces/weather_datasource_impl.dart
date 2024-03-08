import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  final AppClient _client;

  WeatherDataSourceImpl(this._client);

  @override
  Future<WeatherModel> getCurrentWeather(double latitude, double longitude) async {
    try {
      const token = 'a910b2709837b0132fa5b32219b437df';

      const url = 'https://api.openweathermap.org/data/2.5/onecall';

      final params = <String, String>{
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": token,
        "units": "metric",
        "exclude": "minutely,hourly,alerts",
      };

      final response = await _client.get(url, params: params);

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
