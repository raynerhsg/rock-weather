import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/config/local/app_local.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

import '../../../../mocks/weather_mock.dart';

class MockAppClient extends Mock implements AppClient {}

class MockAppLocal extends Mock implements AppLocal {}

void main() {
  late WeatherDataSource dataSource;
  late AppClient appClient;
  late AppLocal appLocal;

  setUp(() {
    appClient = MockAppClient();
    appLocal = MockAppLocal();
    dataSource = WeatherDataSourceImpl(appClient, appLocal);
  });

  setUpAll(() => registerFallbackValue(Uri()));

  group('$WeatherDataSource', () {
    group('Get Weather | ', () {
      test(
        'Should return a Weather from external',
        () async {
          //Arrange

          final response = Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: WeatherMock.weatherReponse,
          );

          when(() => appClient.get(any(), query: any(named: 'query'))).thenAnswer((invocation) async => response);
          //Act
          final result = await dataSource.getWeather(3, 3);
          //Assert
          expect(result, isA<WeatherModel>());
          verify(() => appClient.get(any(), query: any(named: 'query'))).called(1);
        },
      );

      test(
        'Should return an Exception from external',
        () async {
          //Arrange

          when(() => appClient.get('endpoint', query: any(named: 'query'))).thenThrow(Exception());
          //Act
          //Assert
          expect(() => dataSource.getWeather(1, 2), throwsException);
          verifyNever(() => appClient.get('endpoint', query: any(named: 'query')));
        },
      );
    });
    group('Save Weather | ', () {
      test(
        'Should save Weather locally',
        () async {
          //Arrange

          when(() => appLocal.setStringList(any(), any())).thenAnswer((invocation) async => true);
          //Act
          final result = await dataSource.saveWeather([WeatherModel()]);
          //Assert
          expect(result, isTrue);
          verify(() => appLocal.setStringList(any(), any())).called(1);
        },
      );
    });
    group('Get Local Weather | ', () {
      test(
        'Should return a List of Weather from localy',
        () async {
          //Arrange

          when(() => appLocal.getStringList(any())).thenAnswer((invocation) => []);
          //Act
          final result = dataSource.getLocalWeather();
          //Assert
          expect(result, isA<List<WeatherModel>>());
          verify(() => appLocal.getStringList(any())).called(1);
        },
      );
    });
  });
}
