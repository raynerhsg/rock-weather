import 'package:dartz/dartz.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/get_current_weather_usecase.dart';

class GetCurrentWeatherUsecaseImpl implements GetCurrentWeatherUsecase {
  final WeatherRepository _repository;

  GetCurrentWeatherUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, WeatherEntity>> call(int latitude, int longitude) async {
    return _repository.getCurrentWeather(latitude, longitude);
  }
}
