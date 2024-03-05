import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Exception, WeatherEntity>> getCurrentWeather(int latitude, int longitude);
}
