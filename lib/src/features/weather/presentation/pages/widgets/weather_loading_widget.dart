import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherLoadingListWidget extends StatelessWidget {
  final int itemCount;
  const WeatherLoadingListWidget({Key? key, this.itemCount = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('LoadingWidget'),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Shimmer.fromColors(
        baseColor: const Color(0xff2b2879),
        highlightColor: const Color(0xff2b2c44),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (_, __) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 100,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
