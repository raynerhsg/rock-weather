import 'package:flutter/material.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherPage(),
    );
  }
}
