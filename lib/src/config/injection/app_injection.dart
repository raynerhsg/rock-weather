import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:rock_weather/src/config/client/dio_client_impl.dart';
import 'package:rock_weather/src/config/connectivity/app_connectivity_impl.dart';
import 'package:rock_weather/src/config/connectivity/app_connectivy.dart';
import 'package:rock_weather/src/config/local/app_local.dart';
import 'package:rock_weather/src/config/local/app_local_impl.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource.dart';
import 'package:rock_weather/src/features/weather/data/datasouces/weather_datasource_impl.dart';
import 'package:rock_weather/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:rock_weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_weather_usecase_impl.dart';
import 'package:rock_weather/src/features/weather/presentation/store/weather_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

mixin AppInjection {
  static Future<void> initInjection() async {
    WidgetsFlutterBinding.ensureInitialized();

    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    getIt.registerLazySingleton<WeatherStore>(() => WeatherStore(getIt()));

    getIt.registerLazySingleton<AppClient>(() => DioClientImpl(getIt()));

    getIt.registerLazySingleton<AppLocal>(() => AppLocalImpl(getIt()));

    getIt.registerLazySingleton<AppConnectivity>(() => AppConnectivityImpl(getIt()));

    ///Datasources
    getIt.registerLazySingleton<WeatherDataSource>(() => WeatherDataSourceImpl(getIt(), getIt()));

    //Repositories
    getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt()));

    //Usecases
    getIt.registerLazySingleton<GetWeatherUseCase>(() => GetWeatherUsecaseImpl(getIt(), getIt()));

    final prefs = await SharedPreferences.getInstance();

    getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  }
}
