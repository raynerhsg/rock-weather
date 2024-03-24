import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_weather/src/config/connectivity/app_connectivy.dart';
import 'package:rock_weather/src/config/utils/placemark/placemark_utils.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase_impl.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockAppConnectivity extends Mock implements AppConnectivity {}

class MockPlaceMarkUtils extends Mock implements PlaceMarkUtils {
  @override
  Future<Placemark> getPlaceMarkFromCoordinates(double latitude, double longitude) async {
    return const Placemark(
      administrativeArea: 'administrativeArea',
      country: 'country',
      isoCountryCode: 'isoCountryCode',
      locality: 'locality',
      name: 'name',
      postalCode: 'postalCode',
      subAdministrativeArea: 'subAdministrativeArea',
      subLocality: 'subLocality',
      subThoroughfare: 'subThoroughfare',
      thoroughfare: 'thoroughfare',
    );
  }
}

void main() {
  late GetWeatherUseCase usecase;
  late WeatherRepository repository;
  late AppConnectivity connectivity;
  late PlaceMarkUtils placeMarkUtils;
  setUp(() {
    repository = MockWeatherRepository();
    connectivity = MockAppConnectivity();
    placeMarkUtils = MockPlaceMarkUtils();
    usecase = GetWeatherUsecaseImpl(repository, connectivity, placeMarkUtils);
  });

  group('$GetWeatherUseCase', () {
    test(
      'Should return a list of WeatherEntity from repository locally',
      () async {
        //Arrange
        final weather = WeatherEntity(
          latitude: 1,
          longitude: 1,
          zone: 'zone',
          currentWeather: null,
          dailyWeather: null,
        );
        when(() => connectivity.isOnline()).thenAnswer((invocation) async => true);
        when(() => repository.getLocalWeather()).thenAnswer((invocation) async => const Right(<WeatherEntity>[]));
        when(() => repository.getCurrentWeather(any(), any())).thenAnswer((invocation) async => Right(weather));
        when(() => repository.saveCurrentWeather(any())).thenAnswer((invocation) async => const Right(true));

        //Act
        final result = await usecase();
        //Assert
        expect(result.isRight(), isTrue);
        expect(result.fold(id, id), isA<List<WeatherEntity>>());
        verify(() => repository.getCurrentWeather(any(), any())).called(4);
      },
    );
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
        when(() => connectivity.isOnline()).thenAnswer((invocation) async => false);
        when(() => repository.getLocalWeather()).thenAnswer((invocation) async => const Right(<WeatherEntity>[]));
        when(() => repository.getCurrentWeather(any(), any())).thenAnswer((invocation) async => Right(weather));
        when(() => repository.saveCurrentWeather(any())).thenAnswer((invocation) async => const Right(true));

        //Act
        final result = await usecase();
        //Assert
        expect(result.isRight(), isTrue);
        expect(result.fold(id, id), isA<List<WeatherEntity>>());
        verifyNever(() => repository.getCurrentWeather(any(), any()));
      },
    );
  });
}
