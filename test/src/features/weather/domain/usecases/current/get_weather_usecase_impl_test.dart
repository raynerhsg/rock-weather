import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase_impl.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeatherUseCase usecase;
  late WeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    usecase = GetWeatherUsecaseImpl(repository);
  });

  group('$GetWeatherUseCase', () {
    test(
      'Should return a list of WeatherEntity from repository',
      () async {
        //Arrange
        final weather = WeatherEntity(
          latitude: 1,
          longitude: 1,
          zone: 'zone',
          currentWeather: null,
          dailyWeather: null,
        );
        when(() => repository.getCurrentWeather(any(), any())).thenAnswer((invocation) async => Right(weather));
        //Act
        final result = await usecase();
        //Assert
        expect(result.isRight(), isTrue);
        expect(result.fold(id, id), isA<List<WeatherEntity>>());
        verify(() => repository.getCurrentWeather(any(), any())).called(4);
      },
    );
  });
}
