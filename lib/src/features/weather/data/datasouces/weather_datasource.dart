import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getCurrentWeather(double latitude, double longitude);
}
