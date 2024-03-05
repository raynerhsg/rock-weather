import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

abstract class WeatherDataSouce {
  Future<WeatherModel> getCurrentWeather(int latitude, int longitude);
}
