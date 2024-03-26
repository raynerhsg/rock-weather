import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/config/injection/app_injection.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/weather_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {
  @override
  Future<Either<Exception, List<WeatherEntity>>> call() async {
    return Right(<WeatherEntity>[
      WeatherEntity(
        latitude: 12,
        longitude: 12,
        zone: 'zone',
        currentWeather: null,
        dailyWeather: null,
      ),
    ]);
  }
}

void main() {
  final getIt = GetIt.instance;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance();
    getIt.reset();
    await AppInjection.initInjection(getIt);
  });

  testWidgets('Weather Page ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: WeatherPage()));

    final pageTitle = find.byKey(const Key('PageTitle'));

    final pageTitleText = tester.widget<Text>(pageTitle).data;

    final refreshButton = find.byKey(const Key('RefreshButton'));

    final loadingWidget = find.byKey(const Key('LoadingWidget'))

    expect(pageTitle, findsOneWidget);

    expect(pageTitleText, equals('Rock Weather'));

    expect(refreshButton, findsOneWidget);

    expect(loadingWidget, findsOneWidget);
  });
}
