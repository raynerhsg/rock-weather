import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/injection/app_injection.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_card_widget.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_loading_widget.dart';
import 'package:rock_weather/src/features/weather/presentation/states/weather_state.dart';
import 'package:rock_weather/src/features/weather/presentation/store/weather_store.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final store = getIt<WeatherStore>();

  @override
  void initState() {
    store.addListener(() => setState(() {}));
    store.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1b34),
      appBar: AppBar(
        backgroundColor: const Color(0xff191336),
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
            onPressed: () async {
              setState(() {
                store.getWeather();
              });
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
    return ListenableBuilder(
      listenable: store,
      builder: (_, __) {
        final state = store.state;

        if (state is ErrorWeather) {
          return const Center(
            child: Text('Error, try again later!'),
          );
        }
        if (state is SuccesWeather) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: state.weather.map((e) => WeatherCardWidget(weather: e)).toList(),
            ),
          );
        }
        return const WeatherLoadingListWidget();
      },
    );
  }
}
