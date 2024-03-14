// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rock_weather/src/config/connectivity/app_connectivy.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/shared/weather_utils.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';

class GetWeatherUsecaseImpl implements GetWeatherUseCase {
  final WeatherRepository _repository;
  final AppConnectivity _connectivity;

  GetWeatherUsecaseImpl(this._repository, this._connectivity);

  @override
  Future<Either<Exception, List<WeatherEntity>>> call() async {
    final citiesLocation = WeatherUtils.citiesLocation;
    final weatherList = <WeatherEntity>[];
    final isOnline = await _connectivity.isOnline();
    final localWeather = await _repository.getLocaltWeather();

    if (isOnline) {
      for (var value in citiesLocation) {
        final result = await _repository.getCurrentWeather(value.latitude, value.longitude);
        result.fold(
          (error) => Left(error),
          (weather) async {
            final placeMark = await placemarkFromCoordinates(weather.latitude ?? 0, weather.longitude ?? 0);
            final weatherCoppied = weather.copyWith(
              cityName:
                  placeMark.first.locality!.isNotEmpty ? placeMark.first.locality : placeMark.first.administrativeArea,
            );
            weatherList.add(weatherCoppied);
          },
        );
      }

      if (weatherList.length == 4) {
        await _repository.saveCurrentWeather(weatherList);
      }

      return Right(weatherList);
    }
    return Right(localWeather.getOrElse(() => []));
  }
}
