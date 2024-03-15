import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(double latitude, double longitude);
  Future<bool> saveWeather(List<WeatherModel> list);
  List<WeatherModel> getLocalWeather();
}
