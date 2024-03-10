import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/config/client/dio_client_impl.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase_impl.dart';
import 'package:rock_weather/src/features/weather/presentation/store/weather_store.dart';

final GetIt getIt = GetIt.instance;

class AppInjection {
  static Future<void> initInjection() async {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton<AppClient>(() => DioClientImpl(getIt()));
    getIt.registerLazySingleton<WeatherStore>(() => WeatherStore(getIt()));

    ///Datasources
    getIt.registerLazySingleton<WeatherDataSource>(() => WeatherDataSourceImpl(getIt()));
    //Repositories
    getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt()));
    //Usecases
    getIt.registerLazySingleton<GetWeatherUseCase>(() => GetWeatherUsecaseImpl(getIt()));
  }
}
