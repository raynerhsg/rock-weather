import 'dart:convert';

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
        "units": "metrics",
        "exclude": "minutely,hourly,alerts",
      };

      final response = await _client.get(url, params: params);

      switch (response.status) {
        case 200:
          return WeatherModel.fromJson(jsonDecode(response.data));
        default:
          throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  @override
  Future<WeatherModel> getForecastWeather(double latitude, double longitude) async {
    try {
      const token = 'a910b2709837b0132fa5b32219b437df';

      const url = 'api.openweathermap.org/data/2.5/forecast';

      final headers = <String, String>{
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": token,
      };

      final response = await _client.get(url, headers: headers);

      switch (response.status) {
        case 200:
          return WeatherModel.fromJson(jsonDecode(response.data));
        default:
          throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }
}
