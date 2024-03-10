import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rock_weather/src/features/weather/domain/entities/daily_entity.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_icon_loading_widget.dart';
import 'package:rock_weather/src/features/weather/presentation/pages/widgets/weather_row_information_widget.dart';

class WeatherForecastCardWidget extends StatelessWidget {
  final DailyEntity daily;
  const WeatherForecastCardWidget({Key? key, required this.daily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
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
        child: _expansion(),
      ),
    );
  }

  Widget _expansion() {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      leading: _icon(),
      title: _expasionTitle(),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        WeatherRowInformationWidget(title: 'Humidity:', subTitle: ' ${daily.humidity}%'),
        WeatherRowInformationWidget(title: 'Morning:', subTitle: ' ${daily.temp?.morn?.round()}%'),
        WeatherRowInformationWidget(title: 'Day:', subTitle: ' ${daily.temp?.day?.round()}%'),
        WeatherRowInformationWidget(title: 'Evening:', subTitle: ' ${daily.temp?.eve?.round()}%'),
        WeatherRowInformationWidget(title: 'Night: ', subTitle: '${daily.temp?.night?.round()}°'),
        WeatherRowInformationWidget(title: 'Wind Speed: ', subTitle: '${daily.feelsLike?.day}km/h'),
      ],
    );
  }

  Widget _expasionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherRowInformationWidget(title: 'Weather condition: ', subTitle: '${daily.weather?[0].main}'),
            WeatherRowInformationWidget(title: 'Min: ', subTitle: ' ${daily.temp?.min?.round()}°'),
            WeatherRowInformationWidget(title: 'Max: ', subTitle: '${daily.temp?.max?.round()}°'),
          ],
        ),
        _day(),
      ],
    );
  }

  Widget _icon() {
    final icon = daily.weather?[0].icon;
    return CachedNetworkImage(
      imageUrl: 'https://openweathermap.org/img/wn/$icon.png',
      height: 80,
      width: 80,
      placeholder: (context, url) => const WeatherIconLoadingWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _day() {
    return Text(
      daily.day,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
