import 'package:flutter/material.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/presentation/states/weather_state.dart';

class WeatherStore extends ChangeNotifier {
  final GetWeatherUseCase _usecase;

  WeatherStore(this._usecase);

  WeatherState state = ErrorWeather();

  var _weatherList = <WeatherEntity>[];

  List<WeatherEntity> get weatherList => _weatherList;

  Future<void> getWeather() async {
    state = LoadingWeather();
    final result = await _usecase.call();

    result.fold((error) {
      state = ErrorWeather();
    }, (weather) {
      _weatherList = weather;
      state = SuccesWeather(weather: weather);
    });
    notifyListeners();
  }

  Future<void> filterByCity(String city) async {
    final filtered = _weatherList.where((element) {
      return element.cityName?.toLowerCase().contains(city.toLowerCase()) ?? false;
    }).toList();

    state = SuccesWeather(weather: filtered);
    notifyListeners();
  }
}
