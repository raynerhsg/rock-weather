import 'package:flutter/material.dart';

class WeatherSearchWidget extends StatelessWidget {
  final Function(String) onSearch;
  const WeatherSearchWidget({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff191336),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onSearch,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Search by city',
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
