import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSouce;

  WeatherRepositoryImpl(this._dataSouce);

  @override
  Future<Either<Exception, WeatherEntity>> getCurrentWeather(double latitude, double longitude) async {
    try {
      final response = await _dataSouce.getCurrentWeather(latitude, longitude);
      return Right(response);
    } on Exception {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, WeatherEntity>> getForecastWeather(double latitude, double longitude) async {
    try {
      final response = await _dataSouce.getForecastWeather(latitude, longitude);
      return Right(response);
    } on Exception {
      return Left(Exception());
    }
  }
}
