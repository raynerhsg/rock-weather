import 'package:uno/uno.dart';

abstract class AppClient {
  Future<Response> get(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, String> params = const {},
  });
}
