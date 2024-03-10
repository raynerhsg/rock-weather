import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/client/app_client.dart';

class DioClientImpl implements AppClient {
  final Dio client;

  DioClientImpl(this.client);

  @override
  Future<Response> get(
    String endpoint, {
    Map<String, String> query = const {},
  }) async {
    return await client.get(endpoint, queryParameters: query).then((value) {
      debugPrint(value.data.toString());
      return value;
    }).catchError((e) {
      debugPrint(e.toString());
      throw e;
    });
  }
}
