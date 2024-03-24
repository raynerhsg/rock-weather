import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/config/connectivity/app_connectivy.dart';
import 'package:rock_weather/src/config/utils/placemark/placemark_utils.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/shared/weather_utils.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';

class GetWeatherUsecaseImpl implements GetWeatherUseCase {
  final WeatherRepository _repository;
  final AppConnectivity _connectivity;
  final PlaceMarkUtils _placeMarkUtils;

  GetWeatherUsecaseImpl(this._repository, this._connectivity, this._placeMarkUtils);

  @override
  Future<Either<Exception, List<WeatherEntity>>> call() async {
    final citiesLocation = WeatherUtils.citiesLocation;
    final weatherList = <WeatherEntity>[];
    final isOnline = await _connectivity.isOnline();
    final localWeather = await _repository.getLocalWeather();
    final offlineWeather = localWeather.getOrElse(() => <WeatherEntity>[]);

    if (isOnline) {
      await Future.forEach(citiesLocation, (element) async {
        final result = await _repository.getCurrentWeather(
          element.latitude,
          element.longitude,
        );

        await result.fold(
          (error) async => Left(error),
          (weather) async {
            final placeMark = await _placeMarkUtils.getPlaceMarkFromCoordinates(
              weather.latitude ?? 0,
              weather.longitude ?? 0,
            );
            final weatherCoppied = weather.copyWith(
              cityName: placeMark.locality!.isNotEmpty ? placeMark.locality : placeMark.administrativeArea,
            );
            weatherList.add(weatherCoppied);
          },
        );
      });

      await _repository.saveCurrentWeather(weatherList);

      return Right(weatherList);
    }
    return Right(offlineWeather);
  }
}
