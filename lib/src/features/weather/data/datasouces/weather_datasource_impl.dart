import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

class WeatherDataSourceImpl implements WeatherDataSouce {
  @override
  Future<WeatherModel> getCurrentWeather(int latitude, int longitude) {
    throw UnimplementedError();
  }
}
