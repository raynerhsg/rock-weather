// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/shared/weather_utils.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';

class GetWeatherUsecaseImpl implements GetWeatherUseCase {
  final WeatherRepository _repository;

  GetWeatherUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, List<WeatherEntity>>> call() async {
    final citiesLocation = WeatherUtils.citiesLocation;
    final weatherList = <WeatherEntity>[];

    for (var value in citiesLocation) {
      final result = await _repository.getCurrentWeather(value.latitude, value.longitude);
      result.fold(
        (error) => Left(error),
        (weather) => weatherList.add(weather),
      );
    }
    return Right(weatherList);
  }
}
