import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/forecast/get_forecast_weather_usecase.dart';

class GetForecastWeathertUsecaseImpl implements GetForecastWeathertUsecase {
  final WeatherRepository _repository;

  GetForecastWeathertUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, WeatherEntity>> call(double latitude, double longitude) async {
    return _repository.getForecastWeather(latitude, longitude);
  }
}
