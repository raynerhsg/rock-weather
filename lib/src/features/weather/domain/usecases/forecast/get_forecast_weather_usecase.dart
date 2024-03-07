import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';

abstract class GetForecastWeathertUsecase {
  Future<Either<Exception, WeatherEntity>> call(double latitude, double longitude);
}
