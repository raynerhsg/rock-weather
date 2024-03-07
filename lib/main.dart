import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/injection/app_injection.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/weather_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZoned(() {
    AppInjection.initInjection();
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherPage(),
    );
  }
}
