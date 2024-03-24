import 'package:flutter/foundation.dart';
import 'package:rock_weather/src/config/local/app_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalImpl implements AppLocal {
  final SharedPreferences _shared;

  AppLocalImpl(this._shared);

  @override
  List<String>? getStringList(String key) {
    try {
      return _shared.getStringList(key);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await _shared.setStringList(key, value);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }
}
