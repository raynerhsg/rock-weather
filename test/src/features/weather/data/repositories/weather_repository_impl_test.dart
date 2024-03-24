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
    group('Get Current Weather | ', () {
      test(
        'Should return a WeatherModel converted in WeatherEntity from data source',
        () async {
          //Arrange
          final weather = WeatherModel();
          when(() => dataSource.getWeather(12, 12)).thenAnswer((invocation) async => weather);
          //Act
          final result = await repository.getCurrentWeather(12, 12);
          //Assert
          expect(result.isRight(), isTrue);
          expect(result.fold(id, id), isA<WeatherEntity>());
          verify(() => dataSource.getWeather(12, 12)).called(1);
        },
      );

      test(
        'Should return an Exception from data source',
        () async {
          //Arrange
          when(() => dataSource.getWeather(12, 12)).thenThrow(Exception());
          //Act
          final result = await repository.getCurrentWeather(12, 12);
          //Assert
          expect(result.isLeft(), isTrue);
          expect(result.fold(id, id), isA<Exception>());
          verify(() => dataSource.getWeather(12, 12)).called(1);
        },
      );
    });

    group('Save Current Weather | ', () {
      test(
        'Should save a List of WeatherEntity localy',
        () async {
          //Arrange
          final weatherEntityList = <WeatherEntity>[];
          final weatherModelList = <WeatherModel>[];

          when(() => dataSource.saveWeather(weatherModelList)).thenAnswer((invocation) async => true);
          //Act
          final result = await repository.saveCurrentWeather(weatherEntityList);
          //Assert
          expect(result.isRight(), isTrue);
          expect(result.fold(id, id), isA<bool>());
          verify(() => dataSource.saveWeather(weatherModelList)).called(1);
        },
      );

      test(
        'Should return an Exception from data source',
        () async {
          final weatherEntityList = <WeatherEntity>[];
          final weatherModelList = <WeatherModel>[];
          //Arrange
          when(() => dataSource.saveWeather(weatherModelList)).thenThrow(Exception());
          //Act
          final result = await repository.saveCurrentWeather(weatherEntityList);
          //Assert
          expect(result.isLeft(), isTrue);
          expect(result.fold(id, id), isA<Exception>());
          verify(() => dataSource.saveWeather(weatherModelList)).called(1);
        },
      );
    });
    group('Get Local Weather | ', () {
      test(
        'Should return a WeatherModel converted in WeatherEntity from data source',
        () async {
          //Arrange
          final weather = [WeatherModel()];
          when(() => dataSource.getLocalWeather()).thenAnswer((invocation) => weather);
          //Act
          final result = await repository.getLocalWeather();
          //Assert
          expect(result.isRight(), isTrue);
          expect(result.fold(id, id), isA<List<WeatherEntity>>());
          verify(() => dataSource.getLocalWeather()).called(1);
        },
      );

      test(
        'Should return an Exception from data source',
        () async {
          //Arrange
          when(() => dataSource.getLocalWeather()).thenThrow(Exception());
          //Act
          final result = await repository.getLocalWeather();
          expect(result.isLeft(), isTrue);
          expect(result.fold(id, id), isA<Exception>());
          verify(() => dataSource.getLocalWeather()).called(1);
        },
      );
    });
  });
}
