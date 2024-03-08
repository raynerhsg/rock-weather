import 'package:get_it/get_it.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/config/client/uno_client_impl.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase_impl.dart';
import 'package:rock_weather/src/features/weather/presentation/store/weather_store.dart';
import 'package:uno/uno.dart';

final GetIt getIt = GetIt.instance;

class AppInjection {
  static Future<void> initInjection() async {
    getIt.registerLazySingleton(() => Uno());
    getIt.registerLazySingleton<AppClient>(() => UnoClientImpl(getIt()));
    getIt.registerLazySingleton<WeatherStore>(() => WeatherStore(getIt()));

    ///Datasources
    getIt.registerLazySingleton<WeatherDataSource>(() => WeatherDataSourceImpl(getIt()));
    //Repositories
    getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt()));
    //Usecases
    getIt.registerLazySingleton<GetWeatherUsecase>(() => GetWeatherUsecaseImpl(getIt()));
  }
}
