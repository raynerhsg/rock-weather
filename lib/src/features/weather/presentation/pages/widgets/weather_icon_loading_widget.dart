import 'package:flutter/material.dart';

class WeatherIconLoadingWidget extends StatelessWidget {
  const WeatherIconLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
