import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

abstract class GetWeatherUseCase {
  Future<Either<Exception, List<WeatherEntity>>> call();
}
