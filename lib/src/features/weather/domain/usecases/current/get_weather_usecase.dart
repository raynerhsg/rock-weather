import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

abstract class GetWeatherUsecase {
  Future<Either<Exception, List<WeatherEntity>>> call();
}