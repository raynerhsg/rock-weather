import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

abstract class GetCurrentWeatherUsecase {
  Future<Either<Exception, WeatherEntity>> call(int latitude, int longitude);
}
