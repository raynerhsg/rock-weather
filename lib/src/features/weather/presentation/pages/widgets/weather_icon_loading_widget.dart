import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherIconLoadingWidget extends StatelessWidget {
  const WeatherIconLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xff2b2879),
      highlightColor: const Color(0xff2b2c44),
      child: Container(
        height: 15,
        width: 15,
        color: Colors.white,
      ),
    );
  }
}
