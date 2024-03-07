import 'package:flutter/material.dart';
import 'package:rock_weather/src/config/client/app_client.dart';
import 'package:uno/uno.dart';

class UnoClientImpl implements AppClient {
  final Uno uno;

  UnoClientImpl(this.uno);

  @override
  Future<Response> get(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, String> params = const {},
  }) async {
    return await uno.get(endpoint, headers: headers, params: params).then((value) {
      return value;
    }).catchError((e) {
      debugPrint(e.toString());
      throw e;
    });
  }
}
