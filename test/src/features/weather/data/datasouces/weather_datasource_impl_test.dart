import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';

import '../../../../mocks/weather_mock.dart';

class MockAppClient extends Mock implements AppClient {}

void main() {
  late WeatherDataSource dataSource;
  late AppClient appClient;

  setUp(() {
    appClient = MockAppClient();
    dataSource = WeatherDataSourceImpl(appClient);
  });

  setUpAll(() => registerFallbackValue(Uri()));

  group('$WeatherDataSource', () {
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
        final result = await dataSource.getCurrentWeather(3, 3);
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
        expect(() => dataSource.getCurrentWeather(1, 2), throwsException);
        verifyNever(() => appClient.get('endpoint', query: any(named: 'query')));
      },
    );
  });
}
