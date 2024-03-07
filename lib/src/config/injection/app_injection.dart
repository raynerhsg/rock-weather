import 'package:get_it/get_it.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/config/client/uno_client_impl.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_current_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_current_weather_usecase_impl.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/forecast/get_forecast_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/forecast/get_forecast_weather_usecase_impl.dart';
import 'package:uno/uno.dart';

final GetIt getIt = GetIt.instance;

class AppInjection {
  static Future<void> initInjection() async {
    getIt.registerLazySingleton(() => Uno());
    getIt.registerLazySingleton<AppClient>(() => UnoClientImpl(getIt()));

    ///Datasources
    getIt.registerLazySingleton<WeatherDataSource>(() => WeatherDataSourceImpl(getIt()));
    //Repositories
    getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt()));
    //Usecases
    getIt.registerLazySingleton<GetCurrentWeatherUsecase>(() => GetCurrentWeatherUsecaseImpl(getIt()));
    getIt.registerLazySingleton<GetForecastWeathertUsecase>(() => GetForecastWeathertUsecaseImpl(getIt()));
  }
}
