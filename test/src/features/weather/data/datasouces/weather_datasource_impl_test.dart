import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/models/weather_model.dart';
import 'package:uno/uno.dart';

class MockAppClient extends Mock implements AppClient {}

void main() {
  late WeatherDataSource dataSource;
  late AppClient appClient;

  setUp(() {
    appClient = MockAppClient();
    dataSource = WeatherDataSourceImpl(appClient);
  });

  group('$WeatherDataSource', () {
    test(
      'Should return a Weather from external',
      () async {
        //Arrange
        final weather = WeatherModel();

        final response = Response(
          headers: {},
          request: Request(uri: Uri.parse('uri'), method: 'get', headers: {}, timeout: Duration.zero),
          status: HttpStatus.ok,
          data: jsonDecode(weather.toJson()),
        );

        when(() => appClient.get('endpoint', params: any(named: 'params'))).thenAnswer((invocation) async => response);
        //Act
        final result = await dataSource.getCurrentWeather(1, 2);
        //Assert
        expect(result, isA<WeatherModel>());
      },
    );

    test(
      'Should return an Exception from external',
      () async {
        //Arrange

        when(() => appClient.get('endpoint', params: any(named: 'params'))).thenThrow(Exception());
        //Act
        //Assert
        expect(() => dataSource.getCurrentWeather(1, 2), throwsException);
      },
    );
  });
}
