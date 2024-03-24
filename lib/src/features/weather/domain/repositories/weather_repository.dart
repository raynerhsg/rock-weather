import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Exception, WeatherEntity>> getCurrentWeather(double latitude, double longitude);
  Future<Either<Exception, bool>> saveCurrentWeather(List<WeatherEntity> list);
  Future<Either<Exception, List<WeatherEntity>>> getLocalWeather();
}
