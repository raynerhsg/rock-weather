import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';
import 'package:rock_weather/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';

class MockWeatherDataSource extends Mock implements WeatherDataSource {}

void main() {
  late WeatherDataSource dataSource;
  late WeatherRepository repository;

  setUp(() {
    dataSource = MockWeatherDataSource();
    repository = WeatherRepositoryImpl(dataSource);
  });

  group('$WeatherRepository', () {
    test(
      'Should reutnr a WeatherModel converted in WeatherEntity from data source',
      () async {
        //Arrange
        final weather = WeatherModel();
        when(() => dataSource.getCurrentWeather(12, 12)).thenAnswer((invocation) async => weather);
        //Act
        final result = await repository.getCurrentWeather(12, 12);
        //Assert
        expect(result.isRight(), isTrue);
        expect(result.fold(id, id), isA<WeatherEntity>());
        verify(() => dataSource.getCurrentWeather(12, 12)).called(1);
      },
    );

    test(
      'Should reutnr an Exception from data source',
      () async {
        //Arrange
        when(() => dataSource.getCurrentWeather(12, 12)).thenThrow(Exception());
        //Act
        final result = await repository.getCurrentWeather(12, 12);
        //Assert
        expect(result.isLeft(), isTrue);
        expect(result.fold(id, id), isA<Exception>());
        verify(() => dataSource.getCurrentWeather(12, 12)).called(1);
      },
    );
  });
}
