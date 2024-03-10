import 'package:dio/dio.dart';

abstract class AppClient {
  Future<Response> get(
    String endpoint, {
    Map<String, String> query = const {},
  });
}
