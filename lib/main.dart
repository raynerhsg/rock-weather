import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_weather/src/config/injection/app_injection.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/weather_page.dart';

GetIt getIt = GetIt.instance;

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await AppInjection.initInjection(getIt);

      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint(error.toString());
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      supportedLocales: [Locale('pt', 'BR'), Locale('en', 'US')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: WeatherPage(),
    );
  }
}
