import 'package:flutter/material.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/presentation/states/weather_state.dart';

class WeatherStore extends ChangeNotifier {
  final GetWeatherUseCase _usecase;

  WeatherStore(this._usecase);

  WeatherState state = EmptyWeather();

  Future<void> getWeather() async {
    state = LoadingWeather();
    final result = await _usecase.call();

    result.fold((error) {
      state = ErrorWeather();
    }, (weather) {
      state = SuccesWeather(weather: weather);
    });
    notifyListeners();
  }
}
