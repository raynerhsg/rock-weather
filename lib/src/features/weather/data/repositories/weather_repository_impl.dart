import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Either<Exception, WeatherEntity>> getCurrentWeather(int latitude, int longitude) {
    throw UnimplementedError();
  }
}
