import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/injection/app_injection.dart';
import 'package:rock_weather/src/features/weather/domain/usecases/current/get_current_weather_usecase.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Rock Weather',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              getIt<GetCurrentWeatherUsecase>().call(-23.550520, -46.633308);
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return const Column(
      children: [],
    );
  }
}
