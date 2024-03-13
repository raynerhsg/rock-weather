import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rock_weather/src/features/weather/domain/entities/weather_entity.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/weather_forecast_page.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_icon_loading_widget.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_row_information_widget.dart';

class WeatherCardWidget extends StatefulWidget {
  final WeatherEntity weather;
  const WeatherCardWidget({Key? key, required this.weather}) : super(key: key);

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidgetState();
}

class _WeatherCardWidgetState extends State<WeatherCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final icon = widget.weather.currentWeather?.weather?.first.icon;

    // if (widget.weather.cityName?.isEmpty == true) {
    //   return const SizedBox.shrink();
    // }
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => WeatherForecastPage(
              weather: widget.weather,
              cityName: widget.weather.cityName,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          key: const Key('WeatherCardWidget'),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff2b2879),
                Color(0xff34356b),
                Color(0xff2b2c44),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.weather.cityName ?? '-',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${widget.weather.currentWeather?.temp?.round()}°',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeatherRowInformationWidget(
                          title: 'Weather condition: ',
                          subTitle: '${widget.weather.currentWeather?.weather?[0].main}',
                        ),
                        WeatherRowInformationWidget(
                          title: 'Feels like: ',
                          subTitle: '${widget.weather.currentWeather?.feelsLike?.round()}°',
                        ),
                        WeatherRowInformationWidget(
                          title: 'Humidity: ',
                          subTitle: '${widget.weather.currentWeather?.humidity}%',
                        ),
                        WeatherRowInformationWidget(
                          title: 'Wind speed: ',
                          subTitle: ' ${widget.weather.currentWeather?.windSpeed}km/h',
                        ),
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: 'https://openweathermap.org/img/wn/$icon.png',
                      height: 80,
                      width: 80,
                      placeholder: (context, url) => const WeatherIconLoadingWidget(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
