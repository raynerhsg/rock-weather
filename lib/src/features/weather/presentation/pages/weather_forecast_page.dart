import 'package:flutter/material.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_forecast_card_widget.dart';

class WeatherForecastPage extends StatefulWidget {
  final WeatherEntity? weather;
  final String? cityName;
  const WeatherForecastPage({Key? key, required this.weather, required this.cityName}) : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1b34),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.weather!.dailyWeather!
            .map((daily) => WeatherForecastCardWidget(daily: daily))
            .skip(1)
            .take(5)
            .toList(),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: const Color(0xff191336),
      title: Text(
        widget.cityName ?? '-',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
