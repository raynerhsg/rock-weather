// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

sealed class WeatherState {}

class LoadingWeather implements WeatherState {}

class SuccesWeather implements WeatherState {
  final List<WeatherEntity> weather;

  SuccesWeather({required this.weather});
}

class ErrorWeather implements WeatherState {}

class EmptyWeather implements WeatherState {}